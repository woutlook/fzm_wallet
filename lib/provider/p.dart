// ignore_for_file: constant_identifier_names

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fzm_wallet/models/coin.dart';
import 'package:fzm_wallet/models/contact.dart';
import 'package:fzm_wallet/models/store.dart';
import 'package:fzm_wallet/models/tx.dart';
import 'package:fzm_wallet/models/chain33_http.dart';
import 'package:fzm_wallet/models/wallet.dart';
import 'package:fzm_wallet/models/wapi.dart';

// class CoinsNotifier extends StateNotifier<List<Coin>> {
//   CoinsNotifier() : super([]);

//   void updateCoins(List<Coin> newCoins) {
//     state = newCoins;
//   }

//   void updateWalletCoins(wallet) async {
//     final list = store
//     store.getCoin(id)
//     state = coins;
//   }
// }

// final coinsProvider = StateNotifierProvider<CoinsNotifier, List<Coin>>((ref) {
//   return CoinsNotifier();
// });

class WalletNotifier extends StateNotifier<Wallet> {
  WalletNotifier(super.state);

  void updateWallet(Wallet newWallet) {
    state = newWallet;
    store.setCurrentWallet(newWallet.name);
  }
}

final walletProvider = StateNotifierProvider<WalletNotifier, Wallet>((ref) {
  var wallet = store.getCurrentWallet();
  wallet ??=
      AddressWallet.fromAddress(address: '0x0', name: 'test', chain: 'ETH');
  return WalletNotifier(wallet);
});

final noPassworkPayProvider = StateProvider<bool>((ref) {
  return false;
});

final hideLess1Provider = StateProvider<Map<String, bool>>((ref) {
  return <String, bool>{};
});

final balanceProvider =
    FutureProvider.autoDispose.family<double, Coin>((ref, coin) async {
  final wallet = ref.watch(walletProvider);
  final chain = coin.chain;
  final who = wallet.getAccountAddress(chain: chain);
  if (coin.contract == null || coin.contract!.isEmpty) {
    return 0.0;
  }
  try {
    final balance = await walletApi.getBalance(
        who: who,
        chain: chain,
        contractAddr: coin.contract!,
        coinSymbol: coin.symbol!);
    return balance;
  } catch (e) {
    return 0.0;
  }
});

final feeProvider =
    FutureProvider.autoDispose.family<Fee, String>((ref, chain) async {
  final fee = await walletApi.getFee(chain: chain);
  return fee;
});

final txListProvider =
    FutureProvider.autoDispose.family<List<Tx>, Coin>((ref, coin) async {
  final wallet = ref.watch(walletProvider);
  final addr = wallet.getAccountAddress(chain: coin.chain);
  final txlist = await walletApi.getTxList(
      chain: coin.chain, addr: addr, coinSymbol: coin.symbol);
  return txlist;
});

class DNSArgs {
  final String type;
  final String key;
  final String kind;

  DNSArgs(this.type, this.key, this.kind);

  Map<String, dynamic> toJson() {
    return {
      "type": type,
      "key": key,
      "kind": kind,
    };
  }
}

final dnsProvider =
    FutureProvider.autoDispose.family<List<String>, DNSArgs>((ref, args) async {
  try {
    final resp = await Http.of().get(DNS, queryParameters: args.toJson());
    final dns = DNSResponse.fromJson(resp.data);
    return dns.data ?? [];
  } catch (e) {
    return [];
  }
});

class AppVersion {
  final int status;
  final String version;
  final int versionCode;
  final String downloadUrl;
  final String log;

  AppVersion(
      {this.status = 0,
      this.version = '',
      this.versionCode = 0,
      this.downloadUrl = '',
      this.log = ''});

  factory AppVersion.fromJson(Map<String, dynamic> json) {
    return AppVersion(
      status: json["status"],
      version: json["version"],
      versionCode: json["version_code"],
      downloadUrl: json["download_url"],
      log: json["log"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "status": status,
      "version": version,
      "version_code": versionCode,
      "download_url": downloadUrl,
      "log": log,
    };
  }
}

final updateProvider = FutureProvider.autoDispose<AppVersion>((ref) async {
  try {
    final resp = await Http.of().get(UPDATE);
    return AppVersion.fromJson(resp.data);
  } catch (e) {
    return AppVersion();
  }
});

class Notice {
  final int id;
  final String title;
  final String content;
  final String author;
  final int type;
  final int isTop;
  final String createTime;
  final String updateTime;

  Notice(
      {this.id = 0,
      this.title = '',
      this.content = '',
      this.author = '',
      this.type = 0,
      this.isTop = 0,
      this.createTime = '',
      this.updateTime = ''});

  factory Notice.fromJson(Map<String, dynamic> json) {
    return Notice(
      id: json["id"],
      title: json["title"],
      content: json["content"],
      type: json["type"],
      isTop: json["is_top"],
      createTime: json["create_time"],
      updateTime: json["update_time"],
    );
  }
}

final noticeDetailProvider =
    FutureProvider.autoDispose.family<Notice, int>((ref, id) async {
  try {
    final resp = await Http.of().get(NOTICE_DETAIL, queryParameters: {
      "id": id,
    });
    return Notice.fromJson(resp.data);
  } catch (e) {
    return Notice();
  }
});

class NoticeListArgs {
  final int page;
  final int limit;
  final int type;

  NoticeListArgs(this.page, this.limit, this.type);

  Map<String, dynamic> toJson() {
    return {
      "page": page,
      "limit": limit,
      "type": type,
    };
  }
}

final noticeListProvider = FutureProvider.autoDispose
    .family<List<Notice>, NoticeListArgs>((ref, args) async {
  try {
    final resp =
        await Http.of().get(NOTICE_LIST, queryParameters: args.toJson());
    final notices = resp.data["list"];
    return (notices as List).map((e) => Notice.fromJson(e)).toList();
  } catch (e) {
    return [];
  }
});

// SharedPreferences? sharedPreferences;

// final storeProvider = StateProvider<SharedPreferences>((ref) {
//   return sharedPreferences!;
// });

// Future<void> initializeSharedPreferences() async {
//   sharedPreferences = await SharedPreferences.getInstance();
// }

// class SP {
//   static const String LANG_CODE = "lang_code";
//   static const String WALLET_ID = "wallet_id";
//   static const String NO_PASSWORD_PAY = "no_password_pay";
//   static const String PASSWORD_HASH = "password_hash";
//   static const String HIDE_LESS_1 = "hide_less_1";
//   static String getHideLess1Key(int coinId) {
//     return "${HIDE_LESS_1}_$coinId";
//   }

//   static String getLangCode() {
//     return sharedPreferences?.getString(LANG_CODE) ?? "zh";
//   }

//   static void setLangCode(String langCode) {
//     sharedPreferences?.setString(LANG_CODE, langCode);
//   }

//   static int getWalletId() {
//     return sharedPreferences?.getInt(WALLET_ID) ?? 1;
//   }

//   static void setWalletId(int walletId) {
//     sharedPreferences?.setInt(WALLET_ID, walletId);
//   }

//   static bool getNoPasswordPay() {
//     return sharedPreferences?.getBool(NO_PASSWORD_PAY) ?? false;
//   }

//   static void setNoPasswordPay(bool noPasswordPay) {
//     sharedPreferences?.setBool(NO_PASSWORD_PAY, noPasswordPay);
//   }

//   static String getPasswordHash() {
//     return sharedPreferences?.getString(PASSWORD_HASH) ?? "";
//   }

//   static void setPasswordHash(String passwordHash) {
//     sharedPreferences?.setString(PASSWORD_HASH, passwordHash);
//   }

//   static bool getHideLess1(int coinId) {
//     return sharedPreferences?.getBool(getHideLess1Key(coinId)) ?? false;
//   }

//   static void setHideLess1(int coinId, bool hide) {
//     sharedPreferences?.setBool(getHideLess1Key(coinId), hide);
//   }
// }

// Future<Coin?> getCoin(int wid, String name, String chain) async {
//   final db = getDB();
//   final list = await db.query('Coin',
//       where: 'pwalletId = ? and name = ? and chain = ?',
//       whereArgs: [wid, name, chain]);
//   if (list.isEmpty) {
//     return null;
//   }
//   return Coin.fromJson(list.first);
// }

// // int getAddressId(Coin coin) {
// //   if ("YCC" == coin.chain || "BTY" == coin.chain) {
// //     if ("ethereum" == coin.platform || "yhchain" == coin.platform) {
// //       return 2;
// //     } else if ("btc" == coin.platform) {
// //       return 0;
// //     } else if ("bty" == coin.platform) {
// //       return 0;
// //     } else if ("btymain" == coin.platform) {
// //       return 2;
// //     }
// //   }
// //   return 0;
// // }

// // String getRealChain(Coin coin) {
// //   if ("YCC" == coin.chain || "BTY" == coin.chain) {
// //     if ("ethereum" == coin.platform || "yhchain" == coin.platform) {
// //       return "ETH";
// //     } else if ("btc" == coin.platform) {
// //       return "BTC";
// //     } else if ("bty" == coin.platform) {
// //       return "BTY";
// //     } else if ("btymain" == coin.platform) {
// //       return "BNB";
// //     }
// //   }
// //   return coin.chain ?? 'ETH';
// // }

class SearchArgs {
  final int page;
  final int limit;
  final String keyword;
  final String chain;
  final String platform;
  static const int DEFAULT_PAGE = 1;
  static const int DEFAULT_LIMIT = 100;

  SearchArgs(
      {required this.page,
      required this.limit,
      required this.keyword,
      required this.chain,
      required this.platform});

  Map<String, dynamic> toJson() {
    return {
      'page': page,
      'limit': limit,
      'keyword': keyword,
      'chain': chain,
      'platform': platform,
    };
  }
}

Future<List<Coin>> searchCoins(String keyword) async {
  final searchArgs = SearchArgs(
      page: SearchArgs.DEFAULT_PAGE,
      limit: SearchArgs.DEFAULT_LIMIT,
      keyword: keyword,
      chain: "",
      platform: "");
  final resp = await Http.of().post(SEARCH_COIN, data: searchArgs.toJson());
  final list = (resp.data as List)
      .map((e) => Coin.fromJson(e as Map<String, dynamic>))
      .toList();
  return list;
}

Future<List<Coin>> getBTYs() async {
  return await searchCoins("BTY");
}

Future<List<Coin>> getYCCs() async {
  return await searchCoins("YCC");
}

class TxArgs {
  final Coin coin;
  final String to;
  final double amount;
  final double fee;
  final String password;
  final String? note;

  TxArgs({
    required this.coin,
    required this.to,
    required this.amount,
    required this.fee,
    required this.password,
    this.note,
  });
}

final sendTxProvider = FutureProvider.autoDispose
    .family<AsyncValue<Tx>, TxArgs>((ref, args) async {
  final password = args.password;
  final coin = args.coin;
  final wallet = ref.watch(walletProvider);

  final priv =
      wallet.getAccountPrivateKey(chain: coin.chain, password: password);

  final to = args.to;
  final amount = args.amount;
  final fee = args.fee;

  final targs = TokenTxArgs(
    token: coin,
    to: to,
    amount: amount,
    fee: fee,
    note: args.note,
  );

  final tx = await walletApi.sendToken(privateKey: priv, args: targs);
  if (tx == null) {
    return AsyncValue.error('send tx failed', StackTrace.current);
  }
  return AsyncValue.data(tx);
});

// Future<void> saveWallet(wallet, password) async {
//   final db = getDB();
//   DatabaseHelper().test();
//   int id = await db.insert(
//     'Wallet',
//     wallet.toJson(),
//     //插入冲突策略（如果同样的对象被插入两次，则后者替换前者）
//     conflictAlgorithm: ConflictAlgorithm.replace,
//   );
//   Log.i("添加钱包成功，walletid = : $id");
//   wallet.id = id;

//   await saveCoins(wallet, password);
// }

// Future<void> saveCoins(wallet, password) async {
//   final names =
//       BaseData.DEFAULT_COINS.map((e) => "${e.name},${e.platform}").toList();
//   final resp = await Http.of().post(COIN_LIST, data: {"names": names});
//   if (!resp.ok) {
//     return;
//   }
//   final coins = resp.data.map((e) => CoinBean.fromJson(e)).toList();

//   final preCoins = BaseData.DEFAULT_COINS.map((e) => e.clone()).toList();
//   final db = getDB();

//   for (var coin in preCoins) {
//     coin.added = true;
//     coin.pwalletId = wallet.id;
//     coin.setPrivPubAddr(password, wallet);

//     if (coin.contract == null || coin.contract!.isEmpty) {
//       final c =
//           coins.firstWhere((e) => e.id == coin.id, orElse: () => CoinBean());
//       coin.icon = coin.icon ?? c.icon;
//       coin.contract = coin.contract ?? c.contract;
//     }

//     int id = await db.insert(
//       'Coin',
//       coin.toJson(),
//       conflictAlgorithm: ConflictAlgorithm.replace,
//     );
//     Log.i("添加成功，coinid = : $id");
//   }
// }

// Future<void> deleteWallet(wallet, wallets) async {
//   if (wallets.length == 1) {
//     toast('至少保留一个钱包');
//     return;
//   }
//   final db = getDB();
//   var re = await db.delete('Wallet', where: 'id = ?', whereArgs: [wallet.id]);
//   Log.i("re ===  $re");

//   await db.delete('Coin', where: 'pwalletId = ?', whereArgs: [wallet.id]);
// }

// bool isChinese(String input) {
//   // 使用正则表达式判断字符串中是否包含中文字符
//   return RegExp(r'[\u4e00-\u9fa5]').hasMatch(input);
// }

// bool isEnglish(String input) {
//   // 使用正则表达式判断字符串中是否包含英文字符
//   return RegExp(r'[a-zA-Z]').hasMatch(input);
// }

String formatString(String input) {
  // 去除首尾空格
  String trimmed = input.trim();

  // 使用正则表达式将多个空格替换为一个空格
  String formatted = trimmed.replaceAll(RegExp(r'\s+'), ' ');

  return formatted;
}

// // String formatChineseString(String input) {
// //   // 去除首尾空格
// //   String trimmed = input.trim();

// //   // 去除汉字之间的多余空格
// //   String noExtraSpaces = trimmed.replaceAll(
// //       RegExp(r'([\u4e00-\u9fa5])\s+([\u4e00-\u9fa5])'), r'$1$2');

// //   // 使用正则表达式在每个汉字之间添加一个空格
// //   String formatted = noExtraSpaces.replaceAllMapped(
// //     RegExp(r'([\u4e00-\u9fa5])([\u4e00-\u9fa5])'),
// //     (Match match) => '${match.group(1)} ${match.group(2)}',
// //   );

// //   return formatted;
// // }

// Future<List<Contact>> getContects(int walletId) async {
//   final db = getDB();
//   final list =
//       await db.query('Contacts', where: 'walletId = ?', whereArgs: [walletId]);
//   final dbList = list.map((e) => DBContects.fromJson(e)).toList();
//   final map = <String, Contact>{};
//   for (var e in dbList) {
//     final key = e.name + e.phoneNum;
//     final addr = ContactsAddress(coinId: e.coinId, address: e.address);
//     final id = e.id ?? 0;
//     if (map.containsKey(key)) {
//       map[key]?.addAddress(addr);
//       map[key]?.idList?.add(id);
//     } else {
//       map[key] = Contact(
//           name: e.name,
//           phoneNum: e.phoneNum,
//           addressList: [addr],
//           idList: [id]);
//     }
//   }
//   return map.entries.map((e) => e.value).toList()
//     ..sort((a, b) {
//       return a.name.compareTo(b.name);
//     });
// }

final contectsProvider = StateProvider<List<Contact>>((ref) {
  return [];
});

// Future<void> deleteContects({required Contact contects}) async {
//   final db = getDB();
//   for (var id in contects.idList ?? []) {
//     await db.delete('Contacts', where: 'id = ?', whereArgs: [id]);
//   }
// }

// Future<void> updateContects(
//     {required Contact contects, required int walletId}) async {
//   final db = getDB();
//   // delete old contects
//   for (var id in contects.idList ?? []) {
//     await db.delete('Contacts', where: 'id = ?', whereArgs: [id]);
//   }
//   // insert new contects
//   for (var addr in contects.addressList!) {
//     final dbContects = DBContects(
//         walletId: walletId,
//         name: contects.name,
//         phoneNum: contects.phoneNum,
//         coinId: addr.coinId!,
//         address: addr.address!);
//     await db.insert(
//       'Contacts',
//       dbContects.toJson(),
//       conflictAlgorithm: ConflictAlgorithm.replace,
//     );
//   }
// }

// // Future<void> addContects(
// //     {required Contact contects, required int walletId}) async {
// //   final db = getDB();
// //   for (var addr in contects.addressList!) {
// //     final dbContects = DBContects(
// //         walletId: walletId,
// //         name: contects.name,
// //         phoneNum: contects.phoneNum,
// //         coinId: addr.coinId!,
// //         address: addr.address!);
// //     await db.insert(
// //       'Contacts',
// //       dbContects.toJson(),
// //       conflictAlgorithm: ConflictAlgorithm.replace,
// //     );
// //   }
// // }

// String? getScanResult(barcodeCapture) {
//   final String? rawValue = barcodeCapture.barcodes.first.rawValue;
//   return rawValue;
// }
