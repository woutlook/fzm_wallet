// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'package:fwallet/utils/app_utils.dart';
import 'package:http/http.dart' as http;

/*
{
    "id": "ethereum",
    "symbol": "eth",
    "name": "Ethereum",
    "image": "https://coin-images.coingecko.com/coins/images/279/large/ethereum.png?1696501628",
    "current_price": 2757.47,
    "market_cap": 331691625289,
    "market_cap_rank": 2,
    "fully_diluted_valuation": 331691625289,
    "total_volume": 8448310723,
    "high_24h": 2789.27,
    "low_24h": 2735.41,
    "price_change_24h": -17.8480755484461,
    "price_change_percentage_24h": -0.6431,
    "market_cap_change_24h": -2164158706.86169,
    "market_cap_change_percentage_24h": -0.64823,
    "circulating_supply": 120298356.960273,
    "total_supply": 120298356.960273,
    "max_supply": null,
    "ath": 4878.26,
    "ath_change_percentage": -43.51775,
    "ath_date": "2021-11-10T14:24:19.604Z",
    "atl": 0.432979,
    "atl_change_percentage": 636270.80192,
    "atl_date": "2015-10-20T00:00:00.000Z",
    "roi": {
      "times": 56.3309314321417,
      "currency": "btc",
      "percentage": 5633.09314321418
    },
    "last_updated": "2024-08-26T00:28:02.200Z"
  }
*/
// https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&ids=ethereum

class Roi {
  final double times;
  final String currency;
  final double percentage;

  Roi({
    required this.times,
    required this.currency,
    required this.percentage,
  });

  factory Roi.fromJson(Map<String, dynamic> json) {
    return Roi(
      times: json['times'],
      currency: json['currency'],
      percentage: json['percentage'],
    );
  }
}

class MarketInfo {
  final String id;
  final String symbol;
  final String name;
  final String image;
  final double current_price;
  final double market_cap;
  final int market_cap_rank;
  final double total_volume;
  final double high_24h;
  final double low_24h;
  final double price_change_24h;
  final double price_change_percentage_24h;
  final double market_cap_change_24h;
  final double market_cap_change_percentage_24h;
  final double circulating_supply;
  final double total_supply;
  final double max_supply;
  final double ath;
  final double ath_change_percentage;
  final String ath_date;
  final double atl;
  final double atl_change_percentage;
  final String atl_date;
  final Roi roi;
  final String last_updated;

  MarketInfo({
    required this.id,
    required this.symbol,
    required this.name,
    required this.image,
    required this.current_price,
    required this.market_cap,
    required this.market_cap_rank,
    required this.total_volume,
    required this.high_24h,
    required this.low_24h,
    required this.price_change_24h,
    required this.price_change_percentage_24h,
    required this.market_cap_change_24h,
    required this.market_cap_change_percentage_24h,
    required this.circulating_supply,
    required this.total_supply,
    required this.max_supply,
    required this.ath,
    required this.ath_change_percentage,
    required this.ath_date,
    required this.atl,
    required this.atl_change_percentage,
    required this.atl_date,
    required this.roi,
    required this.last_updated,
  });

  factory MarketInfo.fromJson(Map<String, dynamic> json) {
    return MarketInfo(
      id: json['id'],
      symbol: json['symbol'],
      name: json['name'],
      image: json['image'],
      current_price: json['current_price'],
      market_cap: json['market_cap'],
      market_cap_rank: json['market_cap_rank'],
      total_volume: json['total_volume'],
      high_24h: json['high_24h'],
      low_24h: json['low_24h'],
      price_change_24h: json['price_change_24h'],
      price_change_percentage_24h: json['price_change_percentage_24h'],
      market_cap_change_24h: json['market_cap_change_24h'],
      market_cap_change_percentage_24h:
          json['market_cap_change_percentage_24h'],
      circulating_supply: json['circulating_supply'],
      total_supply: json['total_supply'],
      max_supply: json['max_supply'],
      ath: json['ath'],
      ath_change_percentage: json['ath_change_percentage'],
      ath_date: json['ath_date'],
      atl: json['atl'],
      atl_change_percentage: json['atl_change_percentage'],
      atl_date: json['atl_date'],
      roi: Roi.fromJson(json['roi']),
      last_updated: json['last_updated'],
    );
  }
}

Future<MarketInfo?> getMarketInfo(String coingeckoId) async {
  var url =
      'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&ids=$coingeckoId';
  var response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    var json = jsonDecode(response.body);
    return MarketInfo.fromJson(json[0]);
  } else {
    Log.e('Failed to load market info');
    return null;
  }
}
