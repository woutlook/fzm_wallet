import 'package:flutter/material.dart';
import 'package:fzm_wallet/pages/ex_page.dart';
import 'package:fzm_wallet/pages/home_page.dart';
import 'package:fzm_wallet/pages/my_page.dart';
import 'package:fzm_wallet/widget/widgets.dart';

class MainTabPage extends StatefulWidget {
  const MainTabPage({super.key});

  @override
  State<StatefulWidget> createState() => _MainTabPageState();
}

class _MainTabPageState extends State<MainTabPage> {
  late List<BottomNavigationBarItem> bottomViews;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();

    bottomViews = [
      getBottomItem("assets/images/tab_icon_home_nor.png",
          "assets/images/tab_icon_home_select.png", "首页"),
      getBottomItem("assets/images/tab_icon_explore_nor.png",
          "assets/images/tab_icon_explore_select.png", "探索"),
      getBottomItem("assets/images/tab_icon_my_nor.png",
          "assets/images/tab_icon_my_select.png", "我的")
    ];
  }

  BottomNavigationBarItem getBottomItem(
      String norImage, String selImage, String label) {
    return BottomNavigationBarItem(
        icon: Image(
          width: 25,
          height: 25,
          image: AssetImage(norImage),
        ),
        activeIcon: Image(
          width: 25,
          height: 25,
          image: AssetImage(selImage),
        ),
        label: label);
  }

  @override
  Widget build(BuildContext context) {
    return buildLayout(context, child: _build(context));
  }

  Widget _build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
          index: currentIndex,
          children: const [HomePage(), ExPage(), MyPage()],
          ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        items: bottomViews,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
