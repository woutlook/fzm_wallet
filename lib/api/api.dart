import 'dart:convert';
import 'dart:typed_data';

import 'package:blockchain_utils/blockchain_utils.dart' as chain_utils;
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:blockchain_utils/hex/hex.dart';

import 'package:fwallet/api/config.dart';
import 'package:fwallet/api/wapi.dart';
import 'package:fwallet/api/tx.dart';
import 'package:fwallet/api/chains/fzm.dart';
import 'package:fwallet/utils/app_utils.dart';

class WalletApi {
  WalletApi._privateConstructor();

  static final WalletApi _instance = WalletApi._privateConstructor();

  factory WalletApi() {
    return _instance;
  }
  String bytesToHex(List<int> b) {
    return b.map((e) => e.toRadixString(16).padLeft(2, '0')).join();
  }

  bool checkPasswd(String password, String passwdHash) {
    final pw2Hash = chain_utils.SHA512.hash(password.codeUnits);
    return bytesToHex(pw2Hash) == passwdHash;
  }

  String passwordHash(String password) {
    final pw2Hash = chain_utils.SHA512.hash(password.codeUnits);
    return bytesToHex(pw2Hash);
  }

  String createMnem(int mnemLangType) {
    final lang = mnemLangType == 0
        ? chain_utils.Bip39Languages.english
        : chain_utils.Bip39Languages.chineseSimplified;
    final generator = chain_utils.Bip39MnemonicGenerator(lang);
    final wordNum = mnemLangType == 0
        ? chain_utils.Bip39WordsNum.wordsNum12
        : chain_utils.Bip39WordsNum.wordsNum12;
    final mnemonic = generator.fromWordsNumber(wordNum);
    return mnemonic.toStr();
  }

  Map<String, dynamic> encMnem(String mnem, String password) {
    final encrypter = _getEncrypter(password);
    final encMnem = encrypter.encrypt(mnem);
    final pw2Hash = chain_utils.SHA512.hash(password.codeUnits);
    return {
      'mnem': encMnem.base64,
      'password': bytesToHex(pw2Hash),
    };
  }

  encrypt.Encrypter _getEncrypter(String password) {
    final passHash = chain_utils.SHA256.hash(password.codeUnits);
    final key = encrypt.Key.fromBase64(base64Encode(passHash));
    return encrypt.Encrypter(encrypt.AES(key, mode: encrypt.AESMode.ecb));
  }

  String decMnem(String encMnem, String password) {
    final encrypter = _getEncrypter(password);
    final mnem = encrypter.decrypt(encrypt.Encrypted.fromBase64(encMnem));
    return mnem.toString();
  }

  chain_utils.BipCoins? _getBipCoins(String chain, BTCAddressType type) {
    String? name = chainConfigs[chain]?.name;
    name ??= fzm_chain_map[chain];
    if (name == null) {
      throw Exception('chain not support');
    }
    chain_utils.BipCoins? bipCoins;
    switch (type) {
      case BTCAddressType.bip44:
        bipCoins = chain_utils.Bip44Coins.fromName(name);
        break;
      case BTCAddressType.bip49:
        bipCoins = chain_utils.Bip49Coins.fromName(name);
        break;
      case BTCAddressType.bip84:
        bipCoins = chain_utils.Bip84Coins.fromName(name);
        break;
      case BTCAddressType.bip86:
        bipCoins = chain_utils.Bip86Coins.fromName(name);
        break;
    }
    return bipCoins;
  }

  chain_utils.Bip44Base _getBip44FromPriv(
      chain_utils.BipCoins coins, BTCAddressType type, List<int> privBytes) {
    switch (type) {
      case BTCAddressType.bip44:
        return chain_utils.Bip44.fromPrivateKey(
            privBytes, coins as chain_utils.Bip44Coins);
      case BTCAddressType.bip49:
        return chain_utils.Bip49.fromPrivateKey(
            privBytes, coins as chain_utils.Bip49Coins);
      case BTCAddressType.bip84:
        return chain_utils.Bip84.fromPrivateKey(
            privBytes, coins as chain_utils.Bip84Coins);
      case BTCAddressType.bip86:
        return chain_utils.Bip86.fromPrivateKey(
            privBytes, coins as chain_utils.Bip86Coins);
    }
  }

  chain_utils.Bip44Base _getBip44FromSeed(
      chain_utils.BipCoins coins, BTCAddressType type, List<int> seedBytes) {
    switch (type) {
      case BTCAddressType.bip44:
        return chain_utils.Bip44.fromSeed(
            seedBytes, coins as chain_utils.Bip44Coins);
      case BTCAddressType.bip49:
        return chain_utils.Bip49.fromSeed(
            seedBytes, coins as chain_utils.Bip49Coins);
      case BTCAddressType.bip84:
        return chain_utils.Bip84.fromSeed(
            seedBytes, coins as chain_utils.Bip84Coins);
      case BTCAddressType.bip86:
        return chain_utils.Bip86.fromSeed(
            seedBytes, coins as chain_utils.Bip86Coins);
    }
  }

  Map<String, dynamic> getHDWallet(String chain, String mnem,
      {BTCAddressType type = BTCAddressType.bip44}) {
    try {
      final mnem39 = chain_utils.Bip39Mnemonic.fromString(mnem);
      final bip39SeedGenerator = chain_utils.Bip39SeedGenerator(mnem39);
      final bip39seed = bip39SeedGenerator.generate();

      final bipCoins = _getBipCoins(chain, type);
      if (bipCoins == null) {
        throw Exception('chain not support');
      }
      final bip44 = _getBip44FromSeed(bipCoins, type, bip39seed);
      final master = bip44.deriveDefaultPath;
      final privateKey = master.privateKey.privKey.toHex();
      final pub = master.publicKey.pubKey.toHex();
      final address = master.publicKey.toAddress;
      return {
        'privateKey': privateKey,
        'pub': pub,
        'address': address,
      };
    } catch (e) {
      Log.w(e.toString());
      rethrow;
    }
  }

  String childPriv(String privateKey, String chain, int index,
      {BTCAddressType type = BTCAddressType.bip44}) {
    final bipCoins = _getBipCoins(chain, type);
    if (bipCoins == null) {
      throw Exception('chain not support');
    }
    final privBytes = Uint8List.fromList(hex.decode(privateKey));
    final mst = _getBip44FromSeed(bipCoins, type, privBytes);
    final child = mst.coin
        .account(0)
        .change(chain_utils.Bip44Changes.chainExt)
        .addressIndex(index);
    return child.privateKey.privKey.toHex();
  }

  String encPriv(String privateKey, String password) {
    final encrypter = _getEncrypter(password);
    final encPriv = encrypter.encrypt(privateKey);
    return encPriv.base64;
  }

  String decPriv(String encPriv, String password) {
    final encrypter = _getEncrypter(password);
    final privateKey = encrypter.decrypt(encrypt.Encrypted.fromBase64(encPriv));
    return privateKey.toString();
  }

  String privToPub(String chain, String privateKey,
      {BTCAddressType type = BTCAddressType.bip44}) {
    final coins = _getBipCoins(chain, type);
    if (coins == null) {
      throw Exception('chain not support');
    }
    final privBytes = Uint8List.fromList(hex.decode(privateKey));
    final privKey = _getBip44FromPriv(coins, type, privBytes);
    final pub = privKey.publicKey.key.toHex();
    return pub;
  }

// func FormatBtcAddr(version byte, pubKey []byte) string {
// 	var ad [25]byte
// 	ad[0] = version
// 	copy(ad[1:21], common.Rimp160(pubKey))
// 	copy(ad[21:25], common.Sha2Sum(ad[0:21])[:4])
// 	return base58.Encode(ad[:])
// }
  String _btyPubToAddr(String pub) {
    final pubKey = Uint8List.fromList(hex.decode(pub));
    var ad = List<int>.filled(25, 0);
    ad[0] = 0x00;
    ad.setRange(1, 21, chain_utils.RIPEMD160.hash(pubKey));
    ad.setRange(
        21,
        25,
        chain_utils.SHA256
            .hash(chain_utils.SHA256.hash(ad.sublist(0, 21)))
            .sublist(0, 4));
    return chain_utils.Base58Encoder.encode(ad);
  }

  String pubToAddr(String chain, String pub,
      {BTCAddressType type = BTCAddressType.bip44}) {
    final chain44 = fzm_chain_map[chain] ?? 'ethereum';
    if (chain44 == 'bityuan') {
      return _btyPubToAddr(pub);
    }

    final coins = _getBipCoins(chain, type);
    if (coins == null) {
      throw Exception('chain not support');
    }
    final pubKey = chain_utils.IPublicKey.fromHex(pub, coins.conf.type);
    final encoder = coins.conf.encoder();
    return encoder.encodeKey(pubKey.compressed);
  }

  static Map<String, ChainConfig> chainConfigs = {
    ethereumConfig.name: ethereumConfig,
    arbitrumConfig.name: arbitrumConfig,
    optimismConfig.name: optimismConfig,
    bscConfig.name: bscConfig,
    avalancheConfig.name: avalancheConfig,
    polygonConfig.name: polygonConfig,
    tronConfig.name: tronConfig,
    solanaConfig.name: solanaConfig,
    // eosConfig.name: eosConfig,
    btcConfig.name: btcConfig,
    dashConfig.name: dashConfig,
    ltcConfig.name: ltcConfig,
    dogeConfig.name: dogeConfig,
    bchConfig.name: bchConfig,
  };
  static Map<String, WApi> wapiMap = {
    'BTY': FzmWApi.BTYWApi,
    'YCC': FzmWApi.YCCWApi,
  };

  static WApi wapi({String chain = 'ethereum'}) {
    return FzmWApi.BTYWApi;
  }

  static WApi wapi2({String chain = 'ethereum'}) {
    final wapi = wapiMap[chain];
    if (wapi != null) {
      return wapi;
    }
    final name = fzm_chain_map[chain];
    if (name == null) {
      throw Exception('chain not support');
    }
    return wapiMap[name]!;
  }
}
