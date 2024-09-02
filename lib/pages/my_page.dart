import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fwallet/const/my_routers.dart';
import 'package:fwallet/utils/app_utils.dart';
import 'package:fwallet/widget/widgets.dart';
import 'package:install_plugin/install_plugin.dart';
import 'package:path_provider/path_provider.dart';

import '../widget/my_page_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<StatefulWidget> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  void initState() {
    super.initState();
  }

  // late AppLocalizations lang;

  // _updateLang() async {
  //   Locale myLocale = Localizations.localeOf(context);
  //   lang = await AppLocalizations.delegate.load(myLocale);
  // }
  Widget _buildCard() {
    return Card(
      color: Colors.white,
      shadowColor: Colors.grey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      elevation: 5,
      child: Padding(
        padding:
            const EdgeInsets.only(left: 50, right: 50, top: 20, bottom: 20),
        child: Row(
          children: [
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, MyRouter.CONTECTS_PAGE);
              },
              child: Column(
                children: [
                  Image.asset(
                    "images/my_contacts.png",
                    width: 30,
                    height: 30,
                  ),
                  const Text("联系人"),
                ],
              ),
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, MyRouter.MY_WALLETS_PAGE);
              },
              child: Column(
                children: [
                  Image.asset(
                    "images/my_message.png",
                    width: 30,
                    height: 30,
                  ),
                  const Text("消息中心"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final langs = AppLocalizations.of(context)!.str_lang;
    final updates = AppLocalizations.of(context)!.str_update;
    final abouts = AppLocalizations.of(context)!.str_about;
    return Scaffold(
      appBar: appBar(context, '我的', leading: const SizedBox()),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: _buildCard(),
          ),
          MyPageItem(
            "images/icon_share.png",
            AppLocalizations.of(context)!.str_share,
            onTap: () {
              Navigator.pushNamed(context, MyRouter.DOWNLOAD_PAGE);
            },
          ),
          MyPageItem(
            "images/icon_language.png",
            langs,
            onTap: () {
              Navigator.pushNamed(context, MyRouter.LANG_PAGE);
            },
          ),
          MyPageItem(
            "images/icon_download.png",
            updates,
            onTap: () {
              _showDownloadDialog();
            },
          ),
          MyPageItem(
            "images/icon_about.png",
            abouts,
            onTap: () {
              Navigator.pushNamed(context, MyRouter.ABOUT_PAGE);
            },
          ),
        ],
      ),
    );
  }

/*  AlertDialog(
  title: Text("版本升级"),
  // content: Text("当前进度：${(_progressValue * 100).toStringAsFixed(0)}%"),
  content: LinearProgressIndicator(value: 10),
  );*/

  Widget? getContent() {
    //var percent = "${(_progressValue * 100).toStringAsFixed(0)}%";
    if (_progressValue == 0.0) {
      return const Text("检测到有新版本，是否更新？");
    } else {
      return Row(
        children: [
          CircularProgressIndicator(value: _progressValue),
          const Padding(padding: EdgeInsets.only(left: 30)),
          Text("当前${(_progressValue * 100).toStringAsFixed(0)}%")
        ],
      );
    }
  }

  var _progressValue = 0.0;

  _showDownloadDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text("版本升级"),
              content: getContent(),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("暂不更新"),
                ),
                TextButton(
                  onPressed: () async {
                    var appDocDir = await getTemporaryDirectory();
                    String savePath =
                        "${appDocDir.path}/takeaway_phone_release_1.apk";
                    String fileUrl =
                        "https://youku-cpms-cdn.youku.com/apk/19babfbcea8e1838/latest.apk?spm=a2hcb.25507605.product.1&file=latest.apk";
                    await Dio().download(fileUrl, savePath,
                        onReceiveProgress: (count, total) {
                      final value = count / total;
                      if (_progressValue != value) {
                        //在flutter中弹框其实是一个新的页面，所以调用setState时，其实重新渲染的是弹框前的页面，
                        // 弹框本身的页面并不会进行重新渲染，需要调用弹框中的setState才行。
                        if (mounted) {
                          setState(() {
                            if (_progressValue < 1.0) {
                              _progressValue = count / total;
                            } else {
                              _progressValue = 0.0;
                            }
                          });
                        }
                      }
                    });
                    final res = await InstallPlugin.install(savePath);
                    Log.i(
                        "install apk ${res['isSuccess'] == true ? 'success' : 'fail:${res['errorMessage'] ?? ''}'}");
                  },
                  child: const Text("更新"),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
