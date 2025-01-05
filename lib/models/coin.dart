class Coin {
  final int id;
  final String name;
  final String chain; // which chain the token belongs to
  final String? nickname;
  final String? symbol;
  final int? decimals;
  final bool? isNative;
  final String? contract;
  final String? icon;
  final String? coingeckoId;

  Coin({
    required this.id,
    required this.name,
    required this.chain,
    this.nickname,
    this.symbol,
    this.decimals,
    this.isNative,
    this.contract,
    this.icon,
    this.coingeckoId,
  });

  factory Coin.fromJson(Map<String, dynamic> json) {
    return Coin(
      id: json['id'],
      name: json['name'],
      nickname: json['nickname'],
      symbol: json['symbol'] ?? json['name'],
      decimals: json['decimals'] ?? 18,
      chain: json['chain'],
      isNative: json['isNative'] ?? false,
      contract: json['contract_address'],
      icon: json['icon'],
      coingeckoId: json['coingeckoId'] ?? '',
    );
  }

  // factory Coin.fromCoinBean(CoinBean coin) {
  //   return Coin(
  //     id: coin.id!,
  //     name: coin.name!,
  //     nickname: coin.nickname!,
  //     symbol: coin.name!,
  //     decimals: 18,
  //     chain: coin.chain!,
  //     isNative: false,
  //     contract: coin.contract,
  //     icon: coin.icon,
  //   );
  // }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'nickname': nickname,
      'symbol': symbol,
      'decimals': decimals,
      'chain': chain,
      'isNative': isNative,
      'contract': contract,
      'icon': icon,
      'coingeckoId': coingeckoId,
    };
  }

  Coin clone() => Coin(
        id: id,
        name: name,
        nickname: nickname,
        symbol: symbol,
        decimals: decimals,
        chain: chain,
        isNative: isNative,
        contract: contract,
        icon: icon,
        coingeckoId: coingeckoId,
      );

  // CoinBean toCoinBean() {
  //   return CoinBean(
  //     id: id,
  //     name: name,
  //     chain: chain,
  //     contract: contract,
  //     icon: icon,
  //   );
  // }
}

final Map<String, Coin> defaultCoins = {
  'BTY': Coin(
    id: 154,
    name: "BTY",
    chain: "BTY",
    nickname: "Bityuan-1x",
    isNative: true,
    decimals: 8,
    symbol: "BTY",
    icon:
        'http://bqbwallet.oss-cn-shanghai.aliyuncs.com/upload/application/8568e340ae44fcd01bddf84a3eb2d7aa.png',
  ),
  'BTY-BNB': Coin(
    id: 705,
    name: "BTY",
    chain: "BNB",
    nickname: "BEP20",
    isNative: false,
    decimals: 8,
    symbol: "BTY",
    contract: '0xC00B9189F0d87F4609ddbc86ba3b347339E34102',
    icon:
        'http://bqbwallet.oss-cn-shanghai.aliyuncs.com/upload/application/683aeea27ae6577e98cc2b3d1feeb061.png',
  ),
  'BTY-ETH': Coin(
    id: 732,
    name: "BTY",
    chain: "ETH",
    nickname: "Bityuan-0x",
    isNative: false,
    decimals: 8,
    symbol: "BTY",
    icon:
        'http://wallet-33.oss-cn-shanghai.aliyuncs.com/upload/application/a9105ade2d35a1592b23545a24f6248b.png',
  ),
  'YCC': Coin(
    id: 155,
    name: "YCC",
    chain: "YCC",
    nickname: "YuanChain-0x",
    isNative: true,
    decimals: 8,
    symbol: "YCC",
    icon:
        'http://bqbwallet.oss-cn-shanghai.aliyuncs.com/upload/application/f3bc3704f5e7aea4a3fb0caba63d3bde.png',
  ),
  'YCC-ETH': Coin(
    id: 729,
    name: "YCC",
    chain: "ETH",
    nickname: "ERC20",
    isNative: false,
    decimals: 8,
    symbol: "YCC",
    contract: '0x37e1160184f7dd29f00b78c050bf13224780b0b0',
    icon:
        'http://wallet-33.oss-cn-shanghai.aliyuncs.com/upload/application/c916b6067d2cb61cc5ef2f4e1b682946.png',
  ),
  'YCC-BNB': Coin(
    id: 695,
    name: "YCC",
    chain: "BNB",
    nickname: "BEP20",
    isNative: false,
    decimals: 8,
    symbol: "YCC",
    contract: '0xa7ee9427641bdce951c725a4eaed477346697c84',
    icon:
        'http://bqbwallet.oss-cn-shanghai.aliyuncs.com/upload/application/08712750389ab6c92deae50b54fc0012.png',
  ),
  'ETH': Coin(
    id: 90,
    name: "ETH",
    chain: "ETH",
    nickname: "以太坊",
    isNative: true,
    decimals: 18,
    symbol: "ETH",
    icon:
        'http://bqbwallet.oss-cn-shanghai.aliyuncs.com/upload/application/dd069dfef3b7d7af31cf75d610b2a109.png',
  ),
  'TRX': Coin(
    id: 1,
    name: "TRX",
    chain: "TRX",
    nickname: "波场",
    isNative: true,
    decimals: 6,
    symbol: "TRX",
    icon:
        'http://bqbwallet.oss-cn-shanghai.aliyuncs.com/upload/application/7be9b137accdb769828a69080e524f92.png',
  ),
  'BNB': Coin(
    id: 641,
    name: "BNB",
    chain: "BNB",
    nickname: "Binance",
    isNative: true,
    symbol: "BNB",
    decimals: 18,
    icon:
        'http://bqbwallet.oss-cn-shanghai.aliyuncs.com/upload/application/834b12284a6a5cee9ed5d1937e292b70.png',
  ),
  'USDT-ETH': Coin(
    id: 288,
    name: "USDT",
    chain: "ETH",
    nickname: "ERC20",
    isNative: false,
    decimals: 6,
    symbol: "USDT",
    contract: "0xdac17f958d2ee523a2206206994597c13d831ec7",
    icon:
        'http://bqbwallet.oss-cn-shanghai.aliyuncs.com/upload/application/6f70a11b3911301b6836b28dce8f12d3.png',
  ),
  'USDT-BNB': Coin(
    id: 694,
    name: "USDT",
    chain: "BNB",
    nickname: "BEP20",
    isNative: false,
    decimals: 6,
    symbol: "USDT",
    contract: "0x55d398326f99059ff775485246999027b3197955",
    icon:
        'http://bqbwallet.oss-cn-shanghai.aliyuncs.com/upload/application/cad48c7bc2573ac159d01ed6e82fd54d.jpeg',
  ),
  'USDT-TRX': Coin(
    id: 600,
    name: "USDT",
    chain: "TRX",
    nickname: "TRC20",
    isNative: false,
    decimals: 6,
    symbol: "USDT",
    contract: "TR7NHqjeKQxGTCi8q8ZY4pL8otSzgjLj6t",
    icon:
        'http://bqbwallet.oss-cn-shanghai.aliyuncs.com/upload/application/e3e6895d9f3bcaeb2fc38802cdde1b16.png',
  )
};

final Map<String, Coin> nativeCoin = {
  'BTY': defaultCoins['BTY']!,
  'YCC': defaultCoins['YCC']!,
  'ETH': defaultCoins['ETH']!,
  'TRX': defaultCoins['TRX']!,
  'BNB': defaultCoins['BNB']!,
};
