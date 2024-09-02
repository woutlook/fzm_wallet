// ignore_for_file: constant_identifier_names, non_constant_identifier_names
import 'package:blockchain_utils/blockchain_utils.dart' as chain_utils;

class TestChainInfo {
  String name;
  String rpcUrl;
  String scanUrl;
  String scanApiUrl;
  String scanApiKey;
  int chainId;

  TestChainInfo({
    required this.name,
    required this.rpcUrl,
    required this.scanUrl,
    required this.scanApiUrl,
    required this.scanApiKey,
    required this.chainId,
  });
}

class ChainConfig {
  List<String>? rpcUrlist;
  String? bestRpcUrl;
  String? scanUrl;
  String? scanApiUrl;
  String? scanApiKey;
  int? chainId;
  String name;
  final String nativeToken;
  int decimals = 18;
  String? electrumJson;
  bool useTest = false;
  TestChainInfo? testChainInfo;

  ChainConfig({
    this.rpcUrlist,
    this.bestRpcUrl,
    this.scanUrl,
    this.scanApiUrl,
    this.chainId,
    required this.nativeToken,
    this.decimals = 18,
    required this.name,
    this.scanApiKey,
    this.electrumJson,
    this.useTest = false,
    this.testChainInfo,
  });

  factory ChainConfig.fromJson(Map<String, dynamic> json) {
    return ChainConfig(
      rpcUrlist: json['rpcUrlist'],
      bestRpcUrl: json['bestRpcUrl'],
      scanUrl: json['scanUrl'],
      scanApiUrl: json['scanApiUrl'],
      chainId: json['chainId'],
      name: json['name'],
      nativeToken: json['nativeToken'],
      decimals: json['decimals'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'rpcUrlist': rpcUrlist,
      'bestRpcUrl': bestRpcUrl,
      'scanUrl': scanUrl,
      'scanApiUrl': scanApiUrl,
      'chainId': chainId,
      'name': name,
      'nativeToken': nativeToken,
      'decimals': decimals,
    };
  }
}

final ethereumConfig = ChainConfig(
  rpcUrlist: ['https://mainnet.infura.io/v3/1c177df366ef47b689e8b84ee6c7297d'],
  bestRpcUrl: 'https://mainnet.infura.io/v3/1c177df366ef47b689e8b84ee6c7297d',
  scanUrl: "https://etherscan.io/",
  scanApiUrl: 'https://api.etherscan.io/api',
  scanApiKey: 'UVTE4FNDB2EPUB758II1KXDFGY4RVP6FRC',
  chainId: 1,
  name: chain_utils.Bip44Coins.ethereum.name,
  nativeToken: "ETH",
  decimals: 18,
  testChainInfo: TestChainInfo(
    name: 'sepolia',
    rpcUrl: 'https://sepolia.infura.io/v3/1c177df366ef47b689e8b84ee6c7297d',
    scanUrl: 'https://sepolia.etherscan.io/',
    scanApiUrl: 'https://api-sepolia.etherscan.io/api',
    scanApiKey: 'UVTE4FNDB2EPUB758II1KXDFGY4RVP6FRC',
    chainId: 3,
  ),
);

final arbitrumConfig = ChainConfig(
  rpcUrlist: [
    'https://arb1.arbitrum.io/rpc',
    'https://arbitrum-mainnet.infura.io/v3/1c177df366ef47b689e8b84ee6c7297d'
  ],
  bestRpcUrl: 'https://arb1.arbitrum.io/rpc',
  scanUrl: 'https://arbiscan.io/',
  scanApiUrl: 'https://api.arbiscan.io/api',
  scanApiKey: 'TK2UEC7AQT91SUIND9YVXMGJFDEQBXQKWR',
  chainId: 42161,
  name: chain_utils.Bip44Coins.ethereum.name,
  nativeToken: 'ETH',
  decimals: 18,
  testChainInfo: TestChainInfo(
    name: 'sepolia',
    rpcUrl:
        'https://arbitrum-sepolia.infura.io/v3/1c177df366ef47b689e8b84ee6c7297d',
    scanUrl: 'https://sepolia.arbiscan.io/',
    scanApiUrl: 'https://api-sepolia.arbiscan.io/api',
    scanApiKey: 'TK2UEC7AQT91SUIND9YVXMGJFDEQBXQKWR',
    chainId: 421613,
  ),
);

final optimismConfig = ChainConfig(
  rpcUrlist: [
    'https://mainnet.optimism.io',
  ],
  bestRpcUrl: 'https://mainnet.optimism.io',
  scanUrl: 'https://optimistic.etherscan.io/',
  scanApiUrl: 'https://api-optimistic.etherscan.io/api',
  scanApiKey: 'HTA58FGET7UEXD3YH9BBUPD4BSVBJN34SG',
  chainId: 10,
  name: chain_utils.Bip44Coins.ethereum.name,
  nativeToken: 'ETH',
  decimals: 18,
  testChainInfo: TestChainInfo(
    name: 'sepolia',
    rpcUrl:
        'https://optimism-sepolia.infura.io/v3/1c177df366ef47b689e8b84ee6c7297d',
    scanUrl: 'https://sepolia-optimistic.etherscan.io/',
    scanApiUrl: 'https://api-sepolia-optimistic.etherscan.io/api',
    scanApiKey: 'HTA58FGET7UEXD3YH9BBUPD4BSVBJN34SG',
    chainId: 69,
  ),
);

final baseConfig = ChainConfig(
  rpcUrlist: [
    'https://base-mainnet.infura.io/v3/1c177df366ef47b689e8b84ee6c7297d',
  ],
  bestRpcUrl:
      'https://base-mainnet.infura.io/v3/1c177df366ef47b689e8b84ee6c7297d',
  scanUrl: 'https://basescan.org/',
  scanApiUrl: 'https://api.basescan.org/api',
  scanApiKey: 'SA62XQMXXCJ5DSPZQ12FCTYPJCKG8Y4DMK',
  chainId: 137,
  name: chain_utils.Bip44Coins.ethereum.name,
  nativeToken: 'ETH',
  decimals: 18,
  testChainInfo: TestChainInfo(
    name: 'sepolia',
    rpcUrl:
        'https://base-sepolia.infura.io/v3/1c177df366ef47b689e8b84ee6c7297d',
    scanUrl: 'https://sepolia.basescan.org/',
    scanApiUrl: 'https://api-sepolia.basescan.org/api',
    scanApiKey: 'SA62XQMXXCJ5DSPZQ12FCTYPJCKG8Y4DMK',
    chainId: 69,
  ),
);

final polygonConfig = ChainConfig(
  rpcUrlist: [
    'https://polygon-mainnet.infura.io/v3/1c177df366ef47b689e8b84ee6c7297d',
  ],
  bestRpcUrl:
      'https://polygon-mainnet.infura.io/v3/1c177df366ef47b689e8b84ee6c7297d',
  scanUrl: 'https://polygonscan.com/',
  scanApiUrl: 'https://api.polygonscan.com/api',
  scanApiKey: 'CEIXFV6456997R7QQ61YISIXP6EMCHB4HN',
  chainId: 137,
  name: chain_utils.Bip44Coins.polygon.name,
  nativeToken: 'MATIC',
  decimals: 18,
  testChainInfo: TestChainInfo(
    name: 'amoy',
    rpcUrl:
        'https://polygon-amoy.infura.io/v3/1c177df366ef47b689e8b84ee6c7297d',
    scanUrl: 'https://amoy.polygonscan.com/',
    scanApiUrl: 'https://api-amoy.polygonscan.com/api',
    scanApiKey: 'CEIXFV6456997R7QQ61YISIXP6EMCHB4HN',
    chainId: 80001,
  ),
);

final avalancheConfig = ChainConfig(
  rpcUrlist: [
    'https://api.avax.network/ext/bc/C/rpc',
    'https://avalanche-mainnet.infura.io/v3/1c177df366ef47b689e8b84ee6c7297d',
  ],
  bestRpcUrl:
      'https://avalanche-mainnet.infura.io/v3/1c177df366ef47b689e8b84ee6c7297d',
  scanUrl: 'https://snowtrace.io/',
  scanApiUrl:
      'https://api.routescan.io/v2/network/mainnet/evm/43114/etherscan/api',
  chainId: 43114,
  name: chain_utils.Bip44Coins.avaxCChain.name,
  nativeToken: 'AVAX',
  decimals: 18,
  testChainInfo: TestChainInfo(
    name: 'fuji',
    rpcUrl:
        'https://avalanche-fuji.infura.io/v3/1c177df366ef47b689e8b84ee6c7297d',
    scanUrl: 'https://testnet.snowtrace.io/',
    scanApiUrl:
        'https://api.routescan.io/v2/network/testnet/evm/43113/etherscan/api',
    scanApiKey: '',
    chainId: 43113,
  ),
);

final bscConfig = ChainConfig(
  rpcUrlist: [
    'https://bsc-mainnet.infura.io/v3/1c177df366ef47b689e8b84ee6c7297d',
  ],
  bestRpcUrl:
      'https://bsc-mainnet.infura.io/v3/1c177df366ef47b689e8b84ee6c7297d',
  scanUrl: 'https://bscscan.com/',
  scanApiUrl: 'https://api.bscscan.com/api',
  scanApiKey: 'WAAUR4ES8JAVQ74ZWDR51WGQQE4PC3EWFN',
  chainId: 56,
  name: chain_utils.Bip44Coins.binanceSmartChain.name,
  nativeToken: 'BNB',
  decimals: 18,
  testChainInfo: TestChainInfo(
    name: 'sepolia',
    rpcUrl: 'https://bsc-testnet.infura.io/v3/1c177df366ef47b689e8b84ee6c7297d',
    scanUrl: 'https://testnet.bscscan.com/',
    scanApiUrl: 'https://api-testnet.bscscan.com/api',
    scanApiKey: 'WAAUR4ES8JAVQ74ZWDR51WGQQE4PC3EWFN',
    chainId: 97,
  ),
);

final tronConfig = ChainConfig(
  rpcUrlist: [
    'https://api.trongrid.io/jsonrpc',
    'https://go.getblock.io/bdbb274cf77e40b791e59719ca17c645'
  ],
  bestRpcUrl: 'https://api.trongrid.io/jsonrpc',
  scanUrl: 'https://tronscan.org/',
  scanApiUrl: 'https://apilist.tronscan.org/api',
  scanApiKey: '0fccd20f-990a-40c1-9cfb-f0baa43b7c18',
  chainId: -1,
  name: chain_utils.Bip44Coins.tron.name,
  nativeToken: 'TRX',
  decimals: 6,
  testChainInfo: TestChainInfo(
    name: 'testnet',
    rpcUrl: 'https://api.shasta.trongrid.io/jsonrpc',
    scanUrl: '',
    scanApiUrl: '',
    scanApiKey: '',
    chainId: -1,
  ),
);

final solanaConfig = ChainConfig(
  rpcUrlist: [
    'https://api.mainnet-beta.solana.com',
    'https://sly-yolo-dinghy.solana-mainnet.quiknode.pro/2ac2af5b8c2e5e9e74c7906e949f1976314aa996',
  ],
  bestRpcUrl: 'https://api.mainnet-beta.solana.com',
  scanUrl: 'https://explorer.solana.com/',
  chainId: 101,
  name: chain_utils.Bip44Coins.solana.name,
  nativeToken: 'SOL',
  decimals: 9,
  testChainInfo: TestChainInfo(
    name: 'devnet',
    rpcUrl: 'https://api.devnet.solana.com',
    scanUrl: 'https://explorer.solana.com/',
    scanApiUrl: '',
    scanApiKey: '',
    chainId: 101,
  ),
);

final btcConfig = ChainConfig(
  scanUrl: 'https://blockchain.info/',
  electrumJson: btc_electrum,
  chainId: 0,
  name: chain_utils.Bip44Coins.bitcoin.name,
  nativeToken: 'BTC',
  decimals: 8,
);

final bchConfig = ChainConfig(
  scanUrl: 'https://blockchair.com/bitcoin-cash/',
  electrumJson: bch_electrum,
  chainId: 145,
  name: chain_utils.Bip44Coins.bitcoinCash.name,
  nativeToken: 'BCH',
  decimals: 8,
);

final ltcConfig = ChainConfig(
  scanUrl: 'https://blockchair.com/litecoin/',
  electrumJson: ltc_electrum,
  chainId: 2,
  name: chain_utils.Bip44Coins.litecoin.name,
  nativeToken: 'LTC',
  decimals: 8,
);

final dogeConfig = ChainConfig(
  scanUrl: 'https://blockchair.com/dogecoin/',
  electrumJson: doge_electrum,
  chainId: 3,
  name: chain_utils.Bip44Coins.dogecoin.name,
  nativeToken: 'DOGE',
  decimals: 8,
);

final dashConfig = ChainConfig(
  scanUrl: 'https://blockchair.com/dash/',
  electrumJson: dash_electrum,
  chainId: 5,
  name: chain_utils.Bip44Coins.dash.name,
  nativeToken: 'DASH',
  decimals: 8,
);

const btc_electrum = r'''
[
    {
        "url": "electrum1.cipig.net:10000",
        "contact": [
            {
                "email": "cipi@komodoplatform.com"
            },
            {
                "discord": "cipi#4502"
            }
        ]
    },
    {
        "url": "electrum3.cipig.net:10000",
        "contact": [
            {
                "email": "cipi@komodoplatform.com"
            },
            {
                "discord": "cipi#4502"
            }
        ]
    },
    {
        "url": "electrum1.cipig.net:20000",
        "protocol": "SSL",
        "contact": [
            {
                "email": "cipi@komodoplatform.com"
            },
            {
                "discord": "cipi#4502"
            }
        ],
        "ws_url": "electrum1.cipig.net:30000"
    },
    {
        "url": "electrum2.cipig.net:20000",
        "protocol": "SSL",
        "contact": [
            {
                "email": "cipi@komodoplatform.com"
            },
            {
                "discord": "cipi#4502"
            }
        ],
        "ws_url": "electrum2.cipig.net:30000"
    },
    {
        "url": "electrum2.cipig.net:10000",
        "contact": [
            {
                "email": "cipi@komodoplatform.com"
            },
            {
                "discord": "cipi#4502"
            }
        ]
    },
    {
        "url": "electrum3.cipig.net:20000",
        "protocol": "SSL",
        "contact": [
            {
                "email": "cipi@komodoplatform.com"
            },
            {
                "discord": "cipi#4502"
            }
        ],
        "ws_url": "electrum3.cipig.net:30000"
    }
]
''';

const bch_electrum = r'''
[
    {
        "url": "bch.imaginary.cash:50002",
        "protocol": "SSL",
        "ws_url": "bch.imaginary.cash:50004"
    },
    {
        "url": "bch.soul-dev.com:50002",
        "protocol": "SSL",
        "ws_url": "bch.soul-dev.com:50004"
    },
    {
        "url": "cashnode.bch.ninja:50002",
        "protocol": "SSL",
        "ws_url": "cashnode.bch.ninja:50004"
    },
    {
        "url": "electrum3.cipig.net:20055",
        "protocol": "SSL",
        "contact": [
            {
                "email": "cipi@komodoplatform.com"
            },
            {
                "discord": "cipi#4502"
            }
        ],
        "ws_url": "electrum3.cipig.net:30055"
    },
    {
        "url": "electrum3.cipig.net:10055",
        "contact": [
            {
                "email": "cipi@komodoplatform.com"
            },
            {
                "discord": "cipi#4502"
            }
        ]
    }
]
''';

const ltc_electrum = r'''
[
    {
        "url": "electrum1.cipig.net:20063",
        "protocol": "SSL",
        "contact": [
            {
                "email": "cipi@komodoplatform.com"
            },
            {
                "discord": "cipi#4502"
            }
        ],
        "ws_url": "electrum1.cipig.net:30063"
    },
    {
        "url": "electrum3.cipig.net:20063",
        "protocol": "SSL",
        "contact": [
            {
                "email": "cipi@komodoplatform.com"
            },
            {
                "discord": "cipi#4502"
            }
        ],
        "ws_url": "electrum3.cipig.net:30063"
    },
    {
        "url": "electrum2.cipig.net:10063",
        "contact": [
            {
                "email": "cipi@komodoplatform.com"
            },
            {
                "discord": "cipi#4502"
            }
        ]
    },
    {
        "url": "electrum3.cipig.net:10063",
        "contact": [
            {
                "email": "cipi@komodoplatform.com"
            },
            {
                "discord": "cipi#4502"
            }
        ]
    },
    {
        "url": "electrum2.cipig.net:20063",
        "protocol": "SSL",
        "contact": [
            {
                "email": "cipi@komodoplatform.com"
            },
            {
                "discord": "cipi#4502"
            }
        ],
        "ws_url": "electrum2.cipig.net:30063"
    },
    {
        "url": "electrum1.cipig.net:10063",
        "contact": [
            {
                "email": "cipi@komodoplatform.com"
            },
            {
                "discord": "cipi#4502"
            }
        ]
    }
]
''';

const doge_electrum = r'''
[
    {
        "url": "electrum1.cipig.net:10060",
        "contact": [
            {
                "email": "cipi@komodoplatform.com"
            },
            {
                "discord": "cipi#4502"
            }
        ]
    },
    {
        "url": "electrum3.cipig.net:10060",
        "contact": [
            {
                "email": "cipi@komodoplatform.com"
            },
            {
                "discord": "cipi#4502"
            }
        ]
    },
    {
        "url": "electrum2.cipig.net:10060",
        "contact": [
            {
                "email": "cipi@komodoplatform.com"
            },
            {
                "discord": "cipi#4502"
            }
        ]
    },
    {
        "url": "electrum2.cipig.net:20060",
        "protocol": "SSL",
        "contact": [
            {
                "email": "cipi@komodoplatform.com"
            },
            {
                "discord": "cipi#4502"
            }
        ],
        "ws_url": "electrum2.cipig.net:30060"
    },
    {
        "url": "electrum3.cipig.net:20060",
        "protocol": "SSL",
        "contact": [
            {
                "email": "cipi@komodoplatform.com"
            },
            {
                "discord": "cipi#4502"
            }
        ],
        "ws_url": "electrum3.cipig.net:30060"
    },
    {
        "url": "electrum1.cipig.net:20060",
        "protocol": "SSL",
        "contact": [
            {
                "email": "cipi@komodoplatform.com"
            },
            {
                "discord": "cipi#4502"
            }
        ],
        "ws_url": "electrum1.cipig.net:30060"
    }
]
''';

const dash_electrum = r'''
[
    {
        "url": "electrum2.cipig.net:10061",
        "contact": [
            {
                "email": "cipi@komodoplatform.com"
            },
            {
                "discord": "cipi#4502"
            }
        ]
    },
    {
        "url": "electrum3.cipig.net:10061",
        "contact": [
            {
                "email": "cipi@komodoplatform.com"
            },
            {
                "discord": "cipi#4502"
            }
        ]
    },
    {
        "url": "electrum1.cipig.net:10061",
        "contact": [
            {
                "email": "cipi@komodoplatform.com"
            },
            {
                "discord": "cipi#4502"
            }
        ]
    },
    {
        "url": "electrum3.cipig.net:20061",
        "protocol": "SSL",
        "contact": [
            {
                "email": "cipi@komodoplatform.com"
            },
            {
                "discord": "cipi#4502"
            }
        ],
        "ws_url": "electrum3.cipig.net:30061"
    },
    {
        "url": "electrum1.cipig.net:20061",
        "protocol": "SSL",
        "contact": [
            {
                "email": "cipi@komodoplatform.com"
            },
            {
                "discord": "cipi#4502"
            }
        ],
        "ws_url": "electrum1.cipig.net:30061"
    },
    {
        "url": "electrum2.cipig.net:20061",
        "protocol": "SSL",
        "contact": [
            {
                "email": "cipi@komodoplatform.com"
            },
            {
                "discord": "cipi#4502"
            }
        ],
        "ws_url": "electrum2.cipig.net:30061"
    }
]

''';

Map<String, String> fzm_chain_map = {
  "BTC": "bitcoin",
  "ETH": "ethereum",
  "TRX": "tron",
  "BTY": "bitcoin",
  "BNB": "binanceSmartChain",
};

class ElectrumNode {
  final String url;
  final String? protocol;
  final String? ws_url;

  ElectrumNode({required this.url, this.ws_url, this.protocol});

  factory ElectrumNode.fromJson(Map<String, dynamic> json) {
    return ElectrumNode(
      url: json['url'],
      ws_url: json['ws_url'],
      protocol: json['protocol'],
    );
  }
}
