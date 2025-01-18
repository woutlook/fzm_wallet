// ignore_for_file: constant_identifier_names

import 'dart:convert';
import 'package:http/http.dart' as http;

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

// data class DNSResponse<out T>(val code: String?, val message: String?, val status: String?,val data:T?)
//
// class DNSResponse<T> {
//   String? code;
//   String? message;
//   String? status;
//   T? data;

//   DNSResponse({this.code, this.message, this.status, this.data});

//   factory DNSResponse.fromJson(Map<String, dynamic> json) {
//     return DNSResponse(
//       code: json['code'],
//       message: json['message'],
//       status: json['status'],
//       data: json['data'],
//     );
//   }
// }

class HttpClient {
  static HttpClient? _instance;
  static const String baseUrl = BASE_URL;

  static HttpClient get instance {
    _instance ??= HttpClient._();
    return _instance!;
  }

  HttpClient._();

  Map<String, String> get _headers => {
        'FZM-PLATFORM-ID': '1',
        // 'Content-Type': 'application/json',
      };

  Future<T> get<T>(String path, {Map<String, dynamic>? parameters}) async {
    if (parameters != null) {
      path +=
          '?${parameters.entries.map((e) => '${e.key}=${e.value}').join('&')}';
    }
    final response = await http.get(
      Uri.parse(baseUrl + path),
      headers: _headers,
    );
    return _handleResponse<T>(response);
  }

  Future<T> post<T>(String path, {Map<String, dynamic>? body}) async {
    final response = await http.post(
      Uri.parse(baseUrl + path),
      headers: _headers,
      body: body != null ? json.encode(body) : null,
    );
    return _handleResponse<T>(response);
  }

  T _handleResponse<T>(http.Response response) {
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final code = json["code"];
      final data = json["data"];
      final result = json["result"];
      final error = json["error"];
      if (code == 0 || code == null) {
        return data ?? result as T;
      } else {
        throw Exception('请求失败: $error');
      }
    }
    throw Exception('请求失败: ${response.statusCode}');
  }
}

final httpClient = HttpClient.instance;

class JsonRpcClient {
  final String url;

  JsonRpcClient(this.url);

  Future<Map<String, dynamic>> callMethod(String method, List<dynamic> params,
      {int id = 1}) async {
    // 构造 JSON-RPC 请求体
    final Map<String, dynamic> requestBody = {
      'method': method,
      'params': params,
      'id': id,
      'jsonrpc': '2.0',
    };

    // 将请求体转为 JSON 字符串
    final String jsonString = jsonEncode(requestBody);

    final client = http.Client();

    // 发出 HTTP POST 请求
    final http.Response response = await client.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonString,
    );

    // 检查请求结果
    if (response.statusCode == 200) {
      // 成功响应
      return jsonDecode(response.body);
    } else {
      // 处理错误响应
      throw Exception('Error: ${response.statusCode}');
    }
  }
}
