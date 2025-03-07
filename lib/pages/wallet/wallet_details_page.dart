import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:fzm_wallet/models/coin.dart';
import 'package:fzm_wallet/models/store.dart';
import 'package:fzm_wallet/models/wallet.dart';
import 'package:fzm_wallet/pages/wallet/change_passwd.dart';
import 'package:fzm_wallet/pages/wallet/import_wallet_page.dart';
import 'package:fzm_wallet/models/const/app_colors.dart';
import 'package:fzm_wallet/provider/p.dart';
import 'package:fzm_wallet/utils/app_utils.dart';
import 'package:fzm_wallet/widget/my_page_item.dart';
import 'package:fzm_wallet/widget/widgets.dart';
import 'package:qr_flutter/qr_flutter.dart';

class WalletDetailsPage extends ConsumerStatefulWidget {
  const WalletDetailsPage({super.key});

  @override
  ConsumerState<WalletDetailsPage> createState() => _WalletDetailsPageState();
}

class _WalletDetailsPageState extends ConsumerState<WalletDetailsPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return buildLayout(context, child: _build(context));
  }

  Widget _build(BuildContext context) {
    final noPasswordPay = ref.watch(noPassworkPayProvider);
    final wallet = ref.watch(walletProvider);
    if (_controller.text.isEmpty) {
      _controller.text = wallet.name;
    }
    // final showCoins = nativeCoinList;
    return Scaffold(
      appBar: appBar(context, '钱包设置'),
      body: SingleChildScrollView(
        child: RepaintBoundary(
          child: Column(
            children: [
              MyPageItem(
                "assets/images/icon_share.png",
                "忘记密码",
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ImportWalletPage();
                  }));
                },
              ),
              MyPageItem(
                "assets/images/icon_share.png",
                "修改密码",
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ChangePasswordPage();
                  }));
                },
              ),
              MyPageItem(
                "assets/images/icon_share.png",
                "修改钱包名称",
                onTap: () async {
                  final result =
                      await _showCustomDialog(context, '修改钱包名称', '请输入新的钱包名称');
                  if (result != null) {
                    _updateWalletName(wallet, result);
                  }
                },
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 5),
                child: Row(
                  children: [
                    const Image(
                      image: AssetImage('assets/images/icon_share.png'),
                      width: 25,
                      height: 25,
                    ),
                    const SizedBox(width: 20),
                    Text(
                      '开启免密支付',
                      style: TextStyle(color: AppColors.gray33, fontSize: 16),
                    ),
                    const Spacer(),
                    Transform.scale(
                      scale: 0.7,
                      child: Switch(
                          value: noPasswordPay,
                          onChanged: (value) async {
                            // todo sth
                          }),
                    ),
                  ],
                ),
              ),
              MyPageItem(
                "assets/images/icon_share.png",
                "导出助记词",
                onTap: () async {
                  if (wallet.type != WalletType.mnemonic) {
                    toast("只有助记词钱包才能导出助记词");
                    return;
                  }
                  final password = await _showPasswordDialog(context);
                  if (password == null || password.isEmpty) {
                    return;
                  }
                  if (!context.mounted) {
                    return;
                  }
                  _showMnemDialog(context, wallet, password);
                },
              ),
              MyPageItem(
                "assets/images/icon_share.png",
                "导出私钥",
                onTap: () async {
                  final password = await _showPasswordDialog(context);
                  if (password == null || password.isEmpty) {
                    return;
                  }
                  if (!context.mounted) {
                    return;
                  }
                  _showBottomDrawer(context, (coin) async {
                    await _showKeyDialog(context, coin,
                        password: password, wallet: wallet);
                  });
                },
              ),
              MyPageItem(
                "assets/images/icon_share.png",
                "导出公钥",
                onTap: () async {
                  _showBottomDrawer(context, (coin) async {
                    await _showKeyDialog(context, coin, wallet: wallet);
                  });
                },
              ),
              MyPageItem(
                "assets/images/icon_share.png",
                "绑定找回钱包",
                onTap: () async {
                  final password = await _showPasswordDialog(context);
                  if (password == null || password.isEmpty) {
                    return;
                  }
                },
              ),
              // Padding(
              //   padding: const EdgeInsets.all(16),
              //   child: ElevatedButton(
              //     style: ElevatedButton.styleFrom(
              //       backgroundColor: Colors.red,
              //       padding: const EdgeInsets.only(
              //           left: 50, right: 50, top: 10, bottom: 10),
              //     ),
              //     onPressed: () async {
              //       final password =
              //           await _showPasswordDialog(context, wallet.password);
              //       if (password == null || password.isEmpty) {
              //         return;
              //       }
              //       _deleteWallet(wallet);
              //     },
              //     child: const Text(
              //       "删除钱包",
              //       style: TextStyle(color: Colors.black, fontSize: 16),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showBottomDrawer(context, onTap) async {
    final coins = nativeCoinList;
    await showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
          ),
          // height: 400,
          // color: Colors.white,
          child: Column(
            children: [
              // 按钮行
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    child: const Text(
                      '取消',
                      style: TextStyle(color: Colors.grey),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const Text(
                    '选择',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 32,
                  ),
                ],
              ),
              // 列表
              Expanded(
                child: ListView.builder(
                  itemCount: coins.length, // 假设 coins 是一个包含所有币种信息的列表
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(10),
                      child: LayoutBuilder(builder: (context, constraints) {
                        final coin = coins[index];
                        final wallet = ref.read(walletProvider);
                        final address =
                            wallet.getAccountAddress(chain: coin.chain);

                        final displayAddress =
                            formatAddress(address, start: 18, end: 16);
                        return InkWell(
                          onTap: () {
                            onTap(coin);
                          },
                          child: Row(
                            children: [
                              Image.asset(
                                coin.icon ?? '',
                                width: 32,
                                height: 32,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) =>
                                    const Icon(Icons.error),
                              ),
                              const SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('${coin.name} ${coin.nickname ?? ''}'),
                                  Text(
                                    displayAddress,
                                    style: const TextStyle(
                                      fontFamily: 'monospace',
                                      color: Colors.grey,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        );
                      }),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _showKeyDialog(context, Coin coin,
      {String? password, required Wallet wallet}) async {
    final keyTitle = password == null || password.isEmpty ? '公钥' : '私钥';
    String key = wallet.getAccountPublicKey(chain: coin.chain);
    if (password != null && password.isNotEmpty) {
      key = await wallet.getAccountPrivateKey(
          chain: coin.chain, password: password);
    }
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.0),
          ),
          child: Container(
            padding:
                const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
            height: 440,
            width: 400,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: <Widget>[
                      Text(
                        '${coin.name} $keyTitle',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      const Spacer(),
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                ),
                const Divider(),
                const SizedBox(height: 30),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: key.substring(0, key.length ~/ 2),
                        style: const TextStyle(
                            fontFamily: 'monospace', fontSize: 13),
                      ),
                      const TextSpan(
                        text: '\n',
                      ),
                      TextSpan(
                        text: key.substring(key.length ~/ 2),
                        style: const TextStyle(
                            fontFamily: 'monospace', fontSize: 13),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                QrImageView(
                  data: key,
                  size: 120.0,
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                  ),
                  child:
                      const Text('复制', style: TextStyle(color: Colors.white)),
                  onPressed: () {
                    Clipboard.setData(ClipboardData(text: key));
                    toast('$keyTitle已复制到剪贴板');
                  },
                ),
                const Expanded(child: Center()),
              ],
            ),
          ),
        );
      },
    );
  }

  _updateWalletName(Wallet wallet, newName) async {
    await ref
        .read(walletProvider.notifier)
        .changeWalletName(wallet.name, newName);
  }

  Future<String?> _showPasswordDialog(context) async {
    return await showPasswordDialog(context);
  }

  Future<String?> _showCustomDialog(
      BuildContext context, String title, String hintText) async {
    return showDialog<String>(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6.0),
            ),
            child: Container(
              width: 400,
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(Icons.close))
                    ],
                  ),
                  Container(
                      margin: const EdgeInsets.only(top: 20),
                      padding: const EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                        color: AppColors.line,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: TextField(
                        obscureText: false,
                        controller: _controller,
                        decoration: InputDecoration(
                            hintText: hintText,
                            focusedBorder: InputBorder.none,
                            border: InputBorder.none),
                      )),
                  Container(
                    margin: const EdgeInsets.only(top: 10, bottom: 10),
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              WidgetStateProperty.all(AppColors.button),
                          padding: WidgetStateProperty.all<EdgeInsets>(
                              const EdgeInsets.only(
                                  left: 50, right: 50, top: 10, bottom: 10))),
                      onPressed: () async {
                        if (!mounted) {
                          return;
                        }
                        Navigator.of(context).pop(_controller.text);
                      },
                      child: const Text(
                        '确定',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Future<void> _showMnemDialog(context, wallet, password) async {
    final mnem = await store.decryptData(wallet.encryptedMnemonic, password);
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.0),
          ),
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              height: 540,
              width: 440,
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "导出助记词",
                        style: TextStyle(
                            color: AppColors.gray33,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                      const Spacer(),
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                  const Divider(),
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: AppColors.gray2b,
                        border: Border.all(color: AppColors.grayd9, width: 0.5),
                        borderRadius: BorderRadius.circular(8)),
                    margin: const EdgeInsets.only(top: 20, left: 16, right: 16),
                    padding: const EdgeInsets.only(
                        left: 8, right: 8, top: 15, bottom: 15),
                    child: Text(
                      mnem,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text('请务必妥善保存助记词，离线保存，建议手工抄写',
                      style: TextStyle(color: Colors.red, fontSize: 12)),
                  Container(
                    margin: const EdgeInsets.only(top: 20, bottom: 20),
                    child: QrImageView(
                      data: mnem,
                      size: 150,
                    ),
                  ),
                  const Text('助记词二维码', style: TextStyle(fontSize: 12)),
                  const SizedBox(height: 20),
                  blueButton('复制', () {
                    Clipboard.setData(ClipboardData(text: mnem));
                    toast("复制成功!");
                  }, width: 120),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
