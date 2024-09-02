// ignore_for_file: constant_identifier_names

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fwallet/api/api.dart';
import 'package:fwallet/api/tx.dart';
import 'package:fwallet/api/fzm_http.dart';
import 'package:fwallet/bean/contects.dart';
import 'package:fwallet/bean/pwallet_bean.dart';
import 'package:fwallet/const/base_data.dart';
import 'package:fwallet/bean/coin_bean.dart';
import 'package:fwallet/utils/app_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fwallet/db/db.dart';
import 'package:sqflite/sqflite.dart';

Database? db;
Future<void> initDB() async {
  db = await DatabaseHelper().database;
}

final dbProvider = Provider<Database>((ref) {
  return db!;
});

Database getDB() {
  return db!;
}

class CoinsNotifier extends StateNotifier<List<CoinBean>> {
  CoinsNotifier() : super([]);

  void updateCoins(List<CoinBean> newCoins) {
    state = newCoins;
  }
}

class WalletNotifier extends StateNotifier<PwalletBean> {
  WalletNotifier() : super(PwalletBean());

  void updateWallet(PwalletBean newWallet) {
    state.realPassword = null;
    state = newWallet;
    SP.setWalletId(newWallet.id ?? 0);
  }
}

final walletProvider =
    StateNotifierProvider<WalletNotifier, PwalletBean>((ref) {
  return WalletNotifier();
});

final x = FutureProvider<void>((ref) async {
  final db = ref.watch(dbProvider);
  final wallet = ref.watch(walletProvider);
  final list =
      await db.query('Coin', where: 'pwalletId = ?', whereArgs: [wallet.id]);
  final coins = list.map((e) => CoinBean.fromJson(e)).toList();
  ref.read(coinsProvider.notifier).updateCoins(coins);
});

final coinsProvider =
    StateNotifierProvider<CoinsNotifier, List<CoinBean>>((ref) {
  return CoinsNotifier();
});

// final walletIdProvider = StateProvider<int>((ref) {
//   return 0;
// });

final noPassworkPayProvider = StateProvider<bool>((ref) {
  return false;
});

// final passwordHashProvider = StateProvider<String>((ref) {
//   return "";
// });

final hideLess1Provider = StateProvider<Map<String, bool>>((ref) {
  return <String, bool>{};
});

final balanceProvider =
    FutureProvider.autoDispose.family<double, CoinBean>((ref, coin) async {
  final balance = await WalletApi.wapi(chain: coin.chain!).getBalance(
      coin.address!,
      contractAddr: coin.contract,
      tokenSymbol: coin.name);
  return balance ?? 0.0;
});

final feeProvider =
    FutureProvider.autoDispose.family<TxFee, String>((ref, chain) async {
  final fee = await WalletApi.wapi(chain: chain).getTxFee();
  return fee;
});

final txListProvider =
    FutureProvider.autoDispose.family<List<Tx>, CoinBean>((ref, coin) async {
  final wapi = WalletApi.wapi(chain: coin.chain!);
  final txlist = await wapi.getTxList(coin.address!,
      contractAddr: coin.contract, tokenSymbol: coin.name ?? coin.chain);
  return txlist;
});

/*

final txCountProvider =
    FutureProvider.autoDispose.family<int, String>((ref, address) async {
  try {
    var resp = await Http.of(baseUrl: FzmWApi.GO_URL).post("", data: {
      "id": 1,
      "method": "eth_getTransactionCount",
      "params": [address, "latest"]
    });
    final count = resp.data["count"];
    return int.parse(count);
  } catch (e) {
    return 0;
  }
});

final gasProvier = FutureProvider.autoDispose<String>((ref) async {
  try {
    var resp = await Http.of(baseUrl: FzmWApi.GO_URL)
        .post("", data: {"id": 1, "method": "eth_gasPrice", "params": []});

    final gasPrice = resp.data["gasPrice"];
    return gasPrice;
  } catch (e) {
    return "0";
  }
});

final balanceProvider =
    FutureProvider.autoDispose.family<String, CoinBean>((ref, coin) async {
  try {
    var resp = await Http.of(baseUrl: FzmWApi.GO_URL).post("", data: {
      "id": 1,
      "method": "Wallet.GetBalance",
      "params": [
        {
          "cointype": coin.chain,
          "address": coin.address ?? '',
          "tokensymbol": coin.name ?? coin.chain,
        }
      ]
    });

    final balance = resp.data["balance"];
    coin.balance = balance;
    return balance;
  } catch (e) {
    return "0";
  }
});

class TxHistoryArgs {
  final String from;
  final String to;
  final String coinType;
  final String tokenSymbol;

  TxHistoryArgs(this.from, this.to, this.coinType, this.tokenSymbol);

  Map<String, dynamic> toJson() {
    return {
      "from": from,
      "to": to,
      "coinType": coinType,
      "tokenSymbol": tokenSymbol,
    };
  }
}

final txHistoryProvider =
    FutureProvider.autoDispose.family<int, TxHistoryArgs>((ref, args) async {
  try {
    var resp = await Http.of(baseUrl: FzmWApi.GO_URL).post("", data: {
      "id": 1,
      "method": "Wallet.Transport",
      "params": [
        {
          "cointype": args.coinType,
          "tokensymbol": args.tokenSymbol,
          "rawdata": {"payload": args.toJson(), "method": "QueryTxHistoryCount"}
        }
      ]
    });

    final count = resp.data["count"];
    return int.parse(count);
  } catch (e) {
    return 0;
  }
});

class TxDetailArgs {
  final String from;
  final String to;
  final String coinType;
  final String tokenSymbol;
  final int direction;
  final int count;
  final int index;

  TxDetailArgs(this.from, this.to, this.coinType, this.tokenSymbol,
      this.direction, this.count, this.index);

  Map<String, dynamic> toJson() {
    return {
      "from": from,
      "to": to,
      "coinType": coinType,
      "tokenSymbol": tokenSymbol,
      "direction": direction,
      "count": count,
      "index": index,
    };
  }
}

class Tx {
  final int blocktime;
  final String fee;
  final String? from;
  final int height;
  final String? to;
  final String? txid;
  final String? type;
  final String? value;
  final String? otherAddress;
  final String? nickName;
  final String? chain;
  final int status;
  final int walletId;
  final String? netId;
  final String? coinname;
  final String? note;

  static const String IN_STR = "+";
  static const String OUT_STR = "-";
  static const String TYPE_RECEIVE = "receive";
  static const String TYPE_SEND = "send";

  Tx(
      {this.blocktime = 0,
      this.fee = '0',
      this.from,
      this.height = 0,
      this.to,
      this.txid,
      this.type,
      this.value,
      this.otherAddress,
      this.nickName,
      this.chain,
      this.status = 0,
      this.walletId = 0,
      this.netId,
      this.coinname,
      this.note});

  factory Tx.fromJson(Map<String, dynamic> json) {
    return Tx(
      blocktime: json["blocktime"],
      fee: json["fee"],
      from: json["from"],
      height: json["height"],
      to: json["to"],
      txid: json["txid"],
      type: json["type"],
      value: json["value"],
      otherAddress: json["otherAddress"],
      nickName: json["nickName"],
      chain: json["chain"],
      status: json["status"],
      walletId: json["walletId"],
      netId: json["id"],
      coinname: json["coinname"],
      note: json["note"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "blocktime": blocktime,
      "fee": fee,
      "from": from,
      "height": height,
      "to": to,
      "txid": txid,
      "type": type,
      "value": value,
      "otherAddress": otherAddress,
      "nickName": nickName,
      "chain": chain,
      "status": status,
      "walletId": walletId,
      "id": netId,
      "coinname": coinname,
      "note": note,
    };
  }
}

class TxTotal {
  final String totalAmount;
  final List<Tx> txs;

  TxTotal({this.totalAmount = '0', this.txs = const []});

  factory TxTotal.fromJson(Map<String, dynamic> json) {
    return TxTotal(
      totalAmount: json["totalamount"],
      txs: (json["txs"] as List).map((e) => Tx.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "totalamount": totalAmount,
      "txs": txs.map((e) => e.toJson()).toList(),
    };
  }
}

final txDetailProvider =
    FutureProvider.autoDispose.family<TxTotal, TxDetailArgs>((ref, args) async {
  try {
    var resp = await Http.of(baseUrl: FzmWApi.GO_URL).post("", data: {
      "id": 1,
      "method": "Wallet.Transport",
      "params": [
        {
          "cointype": args.coinType,
          "tokensymbol": args.tokenSymbol,
          "rawdata": {
            "payload": args.toJson(),
            "method": "QueryTxHistoryDetail"
          }
        }
      ]
    });

    return TxTotal.fromJson(resp.data);
  } catch (e) {
    rethrow;
  }
});
*/

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
    final resp =
        await Http.of().get(DNS, queryParameters: args.toJson());
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
    final resp = await Http.of()
        .get(NOTICE_LIST, queryParameters: args.toJson());
    final notices = resp.data["list"];
    return (notices as List).map((e) => Notice.fromJson(e)).toList();
  } catch (e) {
    return [];
  }
});

SharedPreferences? sharedPreferences;

final storeProvider = StateProvider<SharedPreferences>((ref) {
  return sharedPreferences!;
});

Future<void> initializeSharedPreferences() async {
  sharedPreferences = await SharedPreferences.getInstance();
}

class SP {
  static const String LANG_CODE = "lang_code";
  static const String WALLET_ID = "wallet_id";
  static const String NO_PASSWORD_PAY = "no_password_pay";
  static const String PASSWORD_HASH = "password_hash";
  static const String HIDE_LESS_1 = "hide_less_1";
  static String getHideLess1Key(int coinId) {
    return "${HIDE_LESS_1}_$coinId";
  }

  static String getLangCode() {
    return sharedPreferences?.getString(LANG_CODE) ?? "zh";
  }

  static void setLangCode(String langCode) {
    sharedPreferences?.setString(LANG_CODE, langCode);
  }

  static int getWalletId() {
    return sharedPreferences?.getInt(WALLET_ID) ?? 1;
  }

  static void setWalletId(int walletId) {
    sharedPreferences?.setInt(WALLET_ID, walletId);
  }

  static bool getNoPasswordPay() {
    return sharedPreferences?.getBool(NO_PASSWORD_PAY) ?? false;
  }

  static void setNoPasswordPay(bool noPasswordPay) {
    sharedPreferences?.setBool(NO_PASSWORD_PAY, noPasswordPay);
  }

  static String getPasswordHash() {
    return sharedPreferences?.getString(PASSWORD_HASH) ?? "";
  }

  static void setPasswordHash(String passwordHash) {
    sharedPreferences?.setString(PASSWORD_HASH, passwordHash);
  }

  static bool getHideLess1(int coinId) {
    return sharedPreferences?.getBool(getHideLess1Key(coinId)) ?? false;
  }

  static void setHideLess1(int coinId, bool hide) {
    sharedPreferences?.setBool(getHideLess1Key(coinId), hide);
  }
}

Future<CoinBean> getCoin(int wid, String name, String chain) async {
  final db = getDB();
  final list = await db.query('Coin',
      where: 'pwalletId = ? and name = ? and chain = ?',
      whereArgs: [wid, name, chain]);
  if (list.isEmpty) {
    return CoinBean();
  }
  return CoinBean.fromJson(list.first);
}

int getAddressId(CoinBean coin) {
  if ("YCC" == coin.chain || "BTY" == coin.chain) {
    if ("ethereum" == coin.platform || "yhchain" == coin.platform) {
      return 2;
    } else if ("btc" == coin.platform) {
      return 0;
    } else if ("bty" == coin.platform) {
      return 0;
    } else if ("btymain" == coin.platform) {
      return 2;
    }
  }
  return 0;
}

String getRealChain(CoinBean coin) {
  if ("YCC" == coin.chain || "BTY" == coin.chain) {
    if ("ethereum" == coin.platform || "yhchain" == coin.platform) {
      return "ETH";
    } else if ("btc" == coin.platform) {
      return "BTC";
    } else if ("bty" == coin.platform) {
      return "BTY";
    } else if ("btymain" == coin.platform) {
      return "BNB";
    }
  }
  return coin.chain ?? 'ETH';
}

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

Future<List<CoinBean>> searchCoins(String keyword) async {
  final searchArgs = SearchArgs(
      page: SearchArgs.DEFAULT_PAGE,
      limit: SearchArgs.DEFAULT_LIMIT,
      keyword: keyword,
      chain: "",
      platform: "");
  final resp =
      await Http.of().post(SEARCH_COIN, data: searchArgs.toJson());
  final list = (resp.data as List)
      .map((e) => CoinBean.fromJson(e as Map<String, dynamic>))
      .toList();
  return list;
}

Future<List<CoinBean>> getBTYs() async {
  return await searchCoins("BTY");
}

Future<List<CoinBean>> getYCCs() async {
  return await searchCoins("YCC");
}

class TxArgs {
  final PwalletBean pwallet;
  final CoinBean coin;
  final String to;
  final double amount;
  final double fee;
  final String password;
  final String? note;

  TxArgs(this.pwallet, this.coin, this.to, this.amount, this.fee, this.password,
      {this.note});
}

final sendTxProvider = FutureProvider.autoDispose
    .family<AsyncValue<String>, TxArgs>((ref, args) async {
  final wallet = args.pwallet;
  final password = args.password;
  final coin = args.coin;

  if (wallet.type == PwalletBean.TYPE_KEYADD ||
      wallet.type == PwalletBean.TYPE_RECOVER) {
    return AsyncValue.error(
        'not support keyadd or recover', StackTrace.current);
  }

  final priv = coin.getPriv(password, wallet);
  if (priv == null || priv.isEmpty) {
    return AsyncValue.error('get privkey failed', StackTrace.current);
  }

  final from = coin.address!;
  final to = args.to;
  final amount = args.amount;
  final fee = args.fee;

  final token = Token(
    name: coin.name!,
    symbol: coin.name!,
    decimals: 0,
    chain: coin.chain!,
  );

  final targs = TokenTxArgs(
      token: token,
      to: to,
      amount: amount,
      fee: fee,
      froms: [from],
      note: args.note);

  final txHash =
      await WalletApi.wapi(chain: coin.chain!).sendToken(priv, targs);
  if (txHash == null || txHash.isEmpty) {
    return AsyncValue.error('send tx failed', StackTrace.current);
  }
  return AsyncValue.data(txHash);
});

Future<void> saveWallet(wallet, password) async {
  final db = getDB();
  DatabaseHelper().test();
  int id = await db.insert(
    'Wallet',
    wallet.toJson(),
    //插入冲突策略（如果同样的对象被插入两次，则后者替换前者）
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
  Log.i("添加钱包成功，walletid = : $id");
  wallet.id = id;

  await saveCoins(wallet, password);
}

Future<void> saveCoins(wallet, password) async {
  final names =
      BaseData.DEFAULT_COINS.map((e) => "${e.name},${e.platform}").toList();
  final resp = await Http.of().post(COIN_LIST, data: {"names": names});
  if (!resp.ok) {
    return;
  }
  final coins = resp.data.map((e) => CoinBean.fromJson(e)).toList();

  final preCoins = BaseData.DEFAULT_COINS.map((e) => e.clone()).toList();
  final db = getDB();

  for (var coin in preCoins) {
    coin.added = true;
    coin.pwalletId = wallet.id;
    coin.setPrivPubAddr(password, wallet);

    if (coin.contract == null || coin.contract!.isEmpty) {
      final c = coins.firstWhere((e) => e.netId == coin.netId,
          orElse: () => CoinBean());
      coin.icon = coin.icon ?? c.icon;
      coin.contract = coin.contract ?? c.contract;
    }

    int id = await db.insert(
      'Coin',
      coin.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    Log.i("添加成功，coinid = : $id");
  }
}

Future<void> deleteWallet(wallet, wallets) async {
  if (wallets.length == 1) {
    toast('至少保留一个钱包');
    return;
  }
  final db = getDB();
  var re = await db.delete('Wallet', where: 'id = ?', whereArgs: [wallet.id]);
  Log.i("re ===  $re");

  await db.delete('Coin', where: 'pwalletId = ?', whereArgs: [wallet.id]);
}

bool isChinese(String input) {
  // 使用正则表达式判断字符串中是否包含中文字符
  return RegExp(r'[\u4e00-\u9fa5]').hasMatch(input);
}

bool isEnglish(String input) {
  // 使用正则表达式判断字符串中是否包含英文字符
  return RegExp(r'[a-zA-Z]').hasMatch(input);
}

String formatString(String input) {
  // 去除首尾空格
  String trimmed = input.trim();

  // 使用正则表达式将多个空格替换为一个空格
  String formatted = trimmed.replaceAll(RegExp(r'\s+'), ' ');

  return formatted;
}

// String formatChineseString(String input) {
//   // 去除首尾空格
//   String trimmed = input.trim();

//   // 去除汉字之间的多余空格
//   String noExtraSpaces = trimmed.replaceAll(
//       RegExp(r'([\u4e00-\u9fa5])\s+([\u4e00-\u9fa5])'), r'$1$2');

//   // 使用正则表达式在每个汉字之间添加一个空格
//   String formatted = noExtraSpaces.replaceAllMapped(
//     RegExp(r'([\u4e00-\u9fa5])([\u4e00-\u9fa5])'),
//     (Match match) => '${match.group(1)} ${match.group(2)}',
//   );

//   return formatted;
// }

Future<List<Contects>> getContects(int walletId) async {
  final db = getDB();
  final list =
      await db.query('Contacts', where: 'walletId = ?', whereArgs: [walletId]);
  final dbList = list.map((e) => DBContects.fromJson(e)).toList();
  final map = <String, Contects>{};
  for (var e in dbList) {
    final key = e.name + e.phoneNum;
    final addr = ContactsAddress(coinId: e.coinId, address: e.address);
    if (map.containsKey(key)) {
      map[key]?.addAddress(addr);
    } else {
      map[key] =
          Contects(name: e.name, phoneNum: e.phoneNum, addressList: [addr]);
    }
  }
  return map.entries.map((e) => e.value).toList();
}

final contectsProvider = FutureProvider.autoDispose
    .family<List<Contects>, int>((ref, walletId) async {
  return await getContects(walletId);
});

Future<void> saveContects(
    {required Contects contects, required int walletId}) async {
  final db = getDB();
  for (var addr in contects.addressList!) {
    final dbContects = DBContects(
        walletId: walletId,
        name: contects.name,
        phoneNum: contects.phoneNum,
        coinId: addr.coinId!,
        address: addr.address!);
    await db.insert(
      'Contacts',
      dbContects.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
