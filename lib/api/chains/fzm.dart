// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:fwallet/api/config.dart';
import 'package:fwallet/api/fzm_http.dart';
import 'package:fwallet/utils/app_utils.dart';

import '../wapi.dart';
import '../tx.dart';

class FzmWApi extends WApi {
  static const MethodChannel _channel = MethodChannel('channel_wallet');
  final String chain;

  FzmWApi({required this.chain})
      : super(
          config: ChainConfig(
            name: chain,
            nativeToken: chain == BTY ? 'BTY' : 'YCC',
            scanUrl: GO_URL,
          ),
        );

  static const String YCC = 'YCC';
  static const String BTY = 'BTY';

  static final YCCWApi = FzmWApi(chain: YCC);
  static final BTYWApi = FzmWApi(chain: BTY);

  // @override
  // Future<String?> getTx(String txHash) async {
  //   return await _getTxById(chain, '', txHash, config.scanUrl!);
  // }

  Future<String?> getTxById(
      String chain, String tokenSymbol, String txid, String goNoderUrl) async {
    try {
      final String tx = await _channel.invokeMethod('getTxById', {
        'chain': chain,
        'tokenSymbol': tokenSymbol,
        'txid': txid,
        'goNoderUrl': goNoderUrl
      });
      return tx;
    } catch (e) {
      Log.w(e.toString());
      rethrow;
    }
  }

  @override
  Future<TxFee> getTxFee() async {
    final resp = await Http.of().get(TXFEE, queryParameters: {"name": chain});
    return TxFee.fromJson(resp.data);
  }

  @override
  Future<List<Tx>> getTxList(
    String addr, {
    int page = 1,
    int limit = 100,
    int startBlock = 0,
    String? contractAddr,
    String? tokenSymbol,
  }) async {
    final resp = await _getTxList(addr, tokenSymbol!, 0, page, limit);
    if (resp == null) {
      throw Exception('Failed to load tx list');
    }
    final json = jsonDecode(resp);
    final list = (json['result'] as List)
        .map((e) => Tx.fromEthereum(e, chain: chain))
        .toList();
    return list;
  }

  Future<String?> _getTxList(
      String addr, String tokenSymbol, int type, int page, int count) async {
    final String resp = await _channel.invokeMethod('getTxList', {
      'addr': addr,
      'chain': chain,
      'tokenSymbol': tokenSymbol,
      'type': type,
      'page': page,
      'count': count
    });
    return resp;
  }

  @override
  Future<double?> getBalance(String acc,
      {String? contractAddr, String? tokenSymbol}) async {
    final resp = await _channel.invokeMethod('getBalance', {
      'address': acc,
      'chain': chain,
      'tokenSymbol': tokenSymbol,
    });
    final json = jsonDecode(resp);
    if (json['error'] != null) {
      throw Exception(json['error']);
    }
    return double.parse(json['result']['balance']);
  }

  @override
  Future<String?> sendToken(String privateKey, TokenTxArgs args) async {
    try {
      // final fromAddr = args.froms.isEmpty
      //     ? WalletApi()
      //         .pubToAddr(chain, (WalletApi().privToPub(chain, privateKey)))
      //     : args.froms.first;
      final fromAddr = args.froms.first;
      final String tx = await _channel.invokeMethod('sendToken', {
        'chain': chain,
        'privateKey': privateKey,
        'fromAddr': fromAddr,
        'toAddr': args.to,
        'amount': args.amount,
        'fee': args.fee,
        'tokenSymbol': args.token.symbol,
        'note': args.note
      });
      return tx;
    } catch (e) {
      Log.w(e.toString());
      rethrow;
    }
  }
}

// Future<Uint8List?> signTx(Tx tx, String privateKey) async {
//   try {
//     final signedData = await _channel.invokeMethod(
//         'signTx', {'chain': tx.chain, 'tx': tx.txData, 'privateKey': privateKey});
//     return signedData;
//   } catch (e) {
//     Log.w(e.toString());
//     return null;
//   }
// }

// Future<Tx?> sendTxWithPriv(String privateKey, Tx tx) async {
//   try {
//     final signedTx = await signTx(tx, privateKey);
//     if (signedTx == null) {
//       return null;
//     }
//     final raw = await sendTx(tx.chain, signedTx, tx.tokenSymbol!);
//     raw!.signedTx = signedTx;
//     return raw;
//   } catch (e) {
//     Log.w(e.toString());
//     return null;
//   }
// }

// Future<List<int>> stringToByte(String str) async {
//   try {
//     final List<int> byteArray =
//         await _channel.invokeMethod('stringToByte', {'str': str});
//     return byteArray;
//   } catch (e) {
//     Log.w(e.toString());
//     return [];
//   }
// }

// Future<String?> byteToString(List<int> byteArray) async {
//   final String str =
//       await _channel.invokeMethod('byteToString', {'byteArray': byteArray});
//   return str;
// }

// Future<List<int>> hexToByte(String hex) async {
//   final List<int> byteArray =
//       await _channel.invokeMethod('hexToByte', {'hex': hex});
//   return byteArray;
// }

// Future<String?> signTxGroup(String execer, String createTx, String txPriv,
//     String feePriv, double btyfee, int addressId, int sysAddressid) async {
//   try {
//     final String signedTx = await _channel.invokeMethod('signTxGroup', {
//       'execer': execer,
//       'createTx': createTx,
//       'txPriv': txPriv,
//       'feePriv': feePriv,
//       'btyfee': btyfee,
//       'addressId': addressId,
//       'sysAddressid': sysAddressid
//     });
//     return signedTx;
//   } catch (e) {
//     Log.w(e.toString());
//     return null;
//   }
// }

// Future<Tx?> sendTx(String chain, Uint8List tx, String tokenSymbol) async {
//   try {
//     final String txData = await _channel.invokeMethod('sendTx',
//         {'chain': chain, 'signData': tx, 'tokenSymbol': tokenSymbol});
//     return Tx(
//         chain: chain,
//         to: '',
//         amount: 0,
//         txData: txData,
//         tokenSymbol: tokenSymbol);
//   } catch (e) {
//     Log.w(e.toString());
//     return null;
//   }
// }