import 'package:flutter_test/flutter_test.dart';
import 'package:fzm_wallet/models/store.dart';
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

  test('encMnem and decMnem encrypt and decrypt mnemonic', () async {
    const mnem = '你 好 世 界';
    const password = 'testPassword';
    await store.setPassword(password);
    final encMnem = await store.encryptData(mnem, password);
    final decMnem = await store.decryptData(encMnem, password);
    expect(decMnem, mnem);
  });

  test('encPriv and decPriv encrypt and decrypt private key', () async {
    const priv = 'testPrivateKey';
    const password = 'testPassword';
    await store.setPassword(password);
    final encPriv = await store.encryptData(priv, password);
    final decPriv = await store.decryptData(encPriv, password);
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
