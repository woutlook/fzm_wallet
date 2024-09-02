// ignore_for_file: constant_identifier_names

import 'dart:async';
import 'dart:convert';

import 'package:fwallet/utils/app_utils.dart';
import 'package:fwallet/widget/widgets.dart';

PwalletBean pwalletBeanFromJson(String str) =>
    PwalletBean.fromJson(json.decode(str));

String pwalletBeanToJson(PwalletBean data) => json.encode(data.toJson());

class PwalletBean {
  PwalletBean({
    this.id,
    this.type,
    this.name,
    this.password,
    this.mnem,
    this.mnemType,
    this.privKey,
    this.chain,
    this.platform,
  });

  PwalletBean.fromJson(dynamic json) {
    id = json['id'];
    type = json['type'];
    name = json['name'];
    password = json['password'];
    mnem = json['mnem'];
    mnemType = json['mnemType'];
    privKey = json['privKey'];
    chain = json['chain'];
    platform = json['platform'];
  }

  static const int TYPE_MNEM = 0; // 助记词账户
  static const int TYPE_PRIVATE = 1; // 私钥账户
  static const int TYPE_KEYADD = 2; // 观察账户
  static const int TYPE_RECOVER = 3; // 恢复账户

  String typeString() {
    String accountType = "";
    switch (type) {
      case TYPE_MNEM:
        accountType = "助记词账户";
        break;
      case TYPE_PRIVATE:
        accountType = "私钥账户";
        break;
      case TYPE_KEYADD:
        accountType = "观察账户";
        break;
      case TYPE_RECOVER:
        accountType = "恢复账户";
        break;
    }
    return accountType;
  }

  int? id;
  int? type;
  String? name;
  String? password;
  String? mnem;
  int? mnemType;

  // for private key account
  String? privKey;
  String? chain;
  String? platform;

  // for unlock
  static const int unlockDurationMs = 300 * 1000; // 5 minutes in milliseconds
  String? _realPassword;
  int? unlockTimestamp;

  // nopassword pay
  bool nopasswordPay = false;

  bool requiredUnlock() {
    if (unlockTimestamp == null) {
      return true;
    }
    final now = DateTime.now().millisecondsSinceEpoch;
    return now - unlockTimestamp! > unlockDurationMs;
  }

  String? get realPassword {
    return !requiredUnlock() ? _realPassword : null;
  }

  set realPassword(String? value) {
    _realPassword = value;
  }

  Future<bool> unlock(context) async {
    if (!requiredUnlock()) {
      return true;
    }
    final rpassword = await showPasswordDialog(context, password);
    if (rpassword == null || rpassword.isEmpty) {
      _realPassword = null;
      toast("密码错误");
      return false;
    }
    _realPassword = rpassword;
    unlockTimestamp = DateTime.now().millisecondsSinceEpoch;
    return true;
  }

  PwalletBean copyWith({
    int? id,
    int? type,
    String? name,
    String? password,
    String? mnem,
    int? mnemType,
    String? privKey,
    String? chain,
    String? platform,
  }) =>
      PwalletBean(
        id: id ?? this.id,
        type: type ?? this.type,
        name: name ?? this.name,
        password: password ?? this.password,
        mnem: mnem ?? this.mnem,
        mnemType: mnemType ?? this.mnemType,
        privKey: privKey ?? this.privKey,
        chain: chain ?? this.chain,
        platform: platform ?? this.platform,
      );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'name': name,
      'password': password,
      'mnem': mnem,
      'mnemType': mnemType,
      'privKey': privKey ?? '',
      'chain': chain ?? '',
      'platform': platform ?? '',
    };
  }
}
