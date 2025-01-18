import 'dart:convert'; // 用于 JSON 解析
import 'package:flutter/services.dart'; // 用于加载资源文件

class Token0 {
  final String id;
  final String icon;
  final String name;
  final String nickname;
  final String platform;
  final String chain;
  final String contractAddress;
  final String treaty;
  final double chainRmb;
  final double chainUsd;

  Token0({
    required this.id,
    required this.icon,
    required this.name,
    required this.nickname,
    required this.platform,
    required this.chain,
    required this.contractAddress,
    required this.treaty,
    required this.chainRmb,
    required this.chainUsd,
  });

  factory Token0.fromJson(Map<String, dynamic> json) {
    return Token0(
      id: json['id'],
      icon: json['icon'],
      name: json['name'],
      nickname: json['nickname'],
      platform: json['platform'],
      chain: json['chain'] ?? 'ETH',
      contractAddress: json['contract_address'],
      treaty: json['treaty'],
      chainRmb: (json['chain_rmb'] as num).toDouble(),
      chainUsd: (json['chain_usd'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'icon': icon,
      'name': name,
      'nickname': nickname,
      'platform': platform,
      'chain': chain,
      'contract_address': contractAddress,
      'treaty': treaty,
      'chain_rmb': chainRmb,
      'chain_usd': chainUsd,
    };
  }
}

Future<List<Token0>> loadTokens() async {
  try {
    String jsonString =
        await rootBundle.loadString('assets/data/token_list.json');
    final json = jsonDecode(jsonString);
    final list = json['tokens'];
    return list.map<Token0>((e) => Token0.fromJson(e)).toList();
  } catch (e) {
    rethrow;
  }
}
