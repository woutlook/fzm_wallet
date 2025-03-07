import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fzm_wallet/models/store.dart';
import 'package:fzm_wallet/utils/app_utils.dart';
import 'package:fzm_wallet/widget/widgets.dart';

class ChangePasswordPage extends ConsumerWidget {
  ChangePasswordPage({super.key});
  final TextEditingController _oldController = TextEditingController();
  final TextEditingController _new1Controller = TextEditingController();
  final TextEditingController _new2Controller = TextEditingController();

  @override
  Widget build(BuildContext context, ref) {
    return buildLayout(context, child: _build(context, ref));
  }

  Widget _build(context, ref) {
    return Scaffold(
      appBar: appBar(context, "修改密码"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            normalInput(_oldController, '请输入旧密码', obscureText: true),
            passwordInput(_new1Controller, _new2Controller,
                hintText1: '请输入新密码', hintText2: '请再次输入新密码'),
            const SizedBox(height: 30),
            blackButton('确定', () async {
              final oldPassword = _oldController.text;
              final newPassword = _new1Controller.text;
              final newPasswordAgain = _new2Controller.text;
              if (oldPassword.isEmpty) {
                toast('请输入旧密码');
                return;
              }
              if (!store.verifyPassword(oldPassword)) {
                toast('旧密码错误');
                return;
              }
              if (!checkPassword(newPassword, newPasswordAgain)) {
                return;
              }
              await store.changePassword(oldPassword, newPassword);
              Navigator.pop(context);
            }),
          ],
        ),
      ),
    );
  }
}
