import 'package:flutter/src/foundation/basic_types.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
// import 'package:test/test.dart';
import 'package:fzm_wallet/models/store.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockSecureStorage implements FlutterSecureStorage {
  final Map<String, String> _storage = {};

  @override
  AndroidOptions get aOptions => throw UnimplementedError();

  @override
  Future<bool> containsKey(
      {required String key,
      IOSOptions? iOptions,
      AndroidOptions? aOptions,
      LinuxOptions? lOptions,
      WebOptions? webOptions,
      MacOsOptions? mOptions,
      WindowsOptions? wOptions}) {
    throw UnimplementedError();
  }

  @override
  IOSOptions get iOptions => throw UnimplementedError();

  @override
  Future<bool?> isCupertinoProtectedDataAvailable() {
    throw UnimplementedError();
  }

  @override
  LinuxOptions get lOptions => throw UnimplementedError();

  @override
  MacOsOptions get mOptions => throw UnimplementedError();

  @override
  Stream<bool>? get onCupertinoProtectedDataAvailabilityChanged =>
      throw UnimplementedError();

  @override
  void registerListener(
      {required String key, required ValueChanged<String?> listener}) {
  }

  @override
  void unregisterAllListeners() {
  }

  @override
  void unregisterAllListenersForKey({required String key}) {
  }

  @override
  void unregisterListener(
      {required String key, required ValueChanged<String?> listener}) {
  }

  @override
  WindowsOptions get wOptions => throw UnimplementedError();

  @override
  WebOptions get webOptions => throw UnimplementedError();

  @override
  Future<void> delete(
      {required String key,
      IOSOptions? iOptions,
      AndroidOptions? aOptions,
      LinuxOptions? lOptions,
      WebOptions? webOptions,
      MacOsOptions? mOptions,
      WindowsOptions? wOptions}) {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteAll(
      {IOSOptions? iOptions,
      AndroidOptions? aOptions,
      LinuxOptions? lOptions,
      WebOptions? webOptions,
      MacOsOptions? mOptions,
      WindowsOptions? wOptions}) {
    throw UnimplementedError();
  }

  @override
  Future<String?> read(
      {required String key,
      IOSOptions? iOptions,
      AndroidOptions? aOptions,
      LinuxOptions? lOptions,
      WebOptions? webOptions,
      MacOsOptions? mOptions,
      WindowsOptions? wOptions}) {
    return Future.value(_storage[key]);
  }

  @override
  Future<Map<String, String>> readAll(
      {IOSOptions? iOptions,
      AndroidOptions? aOptions,
      LinuxOptions? lOptions,
      WebOptions? webOptions,
      MacOsOptions? mOptions,
      WindowsOptions? wOptions}) {
    return Future.value(_storage);
  }

  @override
  Future<void> write(
      {required String key,
      required String? value,
      IOSOptions? iOptions,
      AndroidOptions? aOptions,
      LinuxOptions? lOptions,
      WebOptions? webOptions,
      MacOsOptions? mOptions,
      WindowsOptions? wOptions}) async {
    _storage[key] = value!;
  }
}

void main() {
  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    SharedPreferences.setMockInitialValues({});
    await store.storeInit();
    store.setStorage(MockSecureStorage());
  });

  // test('set and get theme', () async {
  //   await store.setTheme(ThemeMode.dark);
  //   expect(store.getTheme(), ThemeMode.dark);
  // });

  // test('set and get language', () async {
  //   await store.setLanguage('en');
  //   expect(store.getLanguage(), 'en');
  // });

  // test('set and get wallet', () async {
  //   final wallet = Wallet(name: 'testWallet', type: WalletType.mnemonic);
  //   await store.setWallet(wallet);
  //   expect(store.getWallet('testWallet')?.name, 'testWallet');
  // });

  // test('set and get contact list', () async {
  //   final contact = Contact(name: 'testContact', address: 'testAddress');
  //   await store.setContactList([contact]);
  //   expect(store.getContactList().first.name, 'testContact');
  // });

  // test('set and get coin', () async {
  //   final coin = Coin(id: 1, name: 'Bitcoin');
  //   await store.setCoin(coin);
  //   expect(store.getCoin(1)?.name, 'Bitcoin');
  // });

  test('encrypt and decrypt data', () async {
    final password = 'testPassword';
    final data = 'testData';
    await store.setPassword(password);
    final encryptedData = await store.encryptData(data, password);
    final decryptedData = await store.decryptData(encryptedData, password);
    expect(decryptedData, data);
  });
}
