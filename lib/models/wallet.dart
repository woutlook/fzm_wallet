import 'package:fzm_wallet/models/coin.dart';
import 'package:fzm_wallet/models/store.dart';
import 'package:fzm_wallet/models/wapi.dart';

enum WalletType {
  mnemonic,
  privateKey,
  address, // 用于导入观察钱包
}

class AccountInfo {
  final String address;
  final String publicKey;
  final String encryptedPrivKey;
  final String chain;

  AccountInfo({
    required this.chain,
    required this.address,
    required this.publicKey,
    required this.encryptedPrivKey,
  });

  factory AccountInfo.fromJson(Map<String, dynamic> map) {
    return AccountInfo(
      chain: map['chain'],
      address: map['address'],
      publicKey: map['publicKey'],
      encryptedPrivKey: map['privateKey'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'chain': chain,
      'address': address,
      'publicKey': publicKey,
      'privateKey': encryptedPrivKey,
    };
  }
}

class Account {
  final Map<String, AccountInfo> accMap; // key is chain

  Account({
    required this.accMap,
  });

  factory Account.fromJson(Map<String, dynamic> map) {
    return Account(
      accMap: (map['accMap'] as Map)
          .map((key, value) => MapEntry(key, AccountInfo.fromJson(value))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'accMap': accMap.map((key, value) => MapEntry(key, value.toJson())),
    };
  }
}

abstract class Wallet {
  final WalletType type;
  String name;
  static final Map<int, Coin> cachedCoins = {
    for (var coin in allCoinList) coin.id: coin
  };
  final Map<int, Coin> coins; // key is coin id, value is coin name

  Account get account;
  List<Coin> get coinList {
    final sortedKeys = coins.keys.toList()..sort();
    return sortedKeys.map((e) => coins[e]!).toList();
  }

  Wallet({
    required this.type,
    required this.name,
    required this.coins,
  });

  Map<String, dynamic> toJson();

  String typeString() {
    switch (type) {
      case WalletType.mnemonic:
        return '助记词钱包';
      case WalletType.privateKey:
        return '私钥钱包';
      case WalletType.address:
        return '地址钱包';
    }
  }

  void addCoin(Coin coin) {
    coins[coin.id] = coin;
    // store.setCoin(coin);
  }

  void removeCoin(int id) {
    coins.remove(id);
    // store.removeCoin(id);
  }

  static Map<int, Coin> coinsFromjson(Map<String, dynamic> json) {
    final coins = <int, Coin>{};
    for (var entry in json.entries) {
      final id = int.parse(entry.key);
      final ss = entry.value.split(':');
      var coin = Wallet.cachedCoins[id];
      coin ??= Coin(id: id, name: ss[0], chain: ss[1]);
      // if (coin == null) {
      //   final searchArgs = SearchArgs(
      //     page: 1,
      //     limit: 100,
      //     keyword: name,
      //     chain: "",
      //     platform: "",
      //   );

      //   final resp =
      //       await Http.of().post(SEARCH_COIN, data: searchArgs.toJson());
      //   final list = (resp.data as List)
      //       .map((e) => Coin.fromJson(e as Map<String, dynamic>))
      //       .toList();
      //   coin = list.firstWhereNullable((e) => e.id == id);
      //   Wallet.cachedCoins[id] = coin!;
      // }
      coins[id] = coin;
    }

    return coins;
  }

  bool hasCoin(int id) => coins.containsKey(id);

  String getAccountAddress({
    required String chain,
    BTCAddressType type = BTCAddressType.bip44,
  }) {
    throw UnimplementedError();
  }

  Future<String> getAccountPrivateKey({
    required String chain,
    required String password,
    BTCAddressType type = BTCAddressType.bip44,
  }) async {
    throw UnimplementedError();
  }

  String getAccountPublicKey({
    required String chain,
    BTCAddressType type = BTCAddressType.bip44,
  }) {
    throw UnimplementedError();
  }

  Future<Account> newHDAccount({
    required String name,
    BTCAddressType type = BTCAddressType.bip44,
  }) async {
    throw UnimplementedError();
  }
}

class MnemonicWallet extends Wallet {
  final String encryptedMnemonic;
  @override
  Account account;

  MnemonicWallet({
    required super.name,
    required super.type,
    required super.coins,
    required this.account,
    required this.encryptedMnemonic,
  });

  factory MnemonicWallet.fromJson(Map<String, dynamic> map) {
    return MnemonicWallet(
      name: map['name'],
      type: WalletType.values.firstWhere((value) => value.name == map['type']),
      coins: Wallet.coinsFromjson(map['coins']),
      account: Account.fromJson(map['account']),
      encryptedMnemonic: map['encryptedMnemonic'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final map = {
      'name': name,
      'type': type.name,
      'coins': coins.map((key, value) =>
          MapEntry(key.toString(), '${value.name}:${value.chain}')),
      'account': account.toJson(),
      'encryptedMnemonic': encryptedMnemonic,
    };
    return map;
  }

  static Future<AccountInfo> _getAccountInfo(
      {required String chain,
      required String mnemonic,
      required String password}) async {
    final json = walletApi.getAccount(chain: chain, mnem: mnemonic);
    final private = json['priv'];
    final accInfo = AccountInfo(
      address: json['address'],
      publicKey: json['pub'],
      chain: chain,
      encryptedPrivKey: await store.encryptData(private, password),
    );
    return accInfo;
  }

  static Future<MnemonicWallet> fromMnemonic({
    required String mnemonic,
    required String name,
    required String password,
  }) async {
    final chains = wapiMap.keys.toList();
    final accMap = <String, AccountInfo>{};
    final evmInfo = await _getAccountInfo(
        chain: 'ETH', mnemonic: mnemonic, password: password);
    for (final chain in chains) {
      if (chain == 'ETH' ||
          chain == 'BNB' ||
          chain == 'BTY0x' ||
          chain == 'YCC') {
        accMap[chain] = evmInfo;
      } else {
        final accInfo = await _getAccountInfo(
            chain: chain, mnemonic: mnemonic, password: password);
        accMap[chain] = accInfo;
      }
    }
    final account = Account(
      accMap: accMap,
    );
    final coins = {for (var coin in defaultCoinList) coin.id: coin};

    final encryptedMnemonic = await store.encryptData(mnemonic, password);
    return MnemonicWallet(
      name: name,
      type: WalletType.mnemonic,
      account: account,
      coins: coins,
      encryptedMnemonic: encryptedMnemonic,
    );
  }

  @override
  String getAccountAddress({
    required String chain,
    BTCAddressType type = BTCAddressType.bip44,
  }) {
    final address = account.accMap[chain]?.address;
    if (address == null) {
      throw Exception('Address not found');
    } else {
      return address;
    }
  }

  @override
  Future<String> getAccountPrivateKey({
    required String chain,
    required String password,
    BTCAddressType type = BTCAddressType.bip44,
  }) async {
    final encPriv = account.accMap[chain]?.encryptedPrivKey;
    if (encPriv == null) {
      throw Exception('Private key not found');
    }
    final privateKey = await store.decryptData(encPriv, password);
    return privateKey;
  }

  @override
  String getAccountPublicKey({
    required String chain,
    BTCAddressType type = BTCAddressType.bip44,
  }) {
    final publicKey = account.accMap[chain]?.publicKey;
    if (publicKey == null) {
      throw Exception('Public key not found');
    }
    return publicKey;
  }

  static const defaultChain = 'ethereum';
}

class PrivateWallet extends Wallet {
  @override
  final Account account;

  PrivateWallet({
    required super.name,
    required super.type,
    required super.coins,
    required this.account,
  });

  factory PrivateWallet.fromJson(Map<String, dynamic> map) {
    final type =
        WalletType.values.firstWhere((value) => value.name == map['type']);
    return PrivateWallet(
      name: map['name'],
      type: type,
      coins: Wallet.coinsFromjson(map['coins']),
      account: Account.fromJson(map['account']),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'type': type.name,
      'account': account.toJson(),
      'coins': coins.map((key, value) =>
          MapEntry(key.toString(), '${value.name}:${value.chain}')),
    };
  }

  static Future<PrivateWallet> fromPrivateKey({
    required String privateKey,
    required String chain,
    required String name,
    required String password,
  }) async {
    final publicKey = walletApi.privToPub(chain, privateKey);
    final address = walletApi.pubToAddr(chain, publicKey);
    final encrypedPriv = await store.encryptData(privateKey, password);

    final accInfo = AccountInfo(
      address: address,
      chain: chain,
      publicKey: publicKey,
      encryptedPrivKey: encrypedPriv,
    );
    final account = Account(
      accMap: {chain: accInfo},
    );

    return PrivateWallet(
      name: name,
      type: WalletType.privateKey,
      coins: {
        for (var coin in defaultCoinList)
          if (coin.chain == chain) coin.id: coin
      },
      account: account,
    );
  }

  @override
  String getAccountAddress({
    required String chain,
    BTCAddressType type = BTCAddressType.bip44,
  }) {
    final address = account.accMap[chain]?.address;
    return address!;
  }

  @override
  Future<String> getAccountPrivateKey({
    required String chain,
    required String password,
    BTCAddressType type = BTCAddressType.bip44,
  }) async {
    final encPriv = account.accMap[chain]?.encryptedPrivKey;
    if (encPriv == null) {
      throw Exception('Private key not found');
    }
    final privateKey = await store.decryptData(encPriv, password);
    return privateKey;
  }

  @override
  String getAccountPublicKey({
    required String chain,
    BTCAddressType type = BTCAddressType.bip44,
  }) {
    final publicKey = account.accMap[chain]?.publicKey;
    if (publicKey == null) {
      throw Exception('Public key not found');
    }
    return publicKey;
  }
}

class AddressWallet extends Wallet {
  @override
  final Account account;

  AddressWallet({
    required super.name,
    required super.type,
    required super.coins,
    required this.account,
  });

  factory AddressWallet.fromJson(Map<String, dynamic> map) {
    final type =
        WalletType.values.firstWhere((value) => value.name == map['type']);
    return AddressWallet(
      name: map['name'],
      type: type,
      coins: Wallet.coinsFromjson(map['coins']),
      account: Account.fromJson(map['account']),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'type': type.name,
      'account': account.toJson(),
      'coins': coins.map((key, value) =>
          MapEntry(key.toString(), '${value.name}:${value.chain}')),
    };
  }

  factory AddressWallet.fromAddress({
    required String address,
    required String name,
    required String chain,
  }) {
    final accInfo = AccountInfo(
      address: address,
      chain: chain,
      publicKey: '',
      encryptedPrivKey: '',
    );
    final account = Account(
      accMap: {chain: accInfo},
    );

    return AddressWallet(
      name: name,
      type: WalletType.address,
      coins: {
        for (var coin in defaultCoinList)
          if (coin.chain == chain) coin.id: coin
      },
      account: account,
    );
  }

  @override
  String getAccountAddress({
    required String chain,
    BTCAddressType type = BTCAddressType.bip44,
  }) {
    final address = account.accMap[chain]?.address;
    return address!;
  }
}
