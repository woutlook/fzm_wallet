import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:fwallet/bean/coin_bean.dart';
import 'package:fwallet/bean/pwallet_bean.dart';
import 'package:fwallet/const/my_routers.dart';
import 'package:fwallet/pages/wallet/coin_item.dart';
import 'package:fwallet/pages/wallet/wallet_details_page.dart';
import 'package:fwallet/provider/p.dart';
import 'package:fwallet/widget/widgets.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  // ignore: unused_field
  final StreamController<List<String>> _controller =
      StreamController<List<String>>();

  @override
  void initState() {
    super.initState();
    // fetchData();
  }

  // fetchData() async {
  //   final db = getDB();
  //   List<Map> list = await db.query('Wallet');
  //   // });

  //   var walletId = SP.getWalletId();
  //   var id = -1;
  //   if (list.isNotEmpty) {
  //     id = walletId == -1 ? list[0]["id"] : walletId;
  //     List<Map> wallets =
  //         await db.query('Wallet', where: 'id = ?', whereArgs: [id]);
  //     final wallet = wallets.map((e) => PwalletBean.fromJson(e)).first;
  //     // ref.read(walletIdProvider.notifier).state = id;
  //     ref.read(walletProvider.notifier).state = wallet;

  //     final list1 =
  //         await db.query('Coin', where: 'pwalletId = ?', whereArgs: [id]);
  //     final coins = list1.map((e) => CoinBean.fromJson(e)).toList();
  //     ref.read(coinsProvider.notifier).updateCoins(coins);
  //   }
  // }

  void _handleScan(barcodeCapture) {
    // barcodeCapture.startScan();
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(x);
    final coins = ref.watch(coinsProvider);
    final filterCoins = coins.where((coin) => coin.added).toList();
    final wallet = ref.watch(walletProvider);
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
                              wallet.name ?? wallet.id.toString(),
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
                itemCount: filterCoins.length,
                itemBuilder: (context, i) => InkWell(
                  child: CoinItem(filterCoins[i]),
                  onTap: () {
                    var item = filterCoins[i];
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

  // Future<void> gotoScan() async {
  //   Navigator.of(context).push(
  //     MaterialPageRoute(
  //       builder: (context) => const Scan(),
  //     ),
  //   );
  //   // Log.i(result.toString());
  // }

  Future<void> gotoMyWallets() async {
    var result = await Navigator.pushNamed(context, MyRouter.MY_WALLETS_PAGE);
    if (result == null) {
      return;
    }
    final wallet = result as PwalletBean;
    ref.read(walletProvider.notifier).updateWallet(wallet);
    final db = ref.read(dbProvider);
    final list =
        await db.query('Coin', where: 'pwalletId = ?', whereArgs: [wallet.id]);
    final coins = list.map((e) => CoinBean.fromJson(e)).toList();
    ref.read(coinsProvider.notifier).updateCoins(coins);
  }

//或者
/*  void gotoMyWallets2() {
    Navigator.pushNamed(context, MyRouter.MY_WALLETS_PAGE).then((result) {
      var wallet = result as PwalletBean;
      setState(() {
        _name = " ${ wallet.name} ${ wallet.id}";
      });
    });
  }*/
}
