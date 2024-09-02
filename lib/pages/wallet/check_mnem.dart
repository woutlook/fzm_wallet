import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fwallet/api/api.dart';
import 'package:fwallet/bean/coin_bean.dart';
import 'package:fwallet/const/base_data.dart';
import 'package:fwallet/const/my_routers.dart';
import 'package:fwallet/provider/p.dart';
import 'package:fwallet/widget/widgets.dart';

class CheckMnemPage extends ConsumerWidget {
  CheckMnemPage({super.key});
  final TextEditingController _mnemController = TextEditingController();

  @override
  Widget build(context, ref) {
    return Scaffold(
      appBar: appBar(context, "验证助记词"),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Column(
          children: [
            multLinesInput(_mnemController, '请输入助记词，用空格分割'),
            const SizedBox(height: 30),
            blueButton('开始校验', () async {
              final reslut = await _doCheckMnem();
              EasyLoading.dismiss();
              if (reslut) {
                if (context.mounted) {
                  Navigator.pushNamed(context, MyRouter.RESET_PASSWD_PAGE);
                }
              } else {
                EasyLoading.showError("助记词错误");
              }
            }),
          ],
        ),
      ),
    );
  }

  Future<bool> _doCheckMnem() async {
    EasyLoading.show();

    try {
      final preCoin = BaseData.DEFAULT_COINS[0];
      final mnemS = _mnemController.text;
      final mnem = formatString(mnemS);
      final db = getDB();
      final list = await db
          .query('Coin', where: 'netId = ?', whereArgs: [preCoin.netId]);
      final coin = list.map((e) => CoinBean.fromJson(e)).toList()[0];
      final map = WalletApi().getHDWallet(coin.chain!, mnem);
      final pub = map["pub"];
      return pub == coin.pubkey;
    } catch (e) {
      return false;
    }
  }
}
