import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fwallet/const/app_colors.dart';
import 'package:fwallet/widget/widgets.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'package:fwallet/bean/coin_bean.dart';
import 'package:fwallet/provider/p.dart';

class RecvPage extends ConsumerStatefulWidget {
  const RecvPage({super.key});

  @override
  ConsumerState<RecvPage> createState() => _RecvPageState();
}

class _RecvPageState extends ConsumerState<RecvPage> {
  String _msg = '';

  @override
  Widget build(context) {
    Map<String, dynamic>? arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final coin = arguments?['coin'] as CoinBean;
    final wallet = ref.watch(walletProvider);
    // final chain = ref.watch(chainProvider(coin.chain!));
    // chain.when(
    //   data: (data) {
    //     setState(() {
    //       _chain = data;
    //     });
    //   },
    //   loading: () {},
    //   error: (e, s) {
    //     _msg = '获取链信息失败';
    //   },
    // );
    return Scaffold(
      appBar: appBar(
        context,
        '${coin.name}收款',
        bgColor: AppColors.gray6,
        titleColor: Colors.white,
        leadingColor: Colors.white,
      ),
      body: Container(
        color: AppColors.gray6,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 100),
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    QrImageView(
                      data: coin.address ?? '',
                      version: QrVersions.auto,
                      size: 200.0,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      wallet.name ?? '',
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.white,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            _msg = '地址已经复制';
                          });
                        },
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                coin.address ?? '',
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.copy),
                              onPressed: () {
                                Clipboard.setData(
                                    ClipboardData(text: coin.pubkey ?? ""));
                                setState(() {
                                  _msg = '地址已经复制';
                                  // ScaffoldMessenger.of(context).showSnackBar(
                                  //   const SnackBar(content: Text('公钥已复制到剪贴板')),
                                  // );
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  _msg,
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
