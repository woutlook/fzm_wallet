import 'package:fwallet/api/api.dart';
import 'package:fwallet/bean/pwallet_bean.dart';
import 'package:fwallet/provider/p.dart';
import 'package:fwallet/utils/app_utils.dart';
import 'package:sqflite/sqflite.dart';

class CoinBean {
  CoinBean({
    this.id,
    this.pwalletId,
    this.pubkey,
    this.privkey,
    this.address,
    this.contract,
    this.icon,
    this.name,
    this.nickname,
    this.platform,
    this.chain,
    this.treaty,
    this.netId,
    this.balance,
    this.added = false,
  });

  CoinBean.fromJson(Map<String, dynamic> json) {
    final id_ = json['id'] ?? 0;
    id = id_ is int ? id_ : int.parse(id_);
    pwalletId = json['pwalletId'];
    pubkey = json['pubkey'];
    privkey = json['privkey'];
    address = json['address'];
    contract = json['contract'];
    icon = json['icon'];
    name = json['name'];
    nickname = json['nickname'];
    platform = json['platform'];
    chain = json['chain'];
    final t = json['treaty'] ?? 0;
    treaty = t is int ? t : int.parse(t);
    final netid_ = json['netId'] ?? id;
    netId = netid_ is int ? netid_ : int.parse(netid_);
    balance = json['balance'];
    final a = json['added'] ?? false;
    added = a is int ? a == 1 : a;
  }

  int? id;
  int? pwalletId;
  String? pubkey;
  String? privkey;
  String? address;
  String? contract;
  String? icon;
  String? name;
  String? nickname;
  String? platform;
  String? chain;
  int? treaty;
  int? netId;
  String? balance;
  bool added = false;

  CoinBean clone() => CoinBean(
        id: id,
        pwalletId: pwalletId,
        pubkey: pubkey,
        privkey: privkey,
        address: address,
        contract: contract,
        icon: icon,
        name: name,
        nickname: nickname,
        platform: platform,
        chain: chain,
        treaty: treaty,
        netId: netId,
        balance: balance,
        added: added,
      );

  CoinBean copyWith({
    int? id,
    int? pwalletId,
    String? pubkey,
    String? privkey,
    String? address,
    String? contract,
    String? icon,
    String? name,
    String? nickname,
    String? platform,
    String? chain,
    int? treaty,
    int? netId,
    String? balance,
    bool added = false,
  }) =>
      CoinBean(
        id: id ?? this.id,
        pwalletId: pwalletId ?? this.pwalletId,
        pubkey: pubkey ?? this.pubkey,
        privkey: privkey ?? this.privkey,
        address: address ?? this.address,
        contract: contract ?? this.contract,
        icon: icon ?? this.icon,
        name: name ?? this.name,
        nickname: nickname ?? this.nickname,
        platform: platform ?? this.platform,
        chain: chain ?? this.chain,
        treaty: treaty ?? this.treaty,
        netId: netId ?? this.netId,
        balance: balance ?? this.balance,
        added: added,
      );

  Map<String, dynamic> toJson() {
    return {
      'pwalletId': pwalletId,
      'pubkey': pubkey,
      'privkey': privkey,
      'address': address,
      'contract': contract,
      'icon': icon,
      'name': name,
      'nickname': nickname,
      'platform': platform,
      'chain': chain,
      'treaty': treaty,
      'netId': netId,
      'balance': balance,
      'added': added,
    };
  }

  String? getPriv(String password, PwalletBean wallet) {
    if (wallet.type == PwalletBean.TYPE_MNEM) {
      return _getPriv(password, encMnem: wallet.mnem);
    } else if (wallet.type == PwalletBean.TYPE_PRIVATE) {
      return _getPriv(password, encPriv: wallet.privKey);
    }
    return _getPriv(password);
  }

  void setPrivPubAddr(password, wallet) {
    getPriv(password, wallet);
  }

  String? _getPriv(String password,
      {String? encMnem = '', String? encPriv = ''}) {
    final realChain = getRealChain(this);
    if (encMnem != null && encMnem.isNotEmpty) {
      final mnem = WalletApi().decMnem(encMnem, password);
      final map = WalletApi().getHDWallet(realChain, mnem);
      if (map.isEmpty) {
        return null;
      }
      address = map["address"];
      pubkey = map["pub"];
      final priv = map["priv"];
      privkey = WalletApi().encPriv(priv, password);
      return priv;
    } else if (encPriv != null && encPriv.isNotEmpty) {
      final priv = WalletApi().decPriv(encPriv, password);
      pubkey = WalletApi().privToPub(realChain, priv);
      address = WalletApi().pubToAddr(realChain, pubkey!);
      privkey = encPriv;
      return priv;
    } else {
      return WalletApi().decPriv(privkey!, password);
    }
  }
}

Future<void> updateCoin(Database db, CoinBean coin) async {
  try {
    // 检查是否存在具有相同 id 的记录
    final list = await db.query(
      'Coin',
      where: 'netId = ? AND pwalletId = ?',
      whereArgs: [coin.netId, coin.pwalletId],
    );
    final coins = list.map((e) => CoinBean.fromJson(e)).toList();

    if (coins.isNotEmpty) {
      // 如果存在，执行更新操作
      await db.update(
        'Coin',
        coin.toJson(),
        where: 'netId = ?',
        whereArgs: [coin.netId],
      );
    } else {
      // 如果不存在，执行插入操作
      await db.insert('Coin', coin.toJson());
    }
  } catch (e) {
    Log.i('DatabaseException: $e');
  }
}
