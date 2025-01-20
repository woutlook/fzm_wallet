// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'dart:math';
import 'package:fixnum/fixnum.dart';
import 'package:blockchain_utils/blockchain_utils.dart' as chains;
import 'package:blockchain_utils/signer/bitcoin_signer.dart' as btc_signer;

import 'package:fzm_wallet/models/chain33_http.dart';
import 'package:fzm_wallet/models/tx.dart';
import 'package:fzm_wallet/models/wapi.dart';
import 'package:fzm_wallet/models/pb/transaction.pb.dart';
import 'package:fzm_wallet/models/pb/coins.pb.dart';

const String YCC = 'YCC';
const String BTY = 'BTY';
const String BTY0x = 'BTY0x';

class Chain33Api extends WApi {
  Chain33Api({required super.config});

  @override
  Future<Fee> getFee({int? txSize}) async {
    const minFeeRate = 100000;
    const k = 1000;
    txSize ??= k;
    if (txSize < k) {
      txSize = k;
    }
    final realFee = txSize / k * minFeeRate;
    final baseFee = realFee / 1e8;
    final lowFee = baseFee;
    final highFee = baseFee * 3;
    final avgFee = baseFee;
    return Fee(
      name: config.name,
      high: highFee,
      low: lowFee,
      average: avgFee,
      base: baseFee,
    );
  }

  @override
  Future<List<Tx>> getTxsByAddress(TxListArgs args) async {
    return _getTxsByAddress(args);
  }

  Future<List<Tx>> _getTxsByAddress(TxListArgs args) async {
    final client = JsonRpcClient(config.rpcUrl!);
    final resp = await client.callMethod('Chain33.GetTxByAddr', [
      {
        'addr': args.accountAddress,
        'count': args.limit,
        'direction': 0,
        'height': -1,
        'index': 0,
        'flag': 0
      }
    ]);
    final result = resp['result'];
    if (result == null) {
      throw Exception('Failed to get tx list');
    }
    final txInfos = result['txInfos'];
    final hashs = txInfos.map((tx) => tx['hash']).toList();
    final list = hashs.map((hash) async {
      try {
        final tx = await _getTx(hash, client);
        return tx;
      } catch (e) {
        return null;
      }
    }).toList();
    return list.where((tx) => tx != null).toList();
  }

  // Tx? _fromChain33Tx(Transaction tx, String hash) {
  //   final pubKey = tx.signature.pubkey;
  //   final from = walletApi.pubToAddr(config.name, chains.hex.encode(pubKey));
  //   if (tx.execer == 'coins'.codeUnits) {
  //     final action = CoinsAction.fromBuffer(tx.payload);
  //     return Tx(
  //       tokenSymbol: action.transfer.cointoken,
  //       tokenName: action.transfer.cointoken,
  //       chain: config.name,
  //       from: from,
  //       to: action.transfer.to,
  //       fee: BigInt.from(tx.fee.toInt()),
  //       status: 0,
  //       hash: hash,
  //       value: BigInt.from(action.transfer.amount.toInt()),
  //     );
  //   }
  //   return null;
  // }

  @override
  Future<List<Tx>> getTxList(
    String addr, {
    int page = 1,
    int limit = 100,
    int startBlock = 0,
    String? chain,
    String? contractAddr,
    String? tokenSymbol,
  }) async {
    final list = await _getTxList(addr, limit);
    return list;
  }

  Future<List<Tx>> _getTxList(String addr, int count) async {
    final client = JsonRpcClient(config.rpcUrl!);
    final resp = await client.callMethod('Chain33.GetTxByAddr', [
      {
        'addr': addr,
        'count': count,
        'direction': 0,
        'height': -1,
        'index': 0,
        'flag': 0
      }
    ]);
    final result = resp['result'];
    if (result == null) {
      return [];
    }
    final txInfos = result['txInfos'];
    final txHashs =
        txInfos.map((tx) => tx['hash']).where((hash) => hash != null).toList();
    final list = await Future.wait<Tx?>(txHashs.map<Future<Tx?>>((hash) async {
      try {
        final tx = await _getTx(hash, client);
        return tx;
      } catch (e) {
        return null;
      }
    }).toList());
    return list.whereType<Tx>().toList();
  }

  @override
  Future<double?> getBalance(String who,
      {String? contractAddr, String? tokenSymbol}) async {
    final client = JsonRpcClient(config.rpcUrl!);
    final resp = await client.callMethod('Chain33.GetBalance', [
      {
        'addresses': [who]
      }
    ]);
    final err = resp['error'];
    if (err != null) {
      throw Exception('Failed to get balance: $err');
    }
    final result = resp['result'][0];
    final balance = result['balance'];
    return balance / pow(10, 8);
  }

  @override
  Future<Tx> sendToken(
      {required String privateKey, required TokenTxArgs args}) async {
    final tx = _createTx(args: args);
    final txData = _signTx(privateKey: privateKey, tx: tx);
    if (txData.isEmpty) {
      throw Exception('Failed to sign tx');
    }
    final rawTx = await _sendRawTx(txData);
    if (rawTx == null) {
      throw Exception('Failed to send tx');
    }
    return rawTx;
  }

  BigInt _toBigInt(double value, int decimals) {
    return BigInt.from(value * pow(10, decimals));
  }

  // only for test
  Transaction createTx_test({required TokenTxArgs args}) {
    return _createTx(args: args);
  }

  Future<Transaction?> createTx_test2({required TokenTxArgs args}) async {
    return _createTx2(args: args);
  }

  Future<Transaction?> _createTx2({required TokenTxArgs args}) async {
    final client = JsonRpcClient(config.rpcUrl!);
    final resp = await client.callMethod('Chain33.CreateTransaction', [
      {
        'execer': 'coins',
        'actionName': 'Transfer',
        'payload': {
          'to': args.to,
          'amount': '100000000',
        },
        'to': args.to,
      }
    ]);
    final result = resp['result'] as String;
    final tx = Transaction.fromBuffer(chains.BytesUtils.fromHexString(result));
    tx.to = args.to; // fuck this..., why server set a diff address to tx.to?
    return tx;
  }

  Transaction _createTx({required TokenTxArgs args}) {
    final bigIntAmount = _toBigInt(args.amount, config.decimals);
    final bigIntFee = _toBigInt(args.fee ?? 0, config.decimals);
    if (args.token.chain == YCC ||
        args.token.chain == BTY ||
        args.token.chain == BTY0x) {
      final action = CoinsAction(
        transfer: AssetsTransfer(
          to: args.to,
          amount: Int64(bigIntAmount.toInt()),
          note: args.note?.codeUnits ?? [],
        ),
        ty: 1, // don't forget set this
      );

      final tx = Transaction(
        execer: 'coins'.codeUnits,
        payload: action.writeToBuffer(),
        fee: Int64(bigIntFee.toInt()),
        to: args.to,
        nonce: Int64(
            Random(DateTime.now().millisecondsSinceEpoch).nextInt(1 << 32 - 1)),
        expire: Int64(DateTime.now().millisecondsSinceEpoch + 1000 * 60 * 10),
        chainID: config.chainId,
      );
      return tx;
    } else {
      throw Exception('Unsupported chain');
    }
  }

  // only for test
  List<int> signTx_test({
    required String privateKey,
    required Transaction tx,
  }) {
    return _signTx(privateKey: privateKey, tx: tx);
  }

  List<int> _signTxBTY({
    required String privateKey,
    required Transaction tx,
    required int type,
  }) {
    tx.expire = Int64(DateTime.now().millisecondsSinceEpoch + 1000 * 60 * 10);
    final data = tx.writeToBuffer();
    final hash = chains.QuickCrypto.sha256Hash(data);
    final keyBytes = chains.BytesUtils.fromHexString(privateKey);
    final signer = btc_signer.BitcoinSigner.fromKeyBytes(keyBytes);
    final sig = signer.signTransaction(hash);
    tx.signature = Signature();
    tx.signature.signature = sig;
    tx.signature.pubkey = signer.signingKey.privateKey.publicKey.toBytes();
    tx.signature.ty = type;
    return tx.writeToBuffer();
  }

  List<int> _signTx({
    required String privateKey,
    required Transaction tx,
  }) {
    if (config.nativeToken == YCC || config.nativeToken == BTY0x) {
      return _signTxBTY(privateKey: privateKey, tx: tx, type: 2 << 12 | 1);
    } else if (config.nativeToken == BTY) {
      return _signTxBTY(privateKey: privateKey, tx: tx, type: 1);
    } else {
      throw Exception('Unsupported chain');
    }
  }

  Future<Tx?> _sendRawTx(List<int> txData) async {
    final hexTx = chains.BytesUtils.toHexString(txData);
    final client = JsonRpcClient(config.rpcUrl!);
    final resp = await client.callMethod('Chain33.SendTransaction', [
      {'data': hexTx}
    ]);
    if (resp['error'] != null) {
      final err = resp['error'];
      throw Exception('Failed to send tx: $err');
    }
    // Wait for tx to be confirmed
    await Future.delayed(const Duration(seconds: 10));
    final txHash = resp['result'];
    final tx = await _getTx(txHash, client);
    return tx;
  }

// ignore: slash_for_doc_comments
/**
 "tx": {
      "execer": "coins",
      "payload": {
        "transfer": {
          "cointoken": "",
          "amount": "100000000",
          "note": null,
          "to": "1JvhkjuebpLJ1ZHGXyCTDHyct5taUzgRRt"
        },
        "ty": 1
      },
      "rawPayload": "0x18010a291080c2d72f2222314a76686b6a756562704c4a315a4847587943544448796374357461557a67525274",
      "signature": {
        "ty": 1,
        "pubkey": "0x03c829db8d36c6761331357bbdbd5918a13a61ed15ed6079fcd3ba3fbfbe6c4f56",
        "signature": "0x30440220715c854fd0abaa6515e9cc3abac928624744d077dc796a6470757b2042d53f1602202ec25a4f2c0041dd5a9f44d3e44d8acace74a7bbce3775a91fdc38affe9e8dd3"
      },
      "fee": 100000,
      "feefmt": "0.0010",
      "expire": 1735304961156,
      "nonce": 5925842066572075903,
      "from": "15AvnuWS9ELE7R1NDfrJotjmjB8R7QqkPr",
      "to": "1JvhkjuebpLJ1ZHGXyCTDHyct5taUzgRRt",
      "amount": 100000000,
      "amountfmt": "1.0000",
      "hash": "0x57fac1199af0284adc6f818f1cf4fb822b0345b649845bb1690e056ff95064b4"
    },
    "receipt": {
    ----------------
    }
*/

  Future<Tx> _getTx(String hash, client) async {
    final resp = await client.callMethod('Chain33.QueryTransaction', [
      {'hash': hash}
    ]);
    final err = resp['error'];
    if (err != null) {
      throw Exception('Failed to get tx by hash: $err');
    }
    final result = resp['result'];
    final tx = result['tx'];
    if (tx == null) {
      throw Exception('Failed to get tx by hash');
    }
    if (tx['execer'] != 'coins') {
      throw Exception('Unsupported execer');
    }
    final symbol = config.nativeToken;
    return Tx(
      tokenSymbol: symbol,
      tokenName: symbol,
      decimals: 8,
      chain: config.name,
      from: tx['from'],
      to: tx['to'],
      status: 0,
      hash: hash,
      value: double.parse(tx['amountfmt']),
      blockNumber: result['height'],
      timestamp: result['blockTime'],
      fee: double.parse(tx['feefmt']),
    );
  }
}
