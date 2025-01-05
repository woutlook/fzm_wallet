import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';
import 'package:flutter_socks_proxy/socks_proxy.dart';

http.Client httpClient() {
  if (kIsWeb) {
    return http.Client();
  }
  final client = createProxyHttpClient()
    ..findProxy = (uri) {
      // if (defaultTargetPlatform == TargetPlatform.android) {
      //   return 'SOCKS5 10.0.2.2:1080';
      // } else {
      return 'SOCKS5 127.0.0.1:1080';
      // }
    };
  return IOClient(client);
}

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

    final client = httpClient();

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
