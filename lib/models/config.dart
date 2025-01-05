// ignore_for_file: constant_identifier_names, non_constant_identifier_names
import 'package:blockchain_utils/blockchain_utils.dart' as chain_utils;

class ChainConfig {
  String? rpcUrl;
  String? scanUrl;
  String? scanApiUrl;
  String? scanApiKey;
  int? chainId;
  String name;
  final String nativeToken;
  int decimals = 18;
  String? electrumJson;
  bool useTest = false;

  ChainConfig({
    this.rpcUrl,
    this.scanUrl,
    this.scanApiUrl,
    this.chainId,
    required this.nativeToken,
    this.decimals = 18,
    required this.name,
    this.scanApiKey,
    this.electrumJson,
    this.useTest = false,
  });

  factory ChainConfig.fromJson(Map<String, dynamic> json) {
    return ChainConfig(
      rpcUrl: json['rpcUrl'],
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
      'rpcUrl': rpcUrl,
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
  rpcUrl: 'https://mainnet.infura.io/v3/1c177df366ef47b689e8b84ee6c7297d',
  scanUrl: "https://etherscan.io/",
  scanApiUrl: 'https://api.etherscan.io/api',
  scanApiKey: 'UVTE4FNDB2EPUB758II1KXDFGY4RVP6FRC',
  chainId: 1,
  name: chain_utils.Bip44Coins.ethereum.name,
  nativeToken: "ETH",
  decimals: 18,
);

final bscConfig = ChainConfig(
  rpcUrl: 'https://bsc-mainnet.infura.io/v3/1c177df366ef47b689e8b84ee6c7297d',
  scanUrl: 'https://bscscan.com/',
  scanApiUrl: 'https://api.bscscan.com/api',
  scanApiKey: 'WAAUR4ES8JAVQ74ZWDR51WGQQE4PC3EWFN',
  chainId: 56,
  name: chain_utils.Bip44Coins.binanceSmartChain.name,
  nativeToken: 'BNB',
  decimals: 18,
);

final tronConfig = ChainConfig(
  rpcUrl: 'https://api.trongrid.io/jsonrpc',
  scanUrl: 'https://tronscan.org/',
  scanApiUrl: 'https://apilist.tronscan.org/api',
  scanApiKey: '0fccd20f-990a-40c1-9cfb-f0baa43b7c18',
  chainId: -1,
  name: chain_utils.Bip44Coins.tron.name,
  nativeToken: 'TRX',
  decimals: 6,
);

final btyConfig = ChainConfig(
  rpcUrl: 'https://mainnet.bityuan.com/api',
  scanUrl: 'https://mainnet.bityuan.com',
  name: 'bityuan',
  nativeToken: 'BTY',
  decimals: 8,
);

final yccConfig = ChainConfig(
  rpcUrl: 'https://yuan.org/api',
  scanUrl: 'https://www.yuan.org/blockChainBrowser',
  name: 'yuanChain',
  nativeToken: 'YCC',
  decimals: 8,
  chainId: 999,
);
