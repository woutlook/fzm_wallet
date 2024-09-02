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

  const chineseMenm = "邻 想 湘 劣 乏 搭 实 富 矿 徐 扇 旺";
  // const englishMnem =
  //     "youth sentence trust elegant odor interest sad two debris trouble blind witness";
  const mnemonic =
      'rough sun farm okay drill program want letter just tumble keen resource';

  test('encMnem and decMnem encrypt and decrypt mnemonic', () {
    const mnem = chineseMenm;
    const password = 'testPassword';
    final encMnem = walletApi.encMnem(mnem, password);
    final decMnem = walletApi.decMnem(encMnem['mnem']!, password);
    expect(decMnem, mnem);
  });

  const privKey =
      "03dcfd17eb4616604a5e2e34c4f3201cfcde94f8733120408336d9ce9de76941";
  const pubKey =
      "02b504c91cba3191a3b064be6126f9a4b2d9083bb931c774f118f9719e92c26b65";
  const address = "0x0C840D45De3882eD511F3B7cdD8d8A383C38A28D";

  test('getHDWallet generates HD wallet', () {
    const mnem = mnemonic;
    final wallet = walletApi.getHDWallet('BNB', mnem);
    expect(wallet['priv'], isNotEmpty);
    expect(wallet['pub'], isNotEmpty);
    expect(wallet['address'], isNotEmpty);
  });

  test('childPriv generates child private key', () {
    const priv = privKey;
    final childPriv = walletApi.childPriv(priv, 'ETH', 0);
    expect(childPriv, isNotEmpty);
  });

  test('encPriv and decPriv encrypt and decrypt private key', () {
    const priv = privKey;
    const password = 'testPassword';
    final encPriv = walletApi.encPriv(priv, password);
    final decPriv = walletApi.decPriv(encPriv, password);
    expect(decPriv, priv);
  });

  test('privToPub converts private key to public key', () {
    const priv = privKey;
    final pub = walletApi.privToPub('ETH', priv);
    expect(pub, pubKey);
  });

  test('pubToAddr converts public key to address', () {
    const pub = pubKey;
    final addr = walletApi.pubToAddr('ETH', pub);
    expect(addr, address);
  });
}
