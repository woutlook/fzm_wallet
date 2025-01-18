import 'package:flutter_test/flutter_test.dart';
import 'package:fzm_wallet/models/store.dart';
import 'package:fzm_wallet/models/wapi.dart';

void main() async {
  await store.storeInit();
  test('byteToHex converts byte array to hex string', () {
    final bytes = [0, 255, 16, 128];
    final hex = bytesToHex(bytes);
    expect(hex, '00ff1080');
  });

  test('passwordHash generates correct hash', () {
    const password = 'testPassword';
    final hash = hashData(password);
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

  test('encMnem and decMnem encrypt and decrypt mnemonic', () async {
    const mnem = chineseMenm;
    const password = 'testPassword';
    await store.setPassword(password);
    final encMnem = await store.encryptData(mnem, password);
    final decMnem = await store.decryptData(encMnem, password);
    expect(decMnem, mnem);
  });

  const privKey =
      "03dcfd17eb4616604a5e2e34c4f3201cfcde94f8733120408336d9ce9de76941";
  const pubKey =
      "02b504c91cba3191a3b064be6126f9a4b2d9083bb931c774f118f9719e92c26b65";
  const address = "0x0C840D45De3882eD511F3B7cdD8d8A383C38A28D";

  test('getHDWallet generates HD wallet', () {
    const mnem = mnemonic;
    final wallet = walletApi.getAccount(chain: 'BNB', mnem: mnem);
    expect(wallet['priv'], isNotEmpty);
    expect(wallet['pub'], isNotEmpty);
    expect(wallet['address'], isNotEmpty);
  });

  test('encPriv and decPriv encrypt and decrypt private key', () async {
    const priv = privKey;
    const password = 'testPassword';
    await store.setPassword(password);
    final encPriv = await store.encryptData(priv, password);
    final decPriv = await store.decryptData(encPriv, password);
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
