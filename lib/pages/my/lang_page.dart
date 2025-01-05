import 'package:flutter/material.dart';
import 'package:fzm_wallet/models/const/base_data.dart';

import 'package:fzm_wallet/models/const/app_colors.dart';
import 'package:fzm_wallet/widget/widgets.dart';

class LangPage extends StatefulWidget {
  const LangPage({super.key});

  @override
  State<LangPage> createState() => _LangPageState();
}

class _LangPageState extends State<LangPage> {
  //切换语言
  changeLang(Locale locale) {
    setState(() {
      // MyApp.setLocale(context, locale);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(context, '语言'),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                var locale =
                    const Locale.fromSubtags(languageCode: BaseData.ZH);
                changeLang(locale);
                Navigator.pop(context);
              },
              child: Container(
                padding: const EdgeInsets.only(left: 16),
                height: 60,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "简体中文",
                    style: TextStyle(fontSize: 16, color: AppColors.gray33),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 16),
              height: 0.5,
              color: AppColors.line,
            ),
            InkWell(
              onTap: () {
                var locale =
                    const Locale.fromSubtags(languageCode: BaseData.EN);
                changeLang(locale);
                Navigator.pop(context);
              },
              child: Container(
                padding: const EdgeInsets.only(left: 16),
                height: 60,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "English",
                    style: TextStyle(fontSize: 16, color: AppColors.gray33),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 16),
              height: 0.5,
              color: AppColors.line,
            ),
          ],
        ));
  }
}
