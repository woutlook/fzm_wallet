import './coin_bean.dart';

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
  final List<CoinBean> items;

  TabCategory({
    required this.name,
    required this.items,
  });

  factory TabCategory.fromJson(Map<String, dynamic> json) {
    return TabCategory(
      name: json['name'],
      items: (json['items'] as List).map((e) => CoinBean.fromJson(e)).toList(),
    );
  }
}

class SearchCoinData {
  final int code;
  final List<CoinBean> data;
  final String msg;

  SearchCoinData({
    required this.code,
    required this.data,
    required this.msg,
  });

  factory SearchCoinData.fromJson(Map<String, dynamic> json) {
    return SearchCoinData(
      code: json['code'],
      data: (json['data'] as List).map((e) => CoinBean.fromJson(e)).toList(),
      msg: json['msg'],
    );
  }
}
