import 'package:fzm_wallet/models/coin.dart';

class TabCoinData {
  final int code;
  final List<TabCategory> data;
  final String msg;

  TabCoinData({
    required this.code,
    required this.data,
    required this.msg,
  });

  factory TabCoinData.fromJson(Map<String, dynamic> json) {
    return TabCoinData(
      code: json['code'],
      data: (json['data'] as List).map((e) => TabCategory.fromJson(e)).toList(),
      msg: json['msg'],
    );
  }
}

class TabCategory {
  final String name;
  final List<Coin> items;

  TabCategory({
    required this.name,
    required this.items,
  });

  factory TabCategory.fromJson(Map<String, dynamic> json) {
    final items =
        (json['items'] as List).map((e) => Coin.fromNetwork(e)).toList();
    final t = TabCategory(
      name: json['name'],
      items: items.isEmpty ? [] : items,
    );
    return t;
  }
}

class SearchCoinData {
  final int code;
  final List<Coin> data;
  final String msg;

  SearchCoinData({
    required this.code,
    required this.data,
    required this.msg,
  });

  factory SearchCoinData.fromJson(Map<String, dynamic> json) {
    return SearchCoinData(
      code: json['code'],
      data: (json['data'] as List).map((e) => Coin.fromNetwork(e)).toList(),
      msg: json['msg'],
    );
  }
}
