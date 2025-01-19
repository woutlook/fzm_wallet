import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fzm_wallet/models/coin.dart';
import 'package:fzm_wallet/models/config.dart';
import 'package:fzm_wallet/models/tx.dart';
import 'package:fzm_wallet/models/wallet.dart';
import 'package:fzm_wallet/pages/wallet/recv_page.dart';
import 'package:fzm_wallet/pages/wallet/send_page.dart';
import 'package:fzm_wallet/pages/wallet/tx_details_page.dart';
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
                    formatAddress(address, start: 18, end: 16),
                    style: const TextStyle(
                        fontFamily: 'monospace', color: Colors.blueGrey),
                  ),
                  const SizedBox(
                    width: 10,
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
                          if (wallet.type == WalletType.address) {
                            toast('地址钱包不支持转账');
                            return;
                          }
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
                                _buildTabView(context, coin, 0),
                                _buildTabView(context, coin, 1),
                                _buildTabView(context, coin, 2),
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

  Widget _buildTxListItem(context, index, Tx tx, coin, bool isSend) {
    String status = '完成';
    if (tx.status == 2) {
      status = '失败';
    } else if (tx.status == 1) {
      status = '确认中';
    }
    double value = tx.value;
    if (isSend) {
      value = -value;
    }
    final timestamp = DateTime.fromMillisecondsSinceEpoch(tx.timestamp! * 1000);
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            final url = getChainScanUrl(coin.chain);
            return TxDetailsPage(
              tx: tx,
              scanUrl: url,
              chain: coin.chain,
            );
          }));
        },
        child: Card(
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      '$value ${coin.name}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      status,
                      style: TextStyle(
                          color: tx.status == 2 ? Colors.red : Colors.green,
                          fontSize: 14),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      formatAddress(tx.to, start: 8, end: 8),
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      timestamp.toString().substring(0, 19),
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
                const Divider(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTabView(context, coin, int index) {
    final txlistP = ref.watch(txListProvider(coin));
    final wallet = ref.watch(walletProvider);
    final address = wallet.getAccountAddress(chain: coin.chain).toLowerCase();
    return txlistP.when(
        data: (list) {
          if (index == 1) {
            list =
                list.where((tx) => tx.from.toLowerCase() == address).toList();
          } else if (index == 2) {
            list = list.where((tx) => tx.to.toLowerCase() == address).toList();
          }
          return Padding(
            padding: const EdgeInsets.all(10),
            child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                final tx = list[index];
                return _buildTxListItem(
                    context, index, tx, coin, tx.from.toLowerCase() == address);
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
