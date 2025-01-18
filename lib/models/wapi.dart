// ignore_for_file: non_constant_identifier_names, constant_identifier_names

import 'package:blockchain_utils/blockchain_utils.dart' as chains;
import 'package:fzm_wallet/models/evm.dart';
import 'package:fzm_wallet/models/chain33.dart';
import 'package:fzm_wallet/models/trx.dart';
import 'package:fzm_wallet/utils/app_utils.dart';

import 'package:fzm_wallet/models/tx.dart';
import 'package:fzm_wallet/models/config.dart';

enum BTCAddressType { bip44, bip49, bip84, bip86 }

final chainNameMap = {
  'BTY': chains.Bip44Coins.bitcoin,
  'YCC': chains.Bip44Coins.ethereum,
  'ETH': chains.Bip44Coins.ethereum,
  'BNB': chains.Bip44Coins.binanceSmartChain,
  'TRX': chains.Bip44Coins.tron,
};

List<int> hexToBytes(String s) {
  return chains.BytesUtils.fromHexString(s);
}

String bytesToHex(List<int> b) {
  return chains.BytesUtils.toHexString(b);
}

String hashData(String data) {
  final hash = chains.SHA256.hash(data.codeUnits);
  return bytesToHex(hash);
}

// String encryptData(String data, String password) {
//   final encrypter = _getEncrypter(password);
//   final encdata = encrypter.encrypt(data);
//   return encdata.base64;
// }

// encrypt.Encrypter _getEncrypter(String password) {
//   final passHash = chains.SHA256.hash(password.codeUnits);
//   final key = encrypt.Key.fromBase64(base64Encode(passHash));
//   return encrypt.Encrypter(encrypt.AES(key, mode: encrypt.AESMode.ecb));
// }

// String decryptData(String data, String password) {
//   final encrypter = _getEncrypter(password);
//   final x = encrypter.decrypt(encrypt.Encrypted.fromBase64(data));
//   return x;
// }

const walletApi = _WalletApi();

class _WalletApi {
  const _WalletApi();

  String createMnem(int mnemLangType) {
    final lang = mnemLangType == 0
        ? chains.Bip39Languages.english
        : chains.Bip39Languages.chineseSimplified;
    final generator = chains.Bip39MnemonicGenerator(lang);
    final wordNum = mnemLangType == 0
        ? chains.Bip39WordsNum.wordsNum12
        : chains.Bip39WordsNum.wordsNum12;
    final mnemonic = generator.fromWordsNumber(wordNum);
    return mnemonic.toStr();
  }

  String _getChainName(String chain) {
    final name = chainNameMap[chain]?.name;
    if (name == null) {
      throw Exception('chain not support');
    }
    return name;
  }

  chains.BipCoins? _getBipCoins(String chain, BTCAddressType type) {
    String name = _getChainName(chain);
    chains.BipCoins? bipCoins;
    switch (type) {
      case BTCAddressType.bip44:
        bipCoins = chains.Bip44Coins.fromName(name);
        break;
      case BTCAddressType.bip49:
        bipCoins = chains.Bip49Coins.fromName(name);
        break;
      case BTCAddressType.bip84:
        bipCoins = chains.Bip84Coins.fromName(name);
        break;
      case BTCAddressType.bip86:
        bipCoins = chains.Bip86Coins.fromName(name);
        break;
    }
    return bipCoins;
  }

  chains.Bip44Base _getBip44FromPriv(
      chains.BipCoins coins, BTCAddressType type, List<int> privBytes) {
    switch (type) {
      case BTCAddressType.bip44:
        return chains.Bip44.fromPrivateKey(
            privBytes, coins as chains.Bip44Coins);
      case BTCAddressType.bip49:
        return chains.Bip49.fromPrivateKey(
            privBytes, coins as chains.Bip49Coins);
      case BTCAddressType.bip84:
        return chains.Bip84.fromPrivateKey(
            privBytes, coins as chains.Bip84Coins);
      case BTCAddressType.bip86:
        return chains.Bip86.fromPrivateKey(
            privBytes, coins as chains.Bip86Coins);
    }
  }

  chains.Bip44Base _getBip44FromSeed(
      chains.BipCoins coins, BTCAddressType type, List<int> seedBytes) {
    switch (type) {
      case BTCAddressType.bip44:
        return chains.Bip44.fromSeed(seedBytes, coins as chains.Bip44Coins);
      case BTCAddressType.bip49:
        return chains.Bip49.fromSeed(seedBytes, coins as chains.Bip49Coins);
      case BTCAddressType.bip84:
        return chains.Bip84.fromSeed(seedBytes, coins as chains.Bip84Coins);
      case BTCAddressType.bip86:
        return chains.Bip86.fromSeed(seedBytes, coins as chains.Bip86Coins);
    }
  }

  Map<String, dynamic> getAccount({
    required String chain,
    required String mnem,
    BTCAddressType type = BTCAddressType.bip44,
    int addressIndex = 0,
  }) {
    try {
      final mnem39 = chains.Bip39Mnemonic.fromString(mnem);
      final bip39SeedGenerator = chains.Bip39SeedGenerator(mnem39);
      final bip39seed = bip39SeedGenerator.generate();

      final bipCoins = _getBipCoins(chain, type);
      if (bipCoins == null) {
        throw Exception('chain not support');
      }
      final root = _getBip44FromSeed(bipCoins, type, bip39seed);
      final bip44 = root.purpose.coin
          .account(0)
          .change(chains.Bip44Changes.chainExt)
          .addressIndex(addressIndex);
      final priv = bip44.privateKey.key.toHex();
      final pub = bip44.publicKey.key.toHex(prefix: '0x');
      final address = bip44.publicKey.toAddress;
      return {
        'priv': priv,
        'pub': pub,
        'address': address,
        'chain': chain,
      };
    } catch (e) {
      Log.w(e.toString());
      rethrow;
    }
  }

  // String encData(String data, String password) {
  //   final encrypter = _getEncrypter(password);
  //   final encPriv = encrypter.encrypt(data);
  //   return encPriv.base64;
  // }

  // String decData(String data, String password) {
  //   final encrypter = _getEncrypter(password);
  //   final privateKey = encrypter.decrypt(encrypt.Encrypted.fromBase64(data));
  //   return privateKey.toString();
  // }

  String privToPub(String chain, String privateKey,
      {BTCAddressType type = BTCAddressType.bip44}) {
    final coins = _getBipCoins(chain, type);
    if (coins == null) {
      throw Exception('chain not support');
    }
    final privBytes = chains.BytesUtils.fromHexString(privateKey);
    final privKey = _getBip44FromPriv(coins, type, privBytes);
    final pub = privKey.publicKey.key.toHex(prefix: '0x');
    return pub;
  }

// func FormatBtcAddr(version byte, pubKey []byte) string {
// 	var ad [25]byte
// 	ad[0] = version
// 	copy(ad[1:21], common.Rimp160(pubKey))
// 	copy(ad[21:25], common.Sha2Sum(ad[0:21])[:4])
// 	return base58.Encode(ad[:])
// }
  // String _btyPubToAddr(String pub) {
  //   final pubKey = chains.BytesUtils.fromHexString(pub);
  //   var ad = List<int>.filled(25, 0);
  //   ad[0] = 0x00;
  //   ad.setRange(1, 21, chains.QuickCrypto.ripemd160Hash(pubKey));
  //   final hash = chains.QuickCrypto.sha256DoubleHash(ad.sublist(0, 21));
  //   ad.setRange(21, 25, hash.sublist(0, 4));
  //   return chains.Base58Encoder.encode(ad);
  // }

  chains.Bip44Base _getBip44FromPub(
      chains.BipCoins coins, BTCAddressType type, List<int> pubBytes) {
    switch (type) {
      case BTCAddressType.bip44:
        return chains.Bip44.fromPublicKey(pubBytes, coins as chains.Bip44Coins);
      case BTCAddressType.bip49:
        return chains.Bip49.fromPublicKey(pubBytes, coins as chains.Bip49Coins);
      case BTCAddressType.bip84:
        return chains.Bip84.fromPublicKey(pubBytes, coins as chains.Bip84Coins);
      case BTCAddressType.bip86:
        return chains.Bip86.fromPublicKey(pubBytes, coins as chains.Bip86Coins);
    }
  }

  String pubToAddr(String chain, String pub,
      {BTCAddressType type = BTCAddressType.bip44}) {
    // if (chain == 'BTY') {
    //   return _btyPubToAddr(pub);
    // }

    final coins = _getBipCoins(chain, type);
    if (coins == null) {
      throw Exception('chain not support');
    }
    final pubkeyBytes = chains.BytesUtils.fromHexString(pub);
    final bit44 = _getBip44FromPub(coins, type, pubkeyBytes);
    return bit44.publicKey.toAddress;
  }

  Future<double> getBalance(
      {required String chain,
      required String who,
      required String contractAddr,
      required String coinSymbol}) async {
    final wapi = _getWApi(chain);
    return await wapi.getBalance(who,
            contractAddr: contractAddr, tokenSymbol: coinSymbol) ??
        0.0;
  }

  double getPrice({required String coinSymbol}) {
    return 0;
  }

  Future<Fee> getFee({required String chain, int? txSize}) async {
    final wapi = _getWApi(chain);
    return await wapi.getFee(txSize: txSize);
  }

  Future<Tx?> sendToken({
    required String privateKey,
    required TokenTxArgs args,
  }) {
    final chain = args.token.chain;
    final wapi = _getWApi(chain);
    return wapi.sendToken(privateKey: privateKey, args: args);
  }

  Future<List<Tx>> getTxList({
    required String chain,
    required String addr,
    String? coinSymbol,
    int? coinId,
    int page = 1,
    int limit = 100,
  }) async {
    final wapi = _getWApi(chain);
    return wapi.getTxList(addr, page: page, limit: limit);
  }

  // Future<List<Tx>> getTxsByAddress(TxListArgs args) async {
  //   final wapi = _getWApi(args.chain);
  //   return wapi.getTxList(
  //     args.accountAddress,
  //     page: args.page!,
  //     limit: args.limit!,
  //     chain: args.chain,
  //     contractAddr: args.contractAddress,
  //     tokenSymbol: args.coinSymbol,
  //   );
  // }

  WApi _getWApi(String chain) {
    return wapi(chain: chain);
  }
}

class TxListArgs {
  final String chain;
  final String accountAddress;
  final String? contractAddress;
  final String? coinSymbol;
  final int? coinId;
  final int? page;
  final int? limit;

  TxListArgs({
    required this.chain,
    required this.accountAddress,
    this.contractAddress,
    this.coinSymbol,
    this.coinId,
    this.page = 1,
    this.limit = 100,
  });
}

abstract class WApi {
  final ChainConfig config;
  WApi({required this.config});

  // static Map<String, Token> coinMap = {};

  Future<Fee> getFee({int? txSize}) async {
    throw UnimplementedError();
  }

  // acc is the address of the account
  // contractAddr is the address of the contract, if null, it is the native token
  // tokenSymbol is the symbol of the token
  Future<double?> getBalance(String who,
      {String? contractAddr, String? tokenSymbol}) async {
    throw UnimplementedError();
  }

  Future<List<Tx>> getTxsByAddress(TxListArgs args) async {
    throw UnimplementedError();
  }

  Future<List<Tx>> getTxList(
    String addr, {
    int page = 1,
    int limit = 100,
    int startBlock = 0,
    String? chain,
    String? contractAddr,
    String? tokenSymbol,
  }) {
    throw UnimplementedError();
  }

  Future<Tx?> sendToken({
    required String privateKey,
    required TokenTxArgs args,
  }) {
    throw UnimplementedError();
  }
}

Map<String, WApi> wapiMap = {
  'BTY': Chain33Api(config: btyConfig),
  'YCC': Chain33Api(config: yccConfig),
  'ETH': EVMWApi(config: ethereumConfig),
  'BNB': EVMWApi(config: bscConfig),
  'TRX': TRXWApi(config: tronConfig),
};

WApi wapi({required String chain}) {
  final wapi = wapiMap[chain];
  if (wapi == null) {
    throw Exception('chain not supported');
  }
  return wapi;
}
