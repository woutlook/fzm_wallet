import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'package:fzm_wallet/models/coin.dart';
import 'package:fzm_wallet/models/const/app_colors.dart';
import 'package:fzm_wallet/utils/app_utils.dart';
import 'package:fzm_wallet/widget/widgets.dart';
import 'package:fzm_wallet/provider/p.dart';

class RecvPage extends ConsumerStatefulWidget {
  const RecvPage({super.key});

  @override
  ConsumerState<RecvPage> createState() => _RecvPageState();
}

class _RecvPageState extends ConsumerState<RecvPage> {
  @override
  Widget build(BuildContext context) {
    return buildLayout(context, child: _build(context));
  }

  Widget _build(context) {
    Map<String, dynamic>? arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final coin = arguments?['coin'] as Coin;
    final wallet = ref.watch(walletProvider);
    final address = wallet.getAccountAddress(chain: coin.chain);
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
                      data: address,
                      version: QrVersions.auto,
                      size: 200.0,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      wallet.name,
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.white,
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              address,
                              style: const TextStyle(
                                  fontSize: 16, fontFamily: 'monospace'),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.copy),
                            onPressed: () {
                              Clipboard.setData(ClipboardData(text: address))
                                  .then((_) {
                                toast('地址已经复制');
                              });
                            },
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
      ),
    );
  }
}
