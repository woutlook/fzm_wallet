// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import '../bean/coin_bean.dart';

class BaseData {
  static const String CHANNEL_WALLET = "channel_wallet";
  static const String DOWNLOAD_URL = "https://d.mydao.plus";

  static const String ZH = 'zh';
  static const String EN = 'en';

  static final List<CoinBean> DEFAULT_COINS = [
    CoinBean(
        netId: 89,
        name: "BTC",
        chain: "BTC",
        nickname: "比特币",
        platform: "btc",
        treaty: 1,
        added: true),
    CoinBean(
        netId: 90,
        name: "ETH",
        chain: "ETH",
        nickname: "以太坊",
        platform: "ethereum",
        treaty: 1,
        added: true),
    CoinBean(
        netId: 1,
        name: "TRX",
        chain: "TRX",
        nickname: "波场",
        platform: "trx",
        treaty: 1,
        added: true),
    CoinBean(
        netId: 154,
        name: "BTY",
        chain: "BTY",
        nickname: "比特元",
        platform: "bty",
        treaty: 1,
        added: true),
    CoinBean(
        netId: 641,
        name: "BNB",
        chain: "BNB",
        nickname: "币安",
        platform: "bnb",
        treaty: 1,
        added: true),
  ];
  /*
  
  */
  static const String CHAIN_ID_ETH = "eip155:1";
  static const String CHAIN_ID_BNB = "eip155:56";
  static const String CHAIN_ID_BTY = "eip155:2999";
  static const int CHAIN_ID_ETH_L = 1;
  static const int CHAIN_ID_BNB_L = 56;
  static const int CHAIN_ID_BTY_L = 2999;
  static const int GAS_OUT = 21000;
  static const String CHAIN_NET = "chainNet";
  static const String NET_ETH = "Ethereum";
  static const String NET_BNB = "BNB Smart Chain";
  static const String NET_BTY = "BitYuan Mainnet";
  static const double LOW = 1.5;
  static const double MIDDLE = 2.0;
  static const double HIGH = 3.0;

  static const Map<String, int> CHAIN_MAPS_LL = {
    CHAIN_ID_ETH: CHAIN_ID_ETH_L,
    CHAIN_ID_BNB: CHAIN_ID_BNB_L,
    CHAIN_ID_BTY: CHAIN_ID_BTY_L,
  };

  static const Map<String, int> CHAIN_MAPS = {
    "ETH": CHAIN_ID_ETH_L,
    "BNB": CHAIN_ID_BNB_L,
    "BTY": CHAIN_ID_BTY_L,
  };

  static const Map<String, String> CHAIN_ID_MAPS = {
    CHAIN_ID_ETH: "ETH",
    CHAIN_ID_BNB: "BNB",
    CHAIN_ID_BTY: "BTY",
  };

  static const Map<int, String> CHAIN_ID_MAPS_L = {
    CHAIN_ID_ETH_L: "ETH",
    CHAIN_ID_BNB_L: "BNB",
    CHAIN_ID_BTY_L: "BTY",
  };

  static const Map<int, String> NET_MAPS = {
    CHAIN_ID_ETH_L: NET_ETH,
    CHAIN_ID_BNB_L: NET_BNB,
    CHAIN_ID_BTY_L: NET_BTY,
  };
}
