// ignore_for_file: constant_identifier_names

import 'package:dio/dio.dart';

  const String BASE_URL = 'https://www.mydao.plus';
  const String GO_URL = 'https://www.mydao.plus/549788';

  //  requestBodyStr: {'names':['BTC,btc','ETH,ethereum','TRX,trx','BNB,bnb','USDT,ethereum','USDT,trx','USDT,bnb']}
  const String COIN_LIST = '/v2api/interface/wallet-coin';
  const String EXS = '/v2api/interface/explore';
  const String TXFEE = '/goapi/interface/fees/recommended';
  const String SEARCH_COIN = '/v2api/interface/wallet-coin/search';
  const String RECOMMEND_COIN = '/v2api/interface/recommend-coin';
  const String EXPLORE_CATEGORY = '/v2api/interface/explore/category';
  const String SUPPORTED_CHAIN = '/v2api/interface/supported-chain';
  const String NOTICE_LIST = '/v2api/interface/notice/list';
  const String NOTICE_DETAIL = '/v2api/interface/notice/detail';

  const String DNS = '$BASE_URL/dns';
  const String UPDATE = '$BASE_URL/update';

  const String BTY_ETH_NODE = GO_URL;

class Http {
  static Dio? _dio;

  static Http of({String? baseUrl}) {
    return Http._initDio(baseUrl: baseUrl);
  }

  Http._initDio({String? baseUrl}) {
    if (_dio == null) {
      _dio = Dio();
      Iterable<Interceptor> iterable = [
        LogInterceptor(requestBody: true, responseBody: true),
      ];
      _dio?.interceptors.add(InterceptorsWrapper(
        onRequest: (options, handler) {
          // 在请求被发送之前做一些事情
          // 设置公共header
          options.headers.addAll({'FZM-PLATFORM-ID': '1'});
          // 设置公共参数
          //options.queryParameters.addAll({'token': 'your_token'});
          return handler.next(options); // 必须调用 next 方法
        },
        onResponse: (response, handler) {
          // 在响应被处理之前做一些事情
          return handler.next(response); // 必须调用 next 方法
        },
        onError: (DioException e, handler) {
          // 在请求发生错误时做一些事情
          return handler.next(e); // 必须调用 next 方法
        },
      ));
      _dio?.interceptors.addAll(iterable);
    }
    var options = BaseOptions(
      baseUrl: baseUrl ?? BASE_URL,
      // connectTimeout: const Duration(seconds: 10),
      // sendTimeout: const Duration(seconds: 5),
      // receiveTimeout: const Duration(seconds: 5),
      headers: {
        // 'AppType': 'TPOS',
        // 'Content-Type': 'application/json',
        // 'Accept': 'application/json',
        // 'Fzm-Request-Source': 'wallet',
        // 'FZM-REQUEST-OS': 'android',
        'FZM-PLATFORM-ID': '1',
      },
    );

    _dio?.options = options;
  }

  //fzm-platform-id

  Future<HttpResponse<dynamic>> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    var response = await _dio!.get(path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress);
    return parse(response);
  }

  Future<HttpResponse<dynamic>> post(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    var response = await _dio!.post(path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress);

    return parse(response);
  }
}

HttpResponse parse(Response response) {
  //真正的解析
  var code = response.data["code"];
  var data = response.data["data"];
  var result = response.data["result"];
  var error = response.data["error"];
  if (code == 0 || code == null) {
    //赋值给构造函数
    return HttpResponse.success(data ?? result);
  } else {
    return HttpResponse.failure(error ?? "$code");
  }
}

// 注册返回：{data: null, code: -1}
class HttpResponse<T> {
  bool ok = false;
  T? data;
  String? error;

  //this.data是赋值简写
  HttpResponse.success(this.data) {
    ok = true;
  }
  //完整写法
  // HttpResponse.success(T? data) {
  //     this.data = data;
  //     ok = true;
  //   }

  HttpResponse.failure(this.error) {
    ok = false;
  }
}

// data class DNSResponse<out T>(val code: String?, val message: String?, val status: String?,val data:T?)

class DNSResponse<T> {
  String? code;
  String? message;
  String? status;
  T? data;

  DNSResponse({this.code, this.message, this.status, this.data});

  factory DNSResponse.fromJson(Map<String, dynamic> json) {
    return DNSResponse(
      code: json['code'],
      message: json['message'],
      status: json['status'],
      data: json['data'],
    );
  }
}
