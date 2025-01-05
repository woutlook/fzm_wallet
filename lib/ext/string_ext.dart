import 'package:fzm_wallet/utils/app_utils.dart';

extension StringExt on String {
  List<String> mnemList() {
    List<String> result = [];
    List<String> list = split(' ');
    for (var item in list) {
      if (item.isNotEmpty) {
        result.add(item);
      }
    }
    return result;
  }

  String chineseMnemFromByOrigin({bool newLine = false}) {
    StringBuffer buffer = StringBuffer();
    List<String> list = mnemList();
    Log.i("长度：${list.length}");

    for (var index = 0; index < list.length; index++) {
      buffer.write(list[index]);
      if ((index + 1) % 3 == 0) {
        if ((index + 1) % 12 == 0 && newLine && index != list.length - 1) {
          buffer.write('\n');
        } else {
          buffer.write('   ');
        }
      }
    }
    return buffer.toString();
  }
}
