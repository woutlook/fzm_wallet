import 'package:flutter/material.dart';
import 'package:fzm_wallet/models/const/my_routers.dart';
import 'package:fzm_wallet/models/store.dart';
import 'package:fzm_wallet/models/wapi.dart';
import 'package:fzm_wallet/widget/widgets.dart';
import 'package:fzm_wallet/utils/app_utils.dart';

class CreateWalletPage extends StatefulWidget {
  const CreateWalletPage({super.key});

  @override
  State<CreateWalletPage> createState() => _CreateWalletPageState();
}

class _CreateWalletPageState extends State<CreateWalletPage> {
  final TextEditingController _nameController =
      TextEditingController(text: "test1");
  final TextEditingController _pw1Controller =
      TextEditingController(text: "12345678a");
  final TextEditingController _pw2Controller =
      TextEditingController(text: "12345678a");

  @override
  Widget build(BuildContext context) {
    return buildLayout(context, child: _build(context));
  }

  Widget _build(BuildContext context) {
    final passwordHash = store.getPasswordHash();
    return Scaffold(
      appBar: appBar(context, '创建账户'),
      body: Container(
        margin: const EdgeInsets.only(left: 16, right: 16, top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            normalInput(_nameController, '设置账户名称'),
            const SizedBox(height: 20),
            if (passwordHash == null)
              passwordInput(_pw1Controller, _pw2Controller),
            const Spacer(),
            blackButton('创建账户', () async {
              if (!mounted) {
                return;
              }
              if (passwordHash != null) {
                final value = await showPasswordDialog(context);
                if (value != null) {
                  final password = value;
                  finishTask(password);
                }
              }
              finishTask(null);
            }),
          ],
        ),
      ),
    );
  }

  finishTask(String? password) {
    String ntxt = _nameController.text;
    String name = ntxt.trim();
    if (name.isEmpty) {
      toast("请输入账户名称");
      return;
    }
    final wlist = store.getWalletList();
    for (var w in wlist) {
      if (w == name) {
        toast("账户名称已存在");
        return;
      }
    }
    String passwd = password ?? _pw1Controller.text;
    String passwordAgain = password ?? _pw2Controller.text;
    if (checkPassword(name, passwd, passwordAgain)) {
      Log.i("name = $name,pass = $password");
      if (password == null) {
        final passwordHash = hashData(passwd);
        store.setPasswordHash(passwordHash);
      }
      Navigator.pushNamed(context, MyRouter.CREATE_MNEM_PAGE,
          arguments: {"name": name, "password": passwd});
    }
  }

  bool checkPassword(String name, String password, String passwordAgain) {
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
