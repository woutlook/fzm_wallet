import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logger/logger.dart';

enum MsgType { info, debug, warning, error }

void toast(String msg,
    {Toast? duration = Toast.LENGTH_SHORT,
    MsgType type = MsgType.info,
    ToastGravity? gravity = ToastGravity.BOTTOM_RIGHT}) {
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
    timeInSecForIosWeb: 1,
    backgroundColor: color,
    textColor: Colors.white,
    fontSize: 16.0,
  );
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
