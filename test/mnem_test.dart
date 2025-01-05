import 'package:flutter_test/flutter_test.dart';
import 'package:fzm_wallet/models/wapi.dart';

void main() {
  test('byteToHex converts byte array to hex string', () {
    final bytes = [0, 255, 16, 128];
    final hex = bytesToHex(bytes);
    expect(hex, '00ff1080');
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
    final encMnem = encryptData(mnem, password);
    final decMnem = decryptData(encMnem, password);
    expect(decMnem, mnem);
  });

  test('encPriv and decPriv encrypt and decrypt private key', () {
    const priv = 'testPrivateKey';
    const password = 'testPassword';
    final encPriv = walletApi.encData(priv, password);
    final decPriv = walletApi.decData(encPriv, password);
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
