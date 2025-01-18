import 'dart:convert';
import 'dart:math';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:flutter/material.dart';
// import 'package:blockchain_utils/blockchain_utils.dart' as blockchain;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cryptography/cryptography.dart';

import 'package:fzm_wallet/models/coin.dart';
import 'package:fzm_wallet/models/wallet.dart';
import 'package:fzm_wallet/models/wapi.dart';
import 'package:fzm_wallet/provider/p.dart';
import 'package:fzm_wallet/models/contact.dart';

final store = _Store();

class _Store {
  late SharedPreferences prefs;
  FlutterSecureStorage storage = FlutterSecureStorage();
  Future<void> storeInit() async {
    prefs = await SharedPreferences.getInstance();
  }

  SharedPreferences getPrefs() {
    return prefs;
  }

  void setStorage(FlutterSecureStorage storage) {
    this.storage = storage;
  }

  _Store();

  Future<void> _set(String key, dynamic value) async {
    if (value is String) {
      await prefs.setString(key, value);
    } else if (value is int) {
      await prefs.setInt(key, value);
    } else if (value is double) {
      await prefs.setDouble(key, value);
    } else if (value is bool) {
      await prefs.setBool(key, value);
    } else if (value is List<String>) {
      await prefs.setStringList(key, value);
    } else {
      throw Exception('Invalid value');
    }
  }

  List<String> _getList(String key) {
    final list = prefs.getStringList(key);
    if (list == null) {
      return [];
    }
    return list;
  }

  String? _get(String key) {
    return prefs.getString(key);
  }

  Future<void> _remove(String key) async {
    await prefs.remove(key);
  }

  Future<void> setTheme(ThemeMode theme) async {
    await _set(themeKey, theme.index);
  }

  ThemeMode getTheme() {
    final themeIndex = _get(themeKey);
    if (themeIndex == null) {
      return ThemeMode.system;
    }
    return ThemeMode.values[int.parse(themeIndex)];
  }

  Future<void> setLanguage(String language) async {
    await _set(languageKey, language);
  }

  String? getLanguage() {
    return _get(languageKey);
  }

  Future<void> setWallet(Wallet wallet) async {
    if (wallet.name == defaultWalletName) {
      return;
    }
    final str = jsonEncode(wallet);
    await _set(wallet.name, str);
    final nameList = getWalletList();
    if (!nameList.contains(wallet.name)) {
      nameList.add(wallet.name);
    }
    await setWalletList(nameList);
  }

  Wallet? getWallet(String wname) {
    final jsonStr = _get(wname);
    if (jsonStr == null) {
      return null;
    }
    final json = jsonDecode(jsonStr);
    final type = WalletType.values
        .where((element) => element.name == json['type'])
        .first;
    Wallet wallet;
    if (type == WalletType.mnemonic) {
      wallet = MnemonicWallet.fromJson(json as Map<String, dynamic>);
    } else if (type == WalletType.privateKey) {
      wallet = PrivateWallet.fromJson(json as Map<String, dynamic>);
    } else if (type == WalletType.address) {
      wallet = AddressWallet.fromJson(json as Map<String, dynamic>);
    } else {
      throw Exception('Invalid wallet type');
    }
    return wallet;
  }

  // Future<String?> getSecureData(String hash) async {
  //   final value = prefs.getString(hash);
  //   if (value == null) {
  //     return null;
  //   }
  //   final key = await getEncryptionKey();
  //   final decrypted = walletApi.decData(value, key!);
  //   return decrypted;
  // }

  // Future<void> setSecureData(String hash, String value) async {
  //   final key = await getEncryptionKey();
  //   final encrypted = walletApi.encData(value, key!);
  //   await prefs.setString(hash, encrypted);
  // }

  bool containsKey(String key) {
    return prefs.containsKey(key);
  }

  Future<void> setCurrentWallet(newName) async {
    await _set(currentWalletKey, newName);
  }

  Wallet? getCurrentWallet() {
    final name = _get(currentWalletKey);
    if (name == null) {
      return null;
    }
    return getWallet(name);
  }

  Future<void> setWalletList(List<String> nameList) async {
    await _set(walletListKey, nameList);
  }

  List<String> getWalletList() {
    return _getList(walletListKey);
  }

  Future<void> removeWallet(String wname) async {
    final nameList = getWalletList();
    final newList = nameList.where((element) => element != wname).toList();
    await setWalletList(newList);
    await _remove(wname);
  }

  //  const String _walletPrefix = 'wallet#';
  //  String _walletName(String name) {
  //   return '$_walletPrefix$name';
  // }

  Future<void> updateWallet(String oldName, Wallet newWallet) async {
    await removeWallet(oldName);
    await setWallet(newWallet);
  }

  Future<void> clearWallets() async {
    final nameList = getWalletList();
    if (nameList.isEmpty) {
      return;
    }
    for (final name in nameList) {
      await _remove(name);
    }
    await _remove(walletListKey);
    await _remove(currentWalletKey);
  }

  Future<void> clear() async {
    await prefs.clear();
    await storeInit();
  }

  // Future<void> setLoginType(LoginType type) async {
  //   await _set(loginTypeKey, type.index);
  // }

  // LoginType getLoginType() {
  //   final typeIndex = _get(loginTypeKey);
  //   if (typeIndex == null) {
  //     return LoginType.password;
  //   }
  //   return LoginType.values[int.parse(typeIndex)];
  // }

  //  Future<void> setContact(Contact contact) async {
  //   final key = contactPrifix + contact.name;
  //   await _set(key, jsonEncode(contact.toJson()));
  // }

  List<Contact> getContactList() {
    final jsonStr = _get(contactListKey);
    if (jsonStr == null) {
      return [];
    }
    final json = jsonDecode(jsonStr);
    final List<Contact> list =
        List<Contact>.from(json.map((e) => Contact.fromJson(e)));
    return list;
  }

  Future<void> setContactList(List<Contact> contactList) async {
    final json = contactList.map((e) => e.toJson()).toList();
    await _set(contactListKey, jsonEncode(json));
  }

  Future<void> removeContact(String name) async {
    final list = getContactList();
    final newList = list.where((element) => element.name != name).toList();
    await setContactList(newList);
  }

  Future<void> updateContact(String oldName, Contact newContact) async {
    final list = getContactList();
    final index = list.indexWhere((element) => element.name == oldName);
    if (index == -1) {
      list.add(newContact);
    } else {
      list[index] = newContact;
    }
    await setContactList(list);
  }

  Future<void> clearContacts() async {
    await _remove(contactListKey);
  }

  Future<void> clearAll() async {
    await prefs.clear();
  }

  Future<void> removeContactList() async {
    await _remove(contactListKey);
  }

  Future<void> removeWalletList() async {
    await _remove(walletListKey);
  }

  Future<void> removeCurrentWallet() async {
    await _remove(currentWalletKey);
  }

  Future<void> setCoin(Coin coin) async {
    final key = coinPrefix + coin.id.toString();
    await _set(key, jsonEncode(coin.toJson()));
  }

  Coin? getCoin(int id) {
    final key = coinPrefix + id.toString();
    final jsonStr = _get(key);
    if (jsonStr == null) {
      return null;
    }
    final json = jsonDecode(jsonStr);
    final coin = Coin.fromJson(json);
    return coin;
  }

  Future<void> removeCoin(int id) async {
    final key = coinPrefix + id.toString();
    await _remove(key);
  }

  Future<void> updateCoin(int id, Coin newCoin) async {
    final key = coinPrefix + id.toString();
    await _remove(key);
    await setCoin(newCoin);
  }

  bool verifyPassword(String password) {
    final passwordHash = hashData(password);
    final storedHash = getPasswordHash();
    return passwordHash == storedHash;
  }

  Future<void> setPassword(String password) async {
    final passwordHash = hashData(password);
    await _set(appPasswordHashKey, passwordHash);
    final kek = _generateKEK();
    await _storeEncryptedKEK(kek, password);
  }

  Future<void> changePassword(String old, String newp) async {
    final passwordHash = hashData(old);
    final storedHash = getPasswordHash();
    if (passwordHash != storedHash) {
      throw Exception('Invalid password');
    }
    final kek = await _retrieveKEK(old);
    if (kek == null) {
      throw Exception('Invalid password');
    }
    final newHash = hashData(newp);
    await _set(appPasswordHashKey, newHash);
    await _storeEncryptedKEK(kek, newp);
  }

  String? getPasswordHash() {
    return _get(appPasswordHashKey);
  }

  Future<void> _storeEncryptedKEK(String kek, String password) async {
    final salt = _generateSalt();
    final derivedKey = await _deriveKey(password, salt);

    final key = encrypt.Key.fromBase64(derivedKey);
    final iv = encrypt.IV.fromLength(16); // 初始化向量
    final encrypter =
        encrypt.Encrypter(encrypt.AES(key, mode: encrypt.AESMode.gcm));
    final encrypted = encrypter.encrypt(kek, iv: iv);

    await storage.write(key: 'encrypted_kek', value: encrypted.base64);
    await storage.write(key: 'kek_salt', value: salt);
    await storage.write(key: 'kek_iv', value: base64Encode(iv.bytes)); //存储iv
  }

  Future<String?> _retrieveKEK(String password) async {
    final encryptedKek = await storage.read(key: 'encrypted_kek');
    final salt = await storage.read(key: 'kek_salt');
    final ivStr = await storage.read(key: 'kek_iv');
    if (encryptedKek == null || salt == null || ivStr == null) {
      return null;
    }
    final derivedKey = await _deriveKey(password, salt);
    final key = encrypt.Key.fromBase64(derivedKey);
    final iv = encrypt.IV.fromBase64(ivStr);
    final encrypter =
        encrypt.Encrypter(encrypt.AES(key, mode: encrypt.AESMode.gcm));
    try {
      final decrypted =
          encrypter.decrypt(encrypt.Encrypted.fromBase64(encryptedKek), iv: iv);
      return decrypted;
    } catch (e) {
      return null; //解密失败
    }
  }

  Future<String> encryptData(String data, String password) async {
    final kek = await _retrieveKEK(password);
    final key = encrypt.Key.fromBase64(kek!);
    final iv = encrypt.IV.fromLength(16);
    final encrypter =
        encrypt.Encrypter(encrypt.AES(key, mode: encrypt.AESMode.ecb));
    final encrypted = encrypter.encrypt(data, iv: iv);
    return encrypted.base64;
  }

  Future<String> decryptData(String encryptedData, String password) async {
    final kek = await _retrieveKEK(password);
    final key = encrypt.Key.fromBase64(kek!);
    final iv = encrypt.IV.fromLength(16);
    final encrypter =
        encrypt.Encrypter(encrypt.AES(key, mode: encrypt.AESMode.ecb));
    final decrypted =
        encrypter.decrypt(encrypt.Encrypted.fromBase64(encryptedData), iv: iv);
    return decrypted;
  }

  String _generateKEK() {
    final random = Random.secure();
    final bytes =
        List.generate(32, (_) => random.nextInt(256)); // 32 字节 for AES-256
    return base64Encode(bytes);
  }

  String _generateSalt() {
    final random = Random.secure();
    final bytes = List.generate(16, (_) => random.nextInt(256)); // 16 字节
    return base64Encode(bytes);
  }

  Future<String> _deriveKey(String password, String salt) async {
    final saltBytes = base64Decode(salt);
    final algorithm = Argon2id(
      parallelism: 4,
      memory: 10000, // 10 000 x 1kB block = 10 MB
      iterations: 2,
      hashLength: 32,
    );
    final derivedKey = await algorithm.deriveKey(
      secretKey: SecretKey(utf8.encode(password)),
      nonce: saltBytes,
    );

    return base64Encode(await derivedKey.extractBytes());
  }
}

const contactPrifix = 'contact #';
const walletPrefix = 'wallet #';
const coinPrefix = 'coin #';
const contactListKey = 'contactList';
const walletListKey = 'wallets';
const currentWalletKey = 'currentWallet';
const themeKey = 'theme';
const languageKey = 'language';

const appPasswordHashKey = 'appPasswordHash';

// enum LoginType {
//   facialRecognition,
//   fingerprint,
//   password,
// }

// const storage = FlutterSecureStorage(
//   webOptions: WebOptions(
//     dbName: 'tokwa_specific_key',
//     publicKey: 'tokwa_specific_iv',
//   ),
// );
// const encryptionKey = 'tokwaEncryptionKey';

// Future<String?> getAppPassword({String? platform}) async {
//   if (platform == 'macOS') {
//     return _cachedPassword;
//   }
//   return await getEncryptionKey();
// }

// String? _cachedPassword;

// Future<void> setAppPassword(String password, {String? platform}) async {
//   final passwordHash = hashData(password);
//   await store.setPasswordHash(passwordHash);
//   if (platform == 'macOS') {
//     _cachedPassword = password;
//     return;
//   }
//   setEncryptionKey(password);
// }

// Future<String?> getEncryptionKey() async {
//   return _cachedPassword ?? await storage.read(key: encryptionKey);
// }

// Future<void> setEncryptionKey(String key) async {
//   await storage.write(
//     key: encryptionKey,
//     value: key,
//   );
// }
