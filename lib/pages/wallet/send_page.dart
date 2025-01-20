import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fzm_wallet/models/coin.dart';
import 'package:fzm_wallet/models/store.dart';

import 'package:fzm_wallet/models/tx.dart';
import 'package:fzm_wallet/models/const/app_colors.dart';
import 'package:fzm_wallet/models/wallet.dart';
import 'package:fzm_wallet/models/wapi.dart';
import 'package:fzm_wallet/pages/my/contacts.dart';
import 'package:fzm_wallet/pages/wallet/wallet_item.dart';
import 'package:fzm_wallet/provider/p.dart';
import 'package:fzm_wallet/utils/app_utils.dart';
import 'package:fzm_wallet/widget/widgets.dart';

class SendPage extends ConsumerStatefulWidget {
  const SendPage({super.key});

  @override
  ConsumerState<SendPage> createState() => _SendPageState();
}

class _SendPageState extends ConsumerState<SendPage> {
  String _balance = '0.00';
  Fee _fee = Fee();
  double? _setFee;
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _remarkController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return buildLayout(context, child: _build(context));
  }

  Widget _build(BuildContext context) {
    final coin = ref.watch(coinProvider);
    final toAddress = ref.watch(toAddressProvider);
    _addressController.text = toAddress ?? '';
    final title = '${coin!.name}(${coin.nickname})转账';
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
    final fee = ref.watch(feeProvider(coin.chain));
    fee.when(
        data: (data) {
          setState(() {
            _fee = data;
            _setFee = _fee.average;
          });
        },
        loading: () {},
        error: (e, s) {});
    final max = _fee.high ?? 0.0;
    final min = _fee.low ?? 0.0;
    final setFee = _fee.average ?? 0.0;

    final addressCard = Card(
      color: Colors.white.withAlpha(225),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                const Text(
                  '收款方',
                  style: TextStyle(fontSize: 16),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.account_balance_wallet),
                  onPressed: () async {
                    final address = await _showBottomDrawer(context, coin);
                    if (address == null) {
                      return;
                    }
                    ref.read(toAddressProvider.notifier).state = address;
                    setState(() {});
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.contacts),
                  onPressed: () async {
                    await Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const MyContactsPage();
                    }));
                  },
                ),
                const SizedBox(width: 10),
                scanButton(context, size: 24, onDetect: (barcodeCapture) {
                  final result = barcodeCapture.barcodes.first.rawValue;
                  ref.read(toAddressProvider.notifier).state = result;
                  setState(() {});
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
      color: Colors.white.withAlpha(225),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                const Text(
                  '发送数量',
                  style: TextStyle(fontSize: 16),
                ),
                const Spacer(),
                Text(
                  '$_balance ${coin.name}',
                  style: const TextStyle(color: Colors.blue, fontSize: 16),
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
      color: Colors.white.withAlpha(225),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                const Text(
                  '矿工费',
                  style: TextStyle(fontSize: 16),
                ),
                const Spacer(),
                Text(
                  '${(_setFee ?? setFee).toStringAsFixed(5)} ${coin.name}',
                  style: const TextStyle(color: Colors.black, fontSize: 16),
                )
              ],
            ),
            Column(
              children: [
                Slider(
                  value: _setFee ?? setFee,
                  min: min,
                  max: max,
                  divisions: 10,
                  label:
                      _setFee?.toStringAsFixed(5) ?? setFee.toStringAsFixed(5),
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
      color: Colors.white.withAlpha(225),
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Column(
          children: [
            Row(
              children: [
                const Text(
                  '上链备注（选填）',
                  style: TextStyle(fontSize: 16),
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
            // const SizedBox(height: 8),
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
            final password = await showPasswordDialog(context);
            if (password == null) {
              return;
            }
            await _transfer(coin, wallet, password);
          },
          child: const Text(
            '确认转账',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
    final from = wallet.getAccountAddress(chain: coin.chain);
    return Scaffold(
      appBar: appBar(context, title),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Row(
                children: [
                  Text(
                    '${wallet.name}: ',
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    formatAddress(from),
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                  const Spacer(),
                ],
              ),
            ),
            const SizedBox(height: 10),
            addressCard,
            const SizedBox(height: 10),
            amountCard,
            const SizedBox(height: 10),
            feeCard,
            const SizedBox(height: 10),
            remarkCard,
            const SizedBox(height: 10),
            button,
            // const Expanded(
            //   child: Center(),
            // ),
          ],
        ),
      ),
    );
  }

  Future<String?> _showBottomDrawer(context, Coin coin) async {
    final wallets = store.getWalletList();
    final rwallet = await showModalBottomSheet<String>(
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
              final name = wallets[index];
              return Builder(builder: (context) {
                final wallet = store.getWallet(name);
                if (wallet == null) {
                  return const SizedBox();
                }

                final address = wallet.getAccountAddress(chain: coin.chain);
                final wgt = Column(
                  children: [
                    const SizedBox(height: 10),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(width: 50),
                        Text(
                          wallet.name,
                          style: const TextStyle(
                              fontSize: 13, color: Colors.white),
                        ),
                        const SizedBox(width: 20),
                        Text(
                          wallet.typeString(),
                          style:
                              TextStyle(fontSize: 13, color: AppColors.gray8e),
                        ),
                        // const Spacer(),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisSize: MainAxisSize
                          .min, // 设置 mainAxisSize 为 MainAxisSize.min
                      children: [
                        const SizedBox(width: 50),
                        Text(
                          formatAddress(address, start: 18, end: 16),
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
                  }, name: wallet.name),
                );
              });
            },
          ),
        );
      },
    );
    return rwallet;
  }

  Future<void> _transfer(Coin coin, Wallet wallet, String password) async {
    if (wallet.type == WalletType.address) {
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
    final targs = TokenTxArgs(
      token: coin,
      to: to,
      amount: amount,
      fee: fee,
      note: note,
    );

    EasyLoading.show(status: '正在发送交易，请等待...');

    final priv = await wallet.getAccountPrivateKey(
        chain: coin.chain, password: password);

    final tx = await walletApi.sendToken(privateKey: priv, args: targs);
    EasyLoading.dismiss();
    if (mounted) {
      if (tx == null) {
        toast('发送交易失败');
        return;
      }
      toast('发送交易成功');
      Navigator.pop(context, tx);
    }
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
