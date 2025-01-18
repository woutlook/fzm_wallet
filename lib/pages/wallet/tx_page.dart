import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fzm_wallet/models/coin.dart';
import 'package:fzm_wallet/pages/wallet/recv_page.dart';
import 'package:fzm_wallet/pages/wallet/send_page.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'package:fzm_wallet/provider/p.dart';
import 'package:fzm_wallet/models/const/app_colors.dart';
import 'package:fzm_wallet/utils/app_utils.dart';
import 'package:fzm_wallet/widget/widgets.dart';

class TransPage extends ConsumerStatefulWidget {
  const TransPage({super.key});

  @override
  ConsumerState<TransPage> createState() => _TransPageState();
}

class _TransPageState extends ConsumerState<TransPage>
    with TickerProviderStateMixin {
  late TabController _tabcontroller;
  String _balance = '0.00';

  @override
  void initState() {
    _tabcontroller = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return buildLayout(context, child: _build(context));
  }

  Widget _build(BuildContext context) {
    // Map<String, dynamic>? arguments =
    //     ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    // var coin = arguments?["coin"] as Coin;
    final coin = ref.watch(coinProvider);
    final title = '${coin!.name}(${coin.nickname})';
    final balancer = ref.watch(balanceProvider(coin));

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: balancer.when(
        data: (data) {
          double ba = data;
          String strBalance = ba.toStringAsFixed(2);
          _balance = strBalance;
          return _build1(context, strBalance, coin, title);
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, s) => Center(child: Text('Error: $e')),
      ),
    );
  }

  Widget _build1(
      BuildContext context, String balance, Coin coin, String title) {
    final wallet = ref.watch(walletProvider);
    final address = wallet.getAccountAddress(chain: coin.chain);

    final card = Positioned(
      top: 20,
      left: 8,
      right: 8,
      child: Card(
        elevation: 4,
        color: Colors.grey.shade200,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 32,
                    height: 32,
                    child: Image.asset(
                      coin.icon ?? "",
                      width: 32,
                      height: 32,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.error),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    _balance,
                    style: const TextStyle(fontSize: 24, color: Colors.blue),
                  ),
                  const Spacer(),
                  QrImageView(
                    data: address,
                    size: 100,
                  ),
                  const SizedBox(width: 40),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    address.length > 34
                        ? '${address.substring(0, 18)}...${address.substring(address.length - 16)}'
                        : address,
                    style: const TextStyle(
                        fontFamily: 'monospace', color: Colors.blueGrey),
                  ),
                  IconButton(
                    icon: const Icon(Icons.copy),
                    onPressed: () {
                      Clipboard.setData(ClipboardData(text: address));
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('地址已复制到剪贴板')),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
    return Stack(
      children: [
        Column(
          children: [
            Container(
              height: 160,
              color: AppColors.gray6,
            ),
            Expanded(
              child: Container(
                color: Colors.white30,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        blackButton('转账', () {
                          ref.read(coinProvider.notifier).state = coin;
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const SendPage();
                          }));
                        }, width: 150),
                        blueButton('收款', () {
                          ref.read(coinProvider.notifier).state = coin;
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const RecvPage();
                          }));
                        }, width: 150),
                        scanButton(context, onDetect: (barcodeCapture) {
                          ref.read(coinProvider.notifier).state = coin;
                          final to = barcodeCapture.barcodes.first.rawValue;
                          ref.read(toAddressProvider.notifier).state = to;
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const SendPage();
                          }));
                          // todo: scan
                        }, size: 32),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          const Padding(
                            padding:
                                EdgeInsets.only(top: 8, left: 8, right: 16),
                            child: Row(
                              children: [
                                Icon(Icons.receipt_long),
                                SizedBox(width: 6),
                                Text('交易记录'),
                                Spacer(),
                                // Wrap(
                                //   crossAxisAlignment:
                                //       WrapCrossAlignment.center,
                                //   spacing: -10,
                                //   children: [
                                //     Checkbox(
                                //       value: hideTx,
                                //       onChanged: (value) {
                                //         SP.setHideLess1(coin.id!, value!);
                                //         setState(() {});
                                //       },
                                //     ),
                                //     Text('隐藏小于1${coin.nickname ?? ""}的交易'),
                                //   ],
                                // ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          TabBar(
                            // labelPadding: const EdgeInsets.only(left: 8),
                            isScrollable: true,
                            tabAlignment: TabAlignment.start,
                            controller: _tabcontroller,
                            tabs: const [
                              Tab(
                                child: Text(
                                  '全部',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                              Tab(
                                child: Text(
                                  '转账',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                              Tab(
                                child: Text(
                                  '收款',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ],
                          ),
                          Expanded(
                            child: TabBarView(
                              controller: _tabcontroller,
                              children: [
                                _buildTabView(context, coin),
                                _buildTabView(context, coin),
                                _buildTabView(context, coin),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        card,
      ],
    );
  }

  Widget _buildTxListItem(context, index, tx) {
    return ListTile(
      title: Text('title $index'),
      subtitle: Text('subtitle $index'),
    );
  }

  Widget _buildTabView(context, coin) {
    final txlistP = ref.watch(txListProvider(coin));
    return txlistP.when(
        data: (list) {
          final tabIndex = _tabcontroller.index;
          if (tabIndex == 1) {
            list.retainWhere((tx) => tx.from == coin.address);
          } else if (tabIndex == 2) {
            list.retainWhere((tx) => tx.to == coin.address);
          }
          return Padding(
            padding: const EdgeInsets.all(10),
            child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                final tx = list[index];
                return _buildTxListItem(context, index, tx);
              },
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, s) {
          Log.e('error: ${e.toString()}, $s');
          return Center(child: Text('error: ${e.toString()}, $s'));
        });
  }
}
