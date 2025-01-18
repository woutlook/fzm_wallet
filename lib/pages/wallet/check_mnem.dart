import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:fzm_wallet/widget/widgets.dart';

class CheckMnemPage extends ConsumerWidget {
  CheckMnemPage({super.key});
  final TextEditingController _mnemController = TextEditingController();

  @override
  Widget build(context, ref) {
    return buildLayout(context, child: _build(context, ref));
  }

  Widget _build(context, ref) {
    return Scaffold(
      appBar: appBar(context, "验证助记词"),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Column(
          children: [
            multLinesInput(_mnemController, '请输入助记词，用空格分割'),
            const SizedBox(height: 30),
            blueButton('开始校验', () async {
              //
            }),
          ],
        ),
      ),
    );
  }
}
