import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:blockchain_utils/blockchain_utils.dart' as chains;

import 'package:fzm_wallet/models/chain33.dart';
import 'package:fzm_wallet/models/coin.dart';
import 'package:fzm_wallet/models/const/tokens.dart';
import 'package:fzm_wallet/models/wapi.dart';
import 'package:fzm_wallet/models/config.dart';
import 'package:fzm_wallet/models/tx.dart';
import 'package:fzm_wallet/utils/app_utils.dart';

void main() {
  // TestWidgetsFlutterBinding.ensureInitialized();
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group('BTY Tests', () {
    late Chain33Api bty;
    late Coin btyToken;
    late TokenTxArgs btyArgs;
    late String btyPrivKey;
    const from = '15AvnuWS9ELE7R1NDfrJotjmjB8R7QqkPr';
    const to = '1JvhkjuebpLJ1ZHGXyCTDHyct5taUzgRRt';

    setUp(() async {
      await initCoinList();
      bty = Chain33Api(config: btyConfig);
      btyToken = nativeCoinList.where((e) => e.symbol == 'BTY').first;
      btyPrivKey =
          'f91002892b763eaf71602c8d2ebf92c3406ad6a70dd1a1ea9a07a9a5cfb587d2';
      final txFee = await bty.getFee();
      btyArgs = TokenTxArgs(
        amount: 1.0,
        fee: txFee.average!,
        token: btyToken,
        from: from,
        to: to,
      );
    });
    test('_createTx should create a valid transaction', () async {
      final tx = bty.createTx_test(args: btyArgs);
      final data = tx.writeToBuffer();
      final hash = chains.QuickCrypto.sha256Hash(data);
      final hexHash = chains.BytesUtils.toHexString(hash, prefix: '0x');
      Log.d('hash: $hexHash');
      final signedTx = bty.signTx_test(privateKey: btyPrivKey, tx: tx);
      final hex = chains.BytesUtils.toHexString(signedTx);
      Log.d('hex: $hex');
    });

    test('_createTx should create a valid transaction', () async {
      final tx = await bty.createTx_test2(args: btyArgs);
      Log.d('hex: $tx');
    });

    test('sendToken shold send a bty token', () async {
      final tx = await bty.sendToken(args: btyArgs, privateKey: btyPrivKey);
      Log.d('tx: ${tx.toJson()}');
    });

    test('getTxList should return a list of transactions for a address',
        () async {
      final txList = await bty.getTxList(to, limit: 100);
      for (final tx in txList) {
        Log.d('tx: ${tx.toJson()}');
      }
    });

    test('getBalance, should return balance of a address', () async {
      final balance = await bty.getBalance(from);
      Log.d('hex: $balance');
    });

    test('privateKeyToAddress should return a valid address', () async {
      final pub = walletApi.privToPub('BTY',
          'f91002892b763eaf71602c8d2ebf92c3406ad6a70dd1a1ea9a07a9a5cfb587d2');
      Log.d('pub: $pub');
      expect(pub,
          '0x03c829db8d36c6761331357bbdbd5918a13a61ed15ed6079fcd3ba3fbfbe6c4f56');
      final address = walletApi.pubToAddr('BTY', pub);
      expect(address, '15AvnuWS9ELE7R1NDfrJotjmjB8R7QqkPr');
      Log.d('address: $address');
    });
  });

  group('YCC Tests', () {
    late Chain33Api ycc;
    late Coin yccToken;
    late TokenTxArgs yccArgs;
    late String yccPrivKey;
    late String from;
    late String to;

    setUp(() async {
      await loadTokens();
      ycc = Chain33Api(config: yccConfig);
      yccToken = nativeCoinList.where((e) => e.symbol == 'YCC').first;
      yccPrivKey =
          '79303d241aaac1e556b334dac82fe9c50718c902fdced7cba07e514be0905640';
      from = '0xa3F59D43cf7F90Ee1E14A4C47F260612Fc23B9Cf';
      to = '0x59540Ae65EE616edBB457640cA2E0fa037c0c66D';
      final txFee = await ycc.getFee();
      yccArgs = TokenTxArgs(
        amount: 1.0,
        fee: txFee.average!,
        token: yccToken,
        from: from,
        to: to,
      );
    });
    test('createTx should create a valid transaction', () async {
      final tx = ycc.createTx_test(args: yccArgs);
      final data = tx.writeToBuffer();
      final hash = chains.QuickCrypto.sha256Hash(data);
      final hexHash = chains.BytesUtils.toHexString(hash, prefix: '0x');
      Log.d('hash: $hexHash');
      final signedTx = ycc.signTx_test(privateKey: yccPrivKey, tx: tx);
      final hex = chains.BytesUtils.toHexString(signedTx);
      Log.d('hex: $hex');
    });

    test('privateKeyToAddress should return a valid address', () async {
      final pub = walletApi.privToPub('YCC', yccPrivKey);
      expect(pub,
          '0x03cc47899d29fdc6cae7a517dea8c77a69cecd8d0871364c911e7d2ed47b3f9253');
      final address = walletApi.pubToAddr('YCC', pub);
      expect(address, from);
      Log.d('address: $address');
    });

    test('getBalance, should return balance of a address', () async {
      final balance = await ycc.getBalance(from);
      Log.d('hex: $balance');
    });

    test('createTx should create a valid transaction', () async {
      final tx = await ycc.createTx_test2(args: yccArgs);
      Log.d('hex: $tx');
    });

    test('sendToken shold send a ycc token', () async {
      final tx = await ycc.sendToken(args: yccArgs, privateKey: yccPrivKey);
      Log.d('tx: ${tx.toJson()}');
    });

    test('getTxList should return a list of transactions for a address',
        () async {
      // Arrange
      final txList = await ycc.getTxList(from, limit: 100);
      for (final tx in txList) {
        Log.d('tx: ${tx.toJson()}');
      }
    });
  });
}
