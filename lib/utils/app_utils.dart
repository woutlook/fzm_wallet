import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logger/logger.dart';

void toast(String msg,
    {Toast? duration = Toast.LENGTH_SHORT,
    ToastGravity? gravity = ToastGravity.CENTER}) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: duration,
      gravity: gravity,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0);
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

