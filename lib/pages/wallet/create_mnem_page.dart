import 'package:flutter/material.dart';

import 'package:fzm_wallet/models/const/app_colors.dart';
import 'package:fzm_wallet/models/const/my_routers.dart';
import 'package:fzm_wallet/ext/string_ext.dart';
import 'package:fzm_wallet/models/const/wallet_color.dart';
import 'package:fzm_wallet/models/wapi.dart';
import 'package:fzm_wallet/widget/widgets.dart';

class CreateMnemPage extends StatefulWidget {
  const CreateMnemPage({super.key});

  @override
  State<CreateMnemPage> createState() => _CreateMnemPageState();
}

class _CreateMnemPageState extends State<CreateMnemPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  var _tabPosition = 0;
  late String _chineseMnem = "";
  late String _englishMnem = "";

  void createMnem(int type) async {
    final value = walletApi.createMnem(type);
    setState(() {
      if (type == 0) {
        _englishMnem = value;
      } else {
        _chineseMnem = value;
      }
    });
  }

  String getMnem() {
    if (_tabPosition == 0) {
      return _chineseMnem.chineseMnemFromByOrigin(newLine: true);
    } else {
      return _englishMnem;
    }
  }

  @override
  void initState() {
    super.initState();
    createMnem(0);
    createMnem(1);
    _tabController =
        TabController(length: 2, initialIndex: _tabPosition, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return buildLayout(context, child: _build(context));
  }

  Widget _build(BuildContext context) {
    Map<String, dynamic>? arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    String? name = arguments?["name"];
    String? password = arguments?["password"];

    return Scaffold(
      appBar: appBar(context, '创建助记词'),
      body: Container(
        padding: const EdgeInsets.all(20),
        color: AppColors.gray2b,
        child: Column(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  _buildMenmCart(),
                  const Padding(
                    padding: EdgeInsets.only(top: 35, left: 16, right: 16),
                    child: Text(
                      "提示：请勿直接截图保存！如果有人获取你的助记词将直接获取您的资产！\n\n正确做法：\n\n方式一：使用另一离线设备，拍照保存。\n方式二：正确抄写助记词，存放在安全的地方。\n\n点击［开始备份］后，需要对你记住的助记词进行校验。",
                      style: TextStyle(color: Colors.white, fontSize: 13),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            _buildButtons(name, password),
          ],
        ),
      ),
    );
  }

  Widget _buildMenmCart() {
    return Container(
      padding: const EdgeInsets.only(top: 25, bottom: 50),
      color: AppColors.gray6,
      child: Column(
        children: [
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              margin: const EdgeInsets.only(right: 10),
              width: 120,
              child: TabBar(
                //labelPadding: EdgeInsets.zero 解决文字换行问题
                labelPadding: EdgeInsets.zero,
                //文字和下划线的间距
                indicatorPadding: const EdgeInsets.only(bottom: -3),
                isScrollable: false,
                indicatorColor: WColors.backgroundOne,
                unselectedLabelColor: WColors.bridgeGreyText,
                labelColor: Colors.white,
                indicatorWeight: 3,
                indicatorSize: TabBarIndicatorSize.label,
                controller: _tabController,
                onTap: (position) {
                  setState(() {
                    _tabPosition = position;
                  });
                },
                tabs: const <Widget>[
                  Text('中文', style: TextStyle(fontSize: 16)),
                  Text('English', style: TextStyle(fontSize: 16)),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 29),
            child: Text(
              "请务必妥善保存助记词，确定之后将进行校验。",
              style: TextStyle(color: AppColors.gray8e, fontSize: 14),
            ),
          ),
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.grayd9, width: 0.5),
                borderRadius: BorderRadius.circular(3)),
            margin: const EdgeInsets.only(top: 20, left: 16, right: 16),
            padding:
                const EdgeInsets.only(left: 8, right: 8, top: 15, bottom: 15),
            child: Text(
              getMnem(),
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButtons(name, password) {
    // return Expanded(
    // child:
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        blueButton(
          '更换助记词',
          () {
            createMnem(_tabPosition == 0 ? 1 : 0);
          },
          width: 120,
        ),
        blackButton(
          '验证助记词',
          () {
            var mnem = _tabPosition == 0 ? _chineseMnem : _englishMnem;

            Navigator.pushNamed(context, MyRouter.VIREFY_MNEM_PAGE,
                arguments: {'mnem': mnem, 'name': name, 'password': password});
          },
          width: 120,
        ),
      ],
      // ),
    );
  }
}
