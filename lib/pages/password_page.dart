import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fzm_wallet/models/store.dart';
import 'package:fzm_wallet/pages/wallet_index_page.dart';
import 'package:fzm_wallet/widget/widgets.dart';
import 'package:fzm_wallet/utils/app_utils.dart';

class SetPasswordPage extends ConsumerStatefulWidget {
  const SetPasswordPage({super.key});

  @override
  ConsumerState<SetPasswordPage> createState() => _SetPasswordPageState();
}

class _SetPasswordPageState extends ConsumerState<SetPasswordPage> {
  final TextEditingController _pw1Controller = TextEditingController(text: '');
  final TextEditingController _pw2Controller = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return buildLayout(context, child: _build(context));
  }

  Widget _build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, '创建密码'),
      body: Container(
        margin: const EdgeInsets.only(left: 16, right: 16, top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            passwordInput(_pw1Controller, _pw2Controller),
            const Spacer(),
            blackButton('创建密码', () async {
              if (!mounted) {
                return;
              }
              await finishTask(context);
            }),
          ],
        ),
      ),
    );
  }

  Future<void> finishTask(context) async {
    String passwd = _pw1Controller.text;
    String passwordAgain = _pw2Controller.text;
    if (checkPassword(passwd, passwordAgain)) {
      await store.setPassword(passwd);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => WalletIndexPage()));
    }
  }
}
