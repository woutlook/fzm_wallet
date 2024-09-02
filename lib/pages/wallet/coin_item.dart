import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// ignore: unused_import
import 'package:fwallet/bean/coin_bean.dart';
import 'package:fwallet/const/app_colors.dart';
import 'package:fwallet/provider/p.dart';
import 'package:fwallet/utils/app_utils.dart';

class CoinItem extends ConsumerWidget {
  final CoinBean coin;

  const CoinItem(this.coin, {super.key});

  @override
  Widget build(context, ref) {
    final balance = ref.watch(balanceProvider(coin));
    balance.when(
        data: (data) {
          coin.balance = data.toString();
        },
        loading: () {},
        error: (e, s) {
          Log.e('${coin.name} $e');
        });
    double? ba = double.tryParse(coin.balance ?? "");
    String? strBalance = ba?.toStringAsFixed(4);
    //去掉末尾的0
    var formattedBalance =
        strBalance?.replaceAll(RegExp(r"([.]*0)(?!.*\d)"), "");
    return Container(
      height: 70,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          //withOpacity不透明度
          color: Colors.black.withOpacity(0.1),
          //模糊半径
          blurRadius: 5,
          //扩散半径
          spreadRadius: 2,
        ),
        BoxShadow(
          color: Colors.white.withOpacity(0.1),
          blurRadius: 5,
          spreadRadius: 2,
        ),
      ], color: Colors.white, borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.only(left: 16, right: 16),
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          SizedBox(
            width: 32,
            height: 32,
            child: Image.network(coin.icon ?? "",
                width: 32, height: 32, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              coin.name ?? "",
              style: TextStyle(
                  color: AppColors.gray33,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text(
              "(${coin.nickname})",
              style: TextStyle(color: AppColors.gray8e, fontSize: 12),
            ),
          ),
          const Spacer(),
          Text(
            formattedBalance ?? "",
            style: TextStyle(fontSize: 18, color: AppColors.gray33),
          )
        ],
      ),
    );
  }

  String getBlance() {
    double? ba = double.tryParse(coin.balance ?? "");
    String? strBalance = ba?.toStringAsFixed(4);
    //去掉末尾的0
    var formattedNumber =
        strBalance?.replaceAll(RegExp(r"([.]*0)(?!.*\d)"), "");
    return formattedNumber ?? "";
  }
}
