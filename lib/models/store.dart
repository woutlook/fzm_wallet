import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fzm_wallet/models/coin.dart';
import 'package:fzm_wallet/models/wallet.dart';
import 'package:fzm_wallet/models/wapi.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fzm_wallet/models/contact.dart';

const store = _Store();

class _Store {
  static late SharedPreferences prefs;
  Future<void> storeInit() async {
    prefs = await SharedPreferences.getInstance();
  }

  SharedPreferences getPrefs() {
    return prefs;
  }

  const _Store();

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
    final str = jsonEncode(wallet);
    await _set(wallet.name, str);
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

  Future<String?> getSecureData(String hash) async {
    final value = prefs.getString(hash);
    if (value == null) {
      return null;
    }
    final key = await getEncryptionKey();
    final decrypted = walletApi.decData(value, key!);
    return decrypted;
  }

  Future<void> setSecureData(String hash, String value) async {
    final key = await getEncryptionKey();
    final encrypted = walletApi.encData(value, key!);
    await prefs.setString(hash, encrypted);
  }

  bool containsKey(String key) {
    return prefs.containsKey(key);
  }

  Future<void> setCurrentWallet(String wname) async {
    await _set(currentWalletKey, wname);
  }

  Wallet? getCurrentWallet() {
    final name = _get(currentWalletKey);
    if (name == null) {
      return null;
    }
    return getWallet(name);
  }

  Future<void> setWalletList(List<String> nameList) async {
    await _set(walletsKey, nameList);
  }

  List<String> getWalletList() {
    return _getList(walletsKey);
  }

  Future<void> removeWallet(String wname) async {
    await _remove(wname);
  }

  //  const String _walletPrefix = 'wallet#';
  //  String _walletName(String name) {
  //   return '$_walletPrefix$name';
  // }

  Future<void> updateWallet(String oldName, Wallet newWallet) async {
    await _remove(oldName);
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
    await _remove(walletsKey);
    await _remove(currentWalletKey);
  }

  Future<void> clear() async {
    await prefs.clear();
  }

  Future<void> setLoginType(LoginType type) async {
    await _set(loginTypeKey, type.index);
  }

  LoginType getLoginType() {
    final typeIndex = _get(loginTypeKey);
    if (typeIndex == null) {
      return LoginType.password;
    }
    return LoginType.values[int.parse(typeIndex)];
  }

  Future<void> setPasswordHash(String hash) async {
    await _set(appPasswordHashKey, hash);
  }

  String? getPasswordHash() {
    return _get(appPasswordHashKey);
  }

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
    final list = json.map((e) => Contact.fromJson(e)).toList();
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
    list[index] = newContact;
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
    await _remove(walletsKey);
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
}

const contactPrifix = 'contact #';
const walletPrefix = 'wallet #';
const coinPrefix = 'coin #';
const contactListKey = 'contactList';
const walletsKey = 'wallets';
const currentWalletKey = 'currentWallet';
const themeKey = 'theme';
const languageKey = 'language';

const loginTypeKey = 'loginType';
const appPasswordHashKey = 'tokwaPasswordHash';

bool checkPassword(String password) {
  final passwordHash = hashData(password);
  final storedHash = store.getPasswordHash();
  return passwordHash == storedHash;
}

enum LoginType {
  facialRecognition,
  fingerprint,
  password,
}

const storage = FlutterSecureStorage(
  webOptions: WebOptions(
    dbName: 'tokwa_specific_key',
    publicKey: 'tokwa_specific_iv',
  ),
);
const encryptionKey = 'tokwaEncryptionKey';

Future<String?> getAppPassword({String? platform}) async {
  if (platform == 'macOS') {
    return _cachedPassword;
  }
  return await getEncryptionKey();
}

String? _cachedPassword;

Future<void> setAppPassword(String password, {String? platform}) async {
  final passwordHash = hashData(password);
  await store.setPasswordHash(passwordHash);
  if (platform == 'macOS') {
    _cachedPassword = password;
    return;
  }
  setEncryptionKey(password);
}

Future<String?> getEncryptionKey() async {
  return _cachedPassword ?? await storage.read(key: encryptionKey);
}

Future<void> setEncryptionKey(String key) async {
  await storage.write(
    key: encryptionKey,
    value: key,
  );
}
