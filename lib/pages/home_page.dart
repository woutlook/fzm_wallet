import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:fzm_wallet/models/const/my_routers.dart';
import 'package:fzm_wallet/pages/wallet/coin_item.dart';
import 'package:fzm_wallet/pages/wallet/wallet_details_page.dart';
import 'package:fzm_wallet/provider/p.dart';
import 'package:fzm_wallet/widget/widgets.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  void _handleScan(barcodeCapture) {}

  @override
  Widget build(BuildContext context) {
    return buildLayout(context, child: _build(context));
  }

  Widget _build(BuildContext context) {
    final wallet = ref.watch(walletProvider);
    final coins = wallet.coinList;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(context, wallet.typeString(),
          leading: scanButton(context, _handleScan),
          trailing: InkWell(
            onTap: () {
              gotoMyWallets();
            },
            child: const Image(
              image: AssetImage("images/home_top_wallet.png"),
              width: 32,
              height: 32,
            ),
          )),
      body: Container(
        margin: const EdgeInsets.only(left: 16, right: 16, top: 10),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: Stack(
                children: [
                  const Image(
                    image: AssetImage("images/header_wallet_hd_wallet.png"),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                        left: 20, top: 20, right: 14, bottom: 20),
                    height: 125,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "钱包名称",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                            InkWell(
                              onTap: () async {
                                await Navigator.of(context).push(
                                  PageRouteBuilder(
                                    pageBuilder: (context, animation,
                                            secondaryAnimation) =>
                                        const WalletDetailsPage(),
                                    transitionsBuilder: (context, animation,
                                        secondaryAnimation, child) {
                                      const begin = Offset(1.0, 0.0);
                                      const end = Offset.zero;
                                      const curve = Curves.ease;

                                      var tween = Tween(begin: begin, end: end)
                                          .chain(CurveTween(curve: curve));

                                      return SlideTransition(
                                        position: animation.drive(tween),
                                        child: child,
                                      );
                                    },
                                  ),
                                );
                                setState(() {});
                              },
                              child: Container(
                                padding: const EdgeInsets.only(right: 5),
                                child: const Image(
                                  image: AssetImage(
                                      "images/header_wallet_more.png"),
                                  height: 22,
                                  width: 22,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              wallet.name,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 22),
                            ),
                            InkWell(
                              onTap: () async {
                                await Navigator.pushNamed(
                                    context, MyRouter.ADD_TAB_PAGE);
                                setState(() {});
                              },
                              child: const Image(
                                image:
                                    AssetImage("images/header_wallet_add.png"),
                                height: 35,
                                width: 35,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: coins.length,
                itemBuilder: (context, i) => InkWell(
                  child: CoinItem(coins[i]),
                  onTap: () {
                    var item = coins[i];
                    Navigator.pushNamed(
                      context,
                      MyRouter.TRANS_PAGE,
                      arguments: {"coin": item},
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> gotoMyWallets() async {
    var result = await Navigator.pushNamed(context, MyRouter.MY_WALLETS_PAGE);
    if (result == null) {
      return;
    }
    // final wallet = result as PwalletBean;
    // ref.read(walletProvider.notifier).updateWallet(wallet);
    // ref.read(coinsProvider.notifier).updateWalletCoins(wallet);
  }
}
