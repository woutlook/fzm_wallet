import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fzm_wallet/models/coin.dart';
import 'package:fzm_wallet/provider/p.dart';
import 'package:fzm_wallet/utils/app_utils.dart';

class CoinItem extends ConsumerWidget {
  final Coin _coin;

  const CoinItem(this._coin, {super.key});

  @override
  Widget build(BuildContext context, ref) {
    final balancer = ref.watch(balanceProvider(_coin));
    return balancer.when(
      data: (balance) {
        String strBalance = balance.toStringAsFixed(4);
        // 去掉末尾的0
        var formattedBalance =
            strBalance.replaceAll(RegExp(r"([.]*0)(?!.*\d)"), "");
        return _buildCoinItem(context, ref, formattedBalance);
      },
      loading: () => _buildLoading(),
      error: (e, s) {
        Log.e('${_coin.name} $e');
        return _buildError();
      },
    );
  }

  Widget _buildCoinItem(BuildContext context, ref, String balance) {
    final wallet = ref.watch(walletProvider);
    final address = wallet.getAccountAddress(chain: _coin.chain);
    final c = Container(
      height: 70,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.black.withAlpha(25),
          blurRadius: 5,
          spreadRadius: 2,
        ),
        BoxShadow(
          color: Colors.white.withAlpha(25),
          blurRadius: 5,
          spreadRadius: 2,
        ),
      ], color: Colors.white, borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.only(left: 16, right: 16),
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Image.asset(
            _coin.icon ?? '',
            width: 32,
            height: 32,
            // fit: BoxFit.cover,
            errorBuilder:
                (BuildContext context, Object error, StackTrace? stackTrace) {
              return const Icon(Icons.error, size: 32); // 或者你可以使用其他占位符图像
            },
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      _coin.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      formatAddress(address, start: 10, end: 8),
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: Text(
                    '(${_coin.nickname ?? ''})',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Text(
            balance,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
    return c;
  }

  Widget _buildLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildError() {
    return const Center(
      child: Icon(Icons.error, color: Colors.red),
    );
  }
}
