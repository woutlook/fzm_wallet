// ignore_for_file: constant_identifier_names

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fzm_wallet/models/coin.dart';
import 'package:fzm_wallet/models/contact.dart';
import 'package:fzm_wallet/models/store.dart';
import 'package:fzm_wallet/models/tx.dart';
import 'package:fzm_wallet/models/chain33_http.dart';
import 'package:fzm_wallet/models/wallet.dart';
import 'package:fzm_wallet/models/wapi.dart';

final createWalletParameterProvider =
    StateProvider<Map<String, dynamic>>((ref) {
  return {};
});

final coinProvider = StateProvider<Coin?>((ref) {
  return null;
});

final toAddressProvider = StateProvider<String?>((ref) {
  return null;
});

// final urlProvider = StateProvider<String?>((ref) {
//   return null;
// });

class WalletNotifier extends StateNotifier<Wallet> {
  WalletNotifier(super.state);

  Future<void> changeWalletName(oldName, newName) async {
    state.name = newName;
    state = state;
    await store.updateWallet(oldName, state);
    await store.setCurrentWallet(newName);
  }

  Future<void> updateWallet(Wallet newWallet) async {
    state = newWallet;
    await store.setCurrentWallet(newWallet.name);
  }
}

const defaultWalletName = 'default-xxx';

final walletProvider = StateNotifierProvider<WalletNotifier, Wallet>((ref) {
  var wallet = store.getCurrentWallet();
  wallet ??= AddressWallet.fromAddress(
      address: '0x0', name: defaultWalletName, chain: 'ETH');
  return WalletNotifier(wallet);
});

final noPassworkPayProvider = StateProvider<bool>((ref) {
  return false;
});

final hideLess1Provider = StateProvider<Map<String, bool>>((ref) {
  return <String, bool>{};
});

final balanceProvider =
    StreamProvider.autoDispose.family<double, Coin>((ref, coin) async* {
  final wallet = ref.watch(walletProvider);
  final chain = coin.chain;
  final who = wallet.getAccountAddress(chain: chain);
  while (true) {
    try {
      final balance = await walletApi.getBalance(
          who: who,
          chain: chain,
          contractAddr: coin.contract!,
          coinSymbol: coin.symbol!);
      yield balance;
    } catch (e) {
      yield 0.0;
    }
    await Future.delayed(Duration(seconds: 10));
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

// final dnsProvider =
//     FutureProvider.autoDispose.family<List<String>, DNSArgs>((ref, args) async {
//   try {
//     final client = httpClient;
//     final resp = await client.get(DNS, parameters: args.toJson());
//     final dns = DNSResponse.fromJson(resp.data);
//     return dns.data ?? [];
//   } catch (e) {
//     return [];
//   }
// });

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
    final resp = await httpClient.get(UPDATE);
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
    final resp = await httpClient.get(NOTICE_DETAIL, parameters: {
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
    final resp = await httpClient.get(NOTICE_LIST, parameters: args.toJson());
    final notices = resp.data["list"];
    return (notices as List).map((e) => Notice.fromJson(e)).toList();
  } catch (e) {
    return [];
  }
});

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
  final resp = await httpClient.post(SEARCH_COIN, body: searchArgs.toJson());
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
      await wallet.getAccountPrivateKey(chain: coin.chain, password: password);

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

String formatString(String input) {
  String trimmed = input.trim();
  String formatted = trimmed.replaceAll(RegExp(r'\s+'), ' ');
  return formatted;
}

final contectsProvider = StateProvider<List<Contact>>((ref) {
  final list = store.getContactList();
  return list;
});
