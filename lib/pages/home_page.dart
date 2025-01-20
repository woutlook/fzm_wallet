import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fzm_wallet/models/coin.dart';
import 'package:fzm_wallet/pages/wallet/add_coin_page.dart';

import 'package:fzm_wallet/pages/wallet/coin_item.dart';
import 'package:fzm_wallet/pages/wallet/my_wallets_page.dart';
import 'package:fzm_wallet/pages/wallet/send_page.dart';
import 'package:fzm_wallet/pages/wallet/tx_page.dart';
import 'package:fzm_wallet/pages/wallet/wallet_details_page.dart';
import 'package:fzm_wallet/provider/p.dart';
import 'package:fzm_wallet/widget/widgets.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
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
          leading: scanButton(context, onDetect: (barcodeCapture) {
            ref.read(coinProvider.notifier).state =
                nativeCoinList[0]; // default coin is BTY
            final to = barcodeCapture.barcodes.first.rawValue;
            ref.read(toAddressProvider.notifier).state = to;
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const SendPage();
            }));
          }),
          trailing: InkWell(
            onTap: () {
              gotoMyWallets();
            },
            child: const Image(
              image: AssetImage("assets/images/home_top_wallet.png"),
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
                    image:
                        AssetImage("assets/images/header_wallet_hd_wallet.png"),
                    fit: BoxFit.cover,
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                        left: 20, top: 10, right: 14, bottom: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Text(
                                wallet.name,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 40),
                              ),
                            ),
                            const Spacer(),
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
                                      "assets/images/header_wallet_more.png"),
                                  height: 22,
                                  width: 22,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Divider(
                          color: Colors.white30,
                          height: 1,
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Text(
                                '总资产:  0.00 \$',
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 32),
                              ),
                            ),
                            InkWell(
                              onTap: () async {
                                await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const AddCoinPage()));
                                setState(() {});
                              },
                              child: const Image(
                                image: AssetImage(
                                    "assets/images/header_wallet_add.png"),
                                height: 35,
                                width: 35,
                              ),
                            ),
                          ],
                        ),
                        // const SizedBox(height: 30),
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
                    final coin = coins[i];
                    ref.read(coinProvider.notifier).state = coin;
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const TransPage();
                    }));
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
    final result = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => const MyWalletsPage()));
    if (result == null) {
      return;
    }
  }
}
