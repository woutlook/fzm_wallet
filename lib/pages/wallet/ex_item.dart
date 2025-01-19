import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fzm_wallet/models/ex_bean.dart';
import 'package:fzm_wallet/models/const/app_colors.dart';
import 'package:fzm_wallet/pages/webview_page.dart';
import 'package:fzm_wallet/utils/app_utils.dart';

class ExItemPage extends ConsumerWidget {
  final ExItem ex;

  const ExItemPage(this.ex, {super.key});

  @override
  Widget build(BuildContext context, ref) {
    String logo = '';
    if (ex.id == 1) {
      logo = 'assets/icons/dd069dfef3b7d7af31cf75d610b2a109.png';
    } else if (ex.id == 2) {
      logo = 'assets/icons/8568e340ae44fcd01bddf84a3eb2d7aa.png';
    } else if (ex.id == 3) {
      logo = 'assets/icons/08712750389ab6c92deae50b54fc0012.png';
    } else {
      throw 'not support';
    }
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(logo, width: 40, height: 40),
            const SizedBox(width: 10),
            Text(
              '${ex.name}',
              style: TextStyle(
                color: AppColors.gray33,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 50),
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(), // 防止嵌套滚动
              shrinkWrap: true,
              itemCount: ex.apps!.length,
              itemBuilder: (context, index) {
                final app = ex.apps![index];
                return Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: InkWell(
                    onTap: () {
                      final url = app.appUrl;
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return WebPage(url: url ?? '');
                      }));
                      toast(app.name ?? "");
                    },
                    child: Text(
                      app.name ?? "",
                      style: TextStyle(color: Colors.blue, fontSize: 15),
                      overflow: TextOverflow.ellipsis, // 文本溢出显示省略号
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
