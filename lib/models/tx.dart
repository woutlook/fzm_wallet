import 'package:fzm_wallet/models/coin.dart';

class Tx {
  final String hash;
  final String from;
  final String to;
  final double value;
  final String chain;
  final String tokenSymbol;
  final String tokenName;
  final String? contractAddr;
  final int decimals;
  final int status;
  final int? blockNumber;
  final int? timestamp;
  // final double? gasPrice;
  // final double? gas;
  final double? fee;
  final String? note;

  Tx({
    required this.hash,
    required this.from,
    required this.to,
    required this.value,
    required this.chain,
    required this.tokenSymbol,
    required this.tokenName,
    this.status = 0,
    this.contractAddr,
    this.decimals = 18,
    this.blockNumber,
    this.timestamp,
    // this.gasPrice, // ETH
    // this.gas, // ETH
    this.fee, // BTC
    this.note,
  });

  Map<String, dynamic> toJson() {
    return {
      'hash': hash,
      'from': from,
      'to': to,
      'value': value,
      'chain': chain,
      'tokenSymbol': tokenSymbol,
      'tokenName': tokenName,
      'decimals': decimals,
      'status': status,
      'contractAddr': contractAddr,
      'blockNumber': blockNumber,
      'timestamp': timestamp,
      // 'gasPrice': gasPrice,
      // 'gas': gas,
      'fee': fee,
      'note': note,
    };
  }

  factory Tx.fromJson(Map<String, dynamic> json) {
    return Tx(
      hash: json['hash'],
      from: json['from'],
      to: json['to'],
      value: json['value'],
      chain: json['chain'],
      tokenSymbol: json['tokenSymbol'],
      tokenName: json['tokenName'],
      timestamp: json['timestamp'],
      status: json['status'],
      // gasPrice: json['gasPrice'],
      // gas: json['gas'],
      decimals: json['decimals'],
      note: json['note'],
      contractAddr: json['contractAddr'],
    );
  }

  factory Tx.fromEthereum(Map<String, dynamic> json, {required String chain}) {
    final from = json['from'];
    final to = json['to'];
    return Tx(
      hash: json['hash'],
      from: from,
      to: to,
      value: json['value'],
      chain: chain,
      tokenSymbol: json['tokenSymbol'],
      tokenName: json['tokenName'],
      decimals: json['decimals'],
      status: 0,
      // gas: json['gasUsed'],
      // gasPrice: json['gasPrice'],
      contractAddr: json['contractAddr'],
      blockNumber: json['blockNumber'],
      timestamp: json['timestamp'],
    );
  }

/*
    "data": [
    {
      "amount": "100700000000000000000",
      "status": 0,
      "approval_amount": "0",
      "block_timestamp": 1697559888000,
      "block": 55642816,
      "from": "TV6MuMXfmLbBqPZvBHdwFsDnQeVfnmiuSi",
      "to": "TRbGB6GSMtxAMd2vAkXgoUR62qgXt9Ac9e",
      "hash": "22d6b3a783b4a599c19f7e54b48fe004466d407d47a82f61e2ecc01899fe5295",
      "contract_address": "TUpMhErZL2fhh4sVNULAbNKLokS4GjC1F4",
      "confirmed": 1,
      "contract_type": "TriggerSmartContract",
      "contractType": 31,
      "revert": 0,
      "contract_ret": "SUCCESS",
      "final_result": "SUCCESS",
      "event_type": "Transfer",
      "issue_address": "TRX6Q82wMqWNbCCiLqejbZe43wk1h1zJHm",
      "decimals": 18,
      "token_name": "TrueUSD",
      "id": "TUpMhErZL2fhh4sVNULAbNKLokS4GjC1F4",
      "direction": 1
    },
  */
  factory Tx.fromTron(Map<String, dynamic> json,
      {required String tokenSymbol}) {
    final from = json['from'];
    final to = json['to'];
    return Tx(
      hash: json['hash'],
      from: from,
      to: to,
      value: json['amount'],
      chain: 'tron',
      tokenSymbol: tokenSymbol,
      tokenName: json['token_name'],
      decimals: json['decimals'],
      contractAddr: json['contract_address'],
      timestamp: json['block_timestamp'],
      blockNumber: json['block'],
      status: 0,
    );
  }

  // factory Tx.fromBitcoin(Map<String, dynamic> json,
  //     {required String addr,
  //     required String chain,
  //     String tokenSymbol = 'BTC',
  //     String tokenName = 'Bitcoin'}) {
  //   final inputList = json['inputs'] as List;
  //   final fromList = inputList.map((e) => e['prev_out']['addr']).toList();
  //   final fromValueList = inputList.map((e) => e['prev_out']['value']).toList();
  //   final toList = (json['out'] as List).map((e) => e['addr']).toList();
  //   final toValueList = (json['out'] as List).map((e) => e['value']).toList();
  //   final from = fromList.contains(addr) ? addr : fromList[0];
  //   final to = toList.contains(addr) ? addr : toList[0];
  //   final fromValue =
  //       fromList.contains(addr) ? fromValueList[fromList.indexOf(addr)] : 0;
  //   final toValue =
  //       toList.contains(addr) ? toValueList[toList.indexOf(addr)] : 0;
  //   BigInt value = BigInt.zero;
  //   if (from != to) {
  //     if (from == addr) {
  //       value = BigInt.from(fromValue);
  //     } else {
  //       value = BigInt.from(toValue);
  //     }
  //   } else {
  //     value = BigInt.from(toValue - fromValue);
  //     if (from == addr) {
  //       value = -value;
  //     }
  //   }

  //   return Tx(
  //     hash: json['hash'],
  //     from: from,
  //     to: to,
  //     value: value,
  //     chain: chain,
  //     tokenSymbol: tokenSymbol,
  //     tokenName: tokenName,
  //     timestamp: json['time'],
  //     blockNumber: json['block_height'],
  //     fee: BigInt.parse(json['fee']),
  //     status: 0,
  //   );
  // }
}

// class Token {
//   final String name;
//   final String symbol;
//   final int decimals;
//   final String chain; // which chain the token belongs to
//   bool isNative = false;
//   String? contract;
//   String? icon;
//   String? coingeckoId; // for market price

//   Token({
//     required this.name,
//     required this.symbol,
//     required this.decimals,
//     required this.chain,
//     this.isNative = false,
//     this.contract,
//     this.icon,
//     this.coingeckoId,
//   });

//   factory Token.fromJson(Map<String, dynamic> json) {
//     return Token(
//       name: json['name'],
//       symbol: json['symbol'],
//       decimals: json['decimals'],
//       chain: json['chain'],
//       contract: json['contract'] ??
//           json['address'] ??
//           json['contractAddress'] ??
//           json['contract_addr'] ??
//           json['contractAddr'],
//       icon: json['icon'],
//       coingeckoId: json['coingeckoId'] ?? json['id'],
//     );
//   }

// factory Token.fromCoinBean(CoinBean coin) {
//   final chain = fzm_chain_map[coin.chain!];

//   return Token(
//     name: coin.name!,
//     symbol: coin.name!,
//     decimals: 18,
//     chain: chain!,
//     contract: coin.contract,
//     icon: coin.icon,
//   );
// }
// }

class TokenTxArgs {
  final Coin token;
  final String? from;
  final String to;
  final double amount;
  double? fee; // priority fee
  String? note;

  TokenTxArgs({
    required this.token,
    this.from,
    required this.to,
    required this.amount,
    this.fee,
    this.note,
  });
}

enum MnemLangType { english, chinese }

// btc address format: 1 + 20 bytes hash + 4 bytes checksum
// bip44, 49, 84, 86:  1xxx...., 3xxx...., bc1xxx...., bc1pxxx....

// class CoingeckoCoin {
//   String id;
//   String symbol;
//   String name;
//   double? price;
//   int? decimals;

//   CoingeckoCoin({required this.id, required this.symbol, required this.name});

//   factory CoingeckoCoin.fromJson(Map<String, dynamic> json) {
//     return CoingeckoCoin(
//       id: json['id'],
//       symbol: json['symbol'],
//       name: json['name'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'symbol': symbol,
//       'name': name,
//     };
//   }
// }

//////////////////////////////
// https://tokens.pancakeswap.finance/pancakeswap-extended.json
// https://chainid.network/chains.json
// https://tokens.coingecko.com/uniswap/all.json

// https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=200&page=1&sparkline=false
// https://api.coingecko.com/api/v3/asset_platforms
// https://api.coingecko.com/api/v3/coins/ethereum
// https://api.coingecko.com/api/v3/simple/price?vs_currencies=usd&ids=ethereum&precision=2
// https://api.coingecko.com/api/v3/nfts/list
//////////////////////////////
///
/// tx priority fee

class Fee {
  final String? name;
  final double? high;
  final double? low;
  final double? average;
  final double? base;

  Fee({
    this.name = '',
    this.high = 0.0,
    this.low = 0.0,
    this.average = 0.0,
    this.base = 0.0,
  });

  factory Fee.fromJson(Map<String, dynamic> json) {
    return Fee(
      name: json["name"],
      high: json["high"],
      low: json["low"],
      average: json["average"],
      base: json["base"] ?? '0.0',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "high": high,
      "low": low,
      "average": average,
      'base': base,
    };
  }
}
