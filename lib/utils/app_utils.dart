import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logger/logger.dart';
import 'package:bot_toast/bot_toast.dart';

enum MsgType { info, debug, warning, error }

void toast1(
  String msg, {
  Toast? duration = Toast.LENGTH_SHORT,
  MsgType type = MsgType.info,
  ToastGravity? gravity = ToastGravity.BOTTOM,
}) {
  Color color;
  switch (type) {
    case MsgType.info:
      color = Colors.green;
      break;
    case MsgType.debug:
      color = Colors.blue;
      break;
    case MsgType.warning:
      color = Colors.orange;
      break;
    case MsgType.error:
      color = Colors.red;
      break;
  }
  Fluttertoast.showToast(
    msg: msg,
    toastLength: duration,
    gravity: gravity,
    timeInSecForIosWeb: 2,
    backgroundColor: color,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

void toast(String msg) {
  BotToast.showText(text: msg);
}

class Log {
  //普通信息
  static i(String msg) {
    Logger().i(msg);
  }

  //debugger日志
  static d(String msg) {
    Logger().d(msg);
  }

  //警告信息
  static w(String msg) {
    Logger().w(msg);
  }

  //错误信息
  static e(String msg) {
    Logger().e(msg);
  }
}

bool checkPassword(String password, String passwordAgain) {
  var check = true;
  if (password.isEmpty) {
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

String formatAddress(String address, {int start = 14, int end = 12}) {
  if (kIsWeb) {
    return address;
  } else {
    return '${address.substring(0, start)}...${address.substring(address.length - end)}';
  }
}
