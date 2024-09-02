import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:fwallet/api/tx.dart';
import 'package:fwallet/bean/coin_bean.dart';
import 'package:fwallet/bean/pwallet_bean.dart';
import 'package:fwallet/const/app_colors.dart';
import 'package:fwallet/pages/wallet/wallet_item.dart';
import 'package:fwallet/provider/p.dart';
import 'package:fwallet/utils/app_utils.dart';
import 'package:fwallet/widget/widgets.dart';
// import 'package:fwallet/widget/.dart';

class SendPage extends ConsumerStatefulWidget {
  const SendPage({super.key});

  @override
  ConsumerState<SendPage> createState() => _SendPageState();
}

class _SendPageState extends ConsumerState<SendPage> {
  String _balance = '0.00';
  TxFee _fee = TxFee();
  double? _setFee;
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _remarkController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic>? arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final coin = arguments?['coin'] as CoinBean;
    final title = '${coin.name}(${coin.nickname})转账';
    final wallet = ref.watch(walletProvider);
    final balance = ref.watch(balanceProvider(coin));
    balance.when(
        data: (data) {
          double blc = data;
          String strBalance = blc.toStringAsFixed(2);
          setState(() {
            _balance = strBalance;
          });
        },
        loading: () {},
        error: (e, s) {});
    final fee = ref.watch(feeProvider(coin.chain!));
    fee.when(
        data: (data) {
          setState(() {
            _fee = data;
          });
        },
        loading: () {},
        error: (e, s) {});
    final max = double.tryParse(_fee.high ?? '0.0') ?? 0.0;
    final min = double.tryParse(_fee.low ?? '0.0') ?? 0.0;
    final setFee = double.tryParse(_fee.average ?? '0.0') ?? 0.0;

    final addressCard = Card(
      color: Colors.white.withOpacity(0.88),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                const Text(
                  '收款方',
                  style: TextStyle(fontSize: 20),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.account_balance_wallet),
                  onPressed: () async {
                    final address = await _showBottomDrawer(context, coin);
                    setState(() {
                      _addressController.text = address;
                    });
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.contacts),
                  onPressed: () {},
                ),
                const SizedBox(width: 10),
                scanButton(context, size: 24, (barcode) {
                  setState(() {
                    // _addressController.text = barcode;
                  });
                }),
              ],
            ),
            TextField(
              controller: _addressController,
              style: const TextStyle(
                  fontSize: 14, fontFamily: 'monospace', color: Colors.black),
              maxLines: null,
              decoration: const InputDecoration(
                hintText: '请输入收款方地址',
                filled: true,
                fillColor: Colors.white60,
                // focusedBorder: OutlineInputBorder(
                //   borderRadius: BorderRadius.all(Radius.circular(8.0)),
                //   borderSide: BorderSide(color: Colors.blue),
                // ),
                hintStyle: TextStyle(color: Colors.grey),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              ),
            ),
          ],
        ),
      ),
    );
    final amountCard = Card(
      color: Colors.white.withOpacity(0.88),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                const Text(
                  '发送数量',
                  style: TextStyle(fontSize: 20),
                ),
                const Spacer(),
                Text(
                  '$_balance ${coin.chain}',
                  style: const TextStyle(color: Colors.blue, fontSize: 20),
                )
              ],
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: '请输入数量',
                filled: true,
                fillColor: Colors.white60,
                // focusedBorder: OutlineInputBorder(
                //   borderRadius: BorderRadius.all(Radius.circular(8.0)),
                //   borderSide: BorderSide(color: Colors.blue),
                // ),
                hintStyle: TextStyle(color: Colors.grey),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              ),
            ),
          ],
        ),
      ),
    );
    final feeCard = Card(
      color: Colors.white.withOpacity(0.88),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                const Text(
                  '矿工费',
                  style: TextStyle(fontSize: 20),
                ),
                const Spacer(),
                Text(
                  '${_setFee ?? setFee} ${coin.chain}',
                  style: const TextStyle(color: Colors.black, fontSize: 20),
                )
              ],
            ),
            Column(
              children: [
                Slider(
                  value: _setFee ?? setFee,
                  min: min,
                  max: max,
                  divisions: 100,
                  label: _setFee.toString(),
                  onChanged: (value) {
                    setState(() {
                      _setFee = value;
                    });
                  },
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 16, right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '慢',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      Text(
                        '最佳',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      Text(
                        '快',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
    final remarkCard = Card(
      color: Colors.white.withOpacity(0.88),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                const Text(
                  '上链备注（选填）',
                  style: TextStyle(fontSize: 20),
                ),
                IconButton(
                  icon: const Icon(Icons.help_outline),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('说明'),
                          content: const Text('这里可以填写上链备注，这是一个可选项。'),
                          actions: [
                            TextButton(
                              child: const Text('确定'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
                const Spacer(),
              ],
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _remarkController,
              decoration: const InputDecoration(
                hintText: '备注说明',
                filled: true,
                fillColor: Colors.white60,
                // focusedBorder: OutlineInputBorder(
                //   borderRadius: BorderRadius.all(Radius.circular(8.0)),
                //   borderSide: BorderSide(color: Colors.blue),
                // ),
                hintStyle: TextStyle(color: Colors.grey),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              ),
            ),
          ],
        ),
      ),
    );
    final button = Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        width: double.infinity,
        height: 48,
        decoration: BoxDecoration(
          color: Colors.black,
          border: Border.all(color: Colors.grey.shade100),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
            minimumSize: const Size(double.infinity, 48),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          onPressed: () async {
            final ok = await wallet.unlock(context);
            if (!ok) {
              return;
            }
            _transfer(coin, wallet);
          },
          child: const Text(
            '确认转账',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
    return Scaffold(
      appBar: appBar(context, title),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                const Spacer(),
                Text(
                  wallet.name ?? '',
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(width: 16),
              ],
            ),
            const SizedBox(height: 10),
            addressCard,
            const SizedBox(height: 16),
            amountCard,
            const SizedBox(height: 16),
            feeCard,
            const SizedBox(height: 16),
            remarkCard,
            const SizedBox(height: 16),
            button,
            // const Expanded(
            //   child: Center(),
            // ),
          ],
        ),
      ),
    );
  }

  Future<String> _showBottomDrawer(context, coin) async {
    final db = getDB();
    final list = await db.query("Wallet");
    final wallets = list.map((e) => PwalletBean.fromJson(e)).toList();
    final address = await showModalBottomSheet<String>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(1),
          ),
          padding: const EdgeInsets.all(20),
          child: ListView.builder(
            itemCount: wallets.length,
            itemBuilder: (context, index) {
              final wallet = wallets[index];
              return FutureBuilder(
                future: getCoin(
                    wallet.id ?? 1, coin.name ?? '', coin.chain ?? 'ETH'),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return const Center(child: Text('Error'));
                  } else {
                    final wcoin = snapshot.data;
                    final address = wcoin?.address ?? '';
                    final wgt = Column(
                      children: [
                        const SizedBox(height: 10),
                        Row(
                          mainAxisSize: MainAxisSize
                              .min, // 设置 mainAxisSize 为 MainAxisSize.min
                          children: [
                            const SizedBox(width: 50),
                            Text(
                              wallet.name ?? '',
                              style: const TextStyle(
                                  fontSize: 13, color: Colors.white),
                            ),
                            const SizedBox(width: 20),
                            Text(
                              wallet.typeString(),
                              style: TextStyle(
                                  fontSize: 13, color: AppColors.gray8e),
                            ),
                            const Spacer(),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisSize: MainAxisSize
                              .min, // 设置 mainAxisSize 为 MainAxisSize.min
                          children: [
                            const SizedBox(width: 50),
                            Text(
                              address.length > 34
                                  ? '${address.substring(0, 18)}...${address.substring(address.length - 16)}'
                                  : address,
                              style: TextStyle(
                                fontSize: 12,
                                color: AppColors.gray8e,
                                fontFamily: 'monospace',
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                    return Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: WalletItem(wgt, () {
                        Navigator.of(context).pop(address);
                      }, wid: wallet.id ?? 1),
                    );
                  }
                },
              );
            },
          ),
        );
      },
    );
    return address ?? '';
  }

  void _transfer(CoinBean coin, PwalletBean wallet) async {
    if (wallet.type == PwalletBean.TYPE_KEYADD ||
        wallet.type == PwalletBean.TYPE_RECOVER) {
      return;
    }

    final to = _checkAddress(_addressController.text);
    if (to == null) {
      toast('收款方地址错误');
      return;
    }

    final amount = double.parse(_amountController.text);
    if (amount < 0) {
      toast('转账数量必须大于0');
      return;
    }
    if (amount > double.parse(_balance)) {
      toast('余额不足');
      return;
    }

    final note = _remarkController.text;
    final fee = _setFee;
    final txArgs = TxArgs(wallet, coin, to, amount, fee!, wallet.realPassword!,
        note: note);

    // // 显示对话框
    // showDialog(
    //   context: context,
    //   barrierDismissible: false,
    //   builder: (BuildContext context) {
    //     return const AlertDialog(
    //       content: Row(
    //         children: [
    //           CircularProgressIndicator(),
    //           SizedBox(width: 20),
    //           Text('正在发送交易，请等待...'),
    //         ],
    //       ),
    //     );
    //   },
    // );
    EasyLoading.show(status: '正在发送交易，请等待...');

    // 监听交易结果
    ref.watch(sendTxProvider(txArgs)).when(
      data: (result) {
        // Navigator.of(context).pop(); // 关闭对话框
        EasyLoading.dismiss();
        toast('交易成功');
      },
      loading: () {
        // 这里可以选择不做任何操作，因为对话框已经显示
      },
      error: (error, stackTrace) {
        // Navigator.of(context).pop(); // 关闭对话框
        EasyLoading.dismiss();
        toast('交易失败: $error');
      },
    );
  }

  String? _checkAddress(String addrStr) {
    if (addrStr.isEmpty) {
      toast('请输入收款方地址');
      return null;
    }
    var address = addrStr.trim();
    final lowerAddress = address.toLowerCase();
    const list = ["BTY", "BTC", "ETH", "TRX", "BNB"];
    final ens = list.firstWhere(
        (test) => lowerAddress.startsWith(test.toLowerCase()), orElse: () {
      return '';
    });

    if (ens.isNotEmpty) {
      address = resolveEns(ens);
    }
    return address;
  }

  String resolveEns(String ens) {
    return '';
  }
}
