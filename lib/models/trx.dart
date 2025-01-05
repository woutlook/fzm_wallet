import 'package:fzm_wallet/models/tx.dart';
import 'package:fzm_wallet/models/wapi.dart';

class TRXWApi extends WApi {
  TRXWApi({required super.config});

  @override
  Future<Fee> getFee({int? txSize}) async {
    return Fee();
  }

  @override
  Future<List<Tx>> getTxList(
    String addr, {
    int page = 1,
    int limit = 100,
    int startBlock = 0,
    String? chain,
    String? contractAddr,
    String? tokenSymbol,
  }) async {
    return [];
  }

  @override
  Future<double?> getBalance(String who,
      {String? contractAddr, String? tokenSymbol}) async {
    return 0;
  }

  @override
  Future<Tx?> sendToken(
      {required String privateKey, required TokenTxArgs args}) async {
    return null;
  }
}
