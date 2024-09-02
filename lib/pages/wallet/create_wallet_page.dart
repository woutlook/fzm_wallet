import 'package:flutter/material.dart';
import 'package:fwallet/const/my_routers.dart';
import 'package:fwallet/widget/widgets.dart';
import '../../utils/app_utils.dart';

TextEditingController _nameController = TextEditingController(text: "test1");
TextEditingController _pw1Controller = TextEditingController(text: "12345678a");
TextEditingController _pw2Controller = TextEditingController(text: "12345678a");

class CreateWalletPage extends StatelessWidget {
  const CreateWalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, '创建账户'),
      body: Container(
        margin: const EdgeInsets.only(left: 16, right: 16, top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            normalInput(_nameController, '设置账户名称'),
            const SizedBox(height: 20),
            passwordInput(_pw1Controller, _pw2Controller),
            const Spacer(),
            blackButton('创建账户', () {
              finishTask(context);
            }),
          ],
        ),
      ),
    );
  }

  finishTask(BuildContext context) {
    String name = _nameController.text;
    String password = _pw1Controller.text;
    String passwordAgain = _pw2Controller.text;
    if (checked(name, password, passwordAgain)) {
      Log.i("name = $name,pass = $password");
      Navigator.pushNamed(context, MyRouter.CREATE_MNEM_PAGE,
          arguments: {"name": name, "password": password});
    }
  }

  bool checked(String name, String password, String passwordAgain) {
    var check = true;
    if (name.isEmpty) {
      toast("请输入账户名称");
      check = false;
    } else if (password.isEmpty) {
      toast("请输入密码");
      check = false;
    } else if (passwordAgain.isEmpty) {
      toast("请再次输入密码");
      check = false;
    } else if (password.length < 8 || password.length > 16) {
      toast("请输入8-16位字符");
      check = false;
    } else if (password != passwordAgain) {
      toast("两次密码不相同");
      check = false;
    } else if (!isFormatValid(password)) {
      toast("请输入8-16位字母数字组合");
      check = false;
    }

    return check;
  }

  bool isFormatValid(String str) {
    RegExp regExp = RegExp(r"^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{8,16}$");
    return regExp.hasMatch(str);
  }
}
