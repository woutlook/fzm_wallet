// ignore_for_file: non_constant_identifier_names, constant_identifier_names

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:web3dart/web3dart.dart' as web3;
import 'package:blockchain_utils/utils/utils.dart';

import 'package:fwallet/api/tx.dart';
import 'package:fwallet/api/config.dart';

abstract class WApi {
  final ChainConfig config;
  WApi({required this.config});

  static Map<String, Token> coinMap = {};

  void useTestNet(bool use) {
    config.useTest = use;
  }

  Future<TxFee> getTxFee() async {
    throw UnimplementedError();
  }

  Future<double?> getBalance(String acc,
      {String? contractAddr, String? tokenSymbol}) async {
    throw UnimplementedError();
  }

  Future<List<Tx>> getTxList(
    String addr, {
    int page = 1,
    int limit = 100,
    int startBlock = 0,
    String? contractAddr,
    String? tokenSymbol,
  }) {
    throw UnimplementedError();
  }

  Future<web3.TransactionInformation?> getTx(String txHash) {
    throw UnimplementedError();
  }

  Future<String?> sendToken(String privateKey, TokenTxArgs args) {
    throw UnimplementedError();
  }

  Future<String?> callContract(String privateKey, ContractArgs args) {
    throw UnimplementedError();
  }

  Tuple<int, int> double2Int(double v) {
    int n = 0;
    while (v % 1 != 0) {
      v *= 10;
      n++;
    }
    return Tuple(v.toInt(), n);
  }

  BigInt getRealAmount(double amount, int decimals) {
    final tp = double2Int(amount);
    if (decimals <= tp.item2) {
      throw Exception('decimals error');
    }
    return BigInt.from(tp.item1) * BigInt.from(10).pow(decimals - tp.item2);
  }
}

class ContractArgs {
  String? abi;
  final String addr;
  String name;
  final String method;
  final List<dynamic> params;
  final double? fee; // priority fee

  ContractArgs(
      {this.abi,
      required this.addr,
      required this.name,
      required this.method,
      required this.params,
      this.fee});
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

    // 发出 HTTP POST 请求
    final http.Response response = await http.post(
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
