import 'package:flutter_test/flutter_test.dart';
import 'package:fwallet/api/api.dart';

void main() {
  final walletApi = WalletApi();

  test('byteToHex converts byte array to hex string', () {
    final bytes = [0, 255, 16, 128];
    final hex = walletApi.bytesToHex(bytes);
    expect(hex, '00ff1080');
  });

  test('checkPasswd verifies password correctly', () {
    const password = 'testPassword';
    final passwdHash = walletApi.passwordHash(password);
    expect(walletApi.checkPasswd(password, passwdHash), isTrue);
    expect(walletApi.checkPasswd('wrongPassword', passwdHash), isFalse);
  });

  test('passwordHash generates correct hash', () {
    const password = 'testPassword';
    final hash = walletApi.passwordHash(password);
    expect(hash, isNotEmpty);
  });

  test('createMnem generates mnemonic', () {
    final mnemEnglish = walletApi.createMnem(0);
    final mnemChinese = walletApi.createMnem(1);
    expect(mnemEnglish.split(' ').length, 12);
    expect(mnemChinese.split(' ').length, 12);
  });

  test('encMnem and decMnem encrypt and decrypt mnemonic', () {
    const mnem = '你 好 世 界';
    const password = 'testPassword';
    final encMnem = walletApi.encMnem(mnem, password);
    final decMnem = walletApi.decMnem(encMnem['mnem']!, password);
    expect(decMnem, mnem);
  });

  test('getHDWallet generates HD wallet', () {
    const mnem = 'test mnemonic';
    final wallet = walletApi.getHDWallet('ETH', mnem);
    expect(wallet['priv'], isNotEmpty);
    expect(wallet['pub'], isNotEmpty);
    expect(wallet['address'], isNotEmpty);
  });

  test('childPriv generates child private key', () {
    const priv = 'testPrivateKey';
    final childPriv = walletApi.childPriv(priv, 'ETH', 0);
    expect(childPriv, isNotEmpty);
  });

  test('encPriv and decPriv encrypt and decrypt private key', () {
    const priv = 'testPrivateKey';
    const password = 'testPassword';
    final encPriv = walletApi.encPriv(priv, password);
    final decPriv = walletApi.decPriv(encPriv, password);
    expect(decPriv, priv);
  });

  test('privToPub converts private key to public key', () {
    const priv = 'testPrivateKey';
    final pub = walletApi.privToPub('ETH', priv);
    expect(pub, isNotEmpty);
  });

  test('pubToAddr converts public key to address', () {
    const pub = 'testPublicKey';
    final addr = walletApi.pubToAddr('ETH', pub);
    expect(addr, isNotEmpty);
  });
}
