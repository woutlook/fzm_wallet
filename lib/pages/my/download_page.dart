import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'package:fzm_wallet/models/const/base_data.dart';
import 'package:fzm_wallet/widget/widgets.dart';
import 'package:fzm_wallet/models/const/app_colors.dart';
import 'package:fzm_wallet/utils/app_utils.dart';

class DownLoadPage extends StatelessWidget {
  const DownLoadPage({super.key});

  @override
  Widget build(BuildContext context) {
    return buildLayout(context, child: _build(context));
  }

  Widget _build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, '应用下载'),
      body: Container(
        margin: const EdgeInsets.only(top: 30, left: 10, right: 10),
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            const Image(
              image: AssetImage("assets/images/bg_share_er_code.png"),
              height: 400,
              fit: BoxFit.fill,
            ),
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 45),
                  color: Colors.white,
                  child: QrImageView(
                    data: BaseData.DOWNLOAD_URL,
                    size: 220,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Clipboard.setData(
                        const ClipboardData(text: BaseData.DOWNLOAD_URL));
                    toast("复制成功!");
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 30),
                    padding: const EdgeInsets.only(
                        left: 8, right: 8, top: 6, bottom: 7),
                    decoration: BoxDecoration(
                      color: AppColors.button,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Text(
                      "复制下载地址",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
