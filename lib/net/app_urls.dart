// ignore_for_file: constant_identifier_names

class AppUrls {
  // static const String BASE_URL = 'https://www.mydao.plus';
  // static const String GO_URL = 'https://www.mydao.plus/549788';

  // //  requestBodyStr: {'names':['BTC,btc','ETH,ethereum','TRX,trx','BNB,bnb','USDT,ethereum','USDT,trx','USDT,bnb']}
  // static const String COIN_LIST = '/v2api/interface/wallet-coin';
  // static const String EXS = '/v2api/interface/explore';
  // static const String TXFEE = '/goapi/interface/fees/recommended';
  // static const String SEARCH_COIN = '/v2api/interface/wallet-coin/search';
  // static const String RECOMMEND_COIN = '/v2api/interface/recommend-coin';
  // static const String EXPLORE_CATEGORY = '/v2api/interface/explore/category';
  // static const String SUPPORTED_CHAIN = '/v2api/interface/supported-chain';
  // static const String NOTICE_LIST = '/v2api/interface/notice/list';
  // static const String NOTICE_DETAIL = '/v2api/interface/notice/detail';

  // static const String DNS = '$BASE_URL/dns';
  // static const String UPDATE = '$BASE_URL/update';

  // static const String BTY_ETH_NODE = GO_URL;

  // static const String TX_COUNT = '/v2api/interface/tx-history/count';
  // static const String GAS_PRICE = '/v2api/interface/tx-history/gas-price';
  // static const String SEND_TX_RAW = '/v2api/interface/tx-history/send-raw';
  // static const String SEND_TX = '/v2api/interface/tx-history/send-raw';
}
/*
    @GET('goapi/interface/fees/recommended')
    suspend fun getMinerList(
        @Query('name') name: String
    ): HttpResponse<Miner>

    @POST('v2api/interface/wallet-coin')
    suspend fun getCoinList(@Body body: Map<String, Any>): HttpResponse<List<Coin>>

    @POST('v2api/interface/wallet-coin/search')
    suspend fun searchCoinList(@Body body: RequestBody): HttpResponse<List<Coin>>


    @POST('v2api/interface/recommend-coin')
    suspend fun getTabData(): HttpResponse<List<AddCoinTabBean>>

    @GET('v2api/interface/explore')
    suspend fun getExploreList(): HttpResponse<List<ExploreBean>>

    @GET('v2api/interface/explore/category')
    suspend fun getExploreCategory(@Query('id') id: Int): HttpResponse<List<ExploreBean>>

    @GET('v2api/interface/supported-chain')
    suspend fun getSupportedChain(): HttpResponse<List<Coin>>


    //获取公告
    @GET('v2api/interface/notice/list')
    suspend fun getNoticeList(
        @Query('page') page: Int,
        @Query('limit') limit: Int,
        @Query('type') type: Int
    ): HttpResponse<Notices>

    //获取公告详情
    @GET('v2api/interface/notice/detail')
    suspend fun getNoticeDetail(
        @Query('id') id: Int
    ): HttpResponse<Notice>

    /**
     * DNS域名查询
     * @param type 记录类型：1-地址类型 2-身份类型 9-自定义，默认为地址，只有地址类型支持反向解析，其他不支持
     * @param key 解析关键字，正向为域名，反向为地址或取值
     * @param kind 正向(0)/反向(1)解析，默认正向:域名查询地址
     */
    @GET(IPConfig.DNS)
    suspend fun getDNSResolve(
        @Query('type') type: Int,
        @Query('key') key: String,
        @Query('kind') kind: Int
    ): DNSResponse<List<String>>

    @GET(IPConfig.UPDATE_JSON)
    suspend fun getUpdate(): HttpResponse<AppVersion>


    @POST(IPConfig.BTY_ETH_NODE)
    suspend fun getTransactionCount(@Body body: RequestBody): GoResponse<String>
    @POST(IPConfig.BTY_ETH_NODE)
    suspend fun getGasPrice(@Body body: RequestBody): GoResponse<String>
    @POST(IPConfig.BTY_ETH_NODE)
    suspend fun sendRawTransaction(@Body body: RequestBody): GoResponse<String>
    @POST(IPConfig.BTY_API_NODE)
    suspend fun sendTransaction(@Body body: RequestBody): GoStrResponse<String>


    @POST
    suspend fun queryTxHistoryCount(
        @Body body: RequestBody,
        @Url url: String = UrlConfig.GO_URL
    ): GoResponse<String>


    @POST
    suspend fun queryTxHistoryDetail(
        @Body body: RequestBody,
        @Url url: String = UrlConfig.GO_URL
    ): GoResponse<TxTotal>
}
*/