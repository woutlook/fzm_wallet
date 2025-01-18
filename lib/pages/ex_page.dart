import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:fzm_wallet/pages/wallet/ex_item.dart';
import 'package:fzm_wallet/utils/app_utils.dart';
import 'package:fzm_wallet/models/ex_bean.dart';
import 'package:fzm_wallet/widget/widgets.dart';

class ExPage extends ConsumerStatefulWidget {
  const ExPage({super.key});

  @override
  ConsumerState<ExPage> createState() => _ExPageState();
}

class _ExPageState extends ConsumerState<ExPage> {
  final List<ExItem> exs = [];

  @override
  void initState() {
    super.initState();
    getExs();
  }

  @override
  Widget build(BuildContext context) {
    return buildLayout(context, child: _build(context));
  }

  Widget _build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView.builder(
          itemCount: exs.length,
          itemBuilder: (context, index) {
            debugPrint('Building item at index $index'); // 添加日志
            final ex = exs[index];
            return Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                  height: 150,
                  // constraints: BoxConstraints(
                  //   minHeight: 100,
                  //   maxHeight: 200,
                  // ),
                  child: ExItemPage(ex)),
            );
          }),
    );
  }

  Future<void> getExs() async {
    try {
      // final data = await httpClient.get(EXS);
      final list = exsJson;
      final exList = list.map((e) => ExItem.fromJson(e)).toList();
      setState(() {
        exs.addAll(exList);
      });
    } catch (e) {
      Log.d(e.toString());
    }
  }
}

final exsJson = [
  {
    "id": 1,
    "name": "以太坊",
    "style": 1,
    "status": 1,
    "apps": [
      {
        "id": 373,
        "name": "ETH官网",
        "icon":
            "http://wallet-33.oss-cn-shanghai.aliyuncs.com/upload/application/e240aa5e09aa1fac9df14db35e04bfcf.png",
        "type": 1,
        "app_url": "https://ethereum.org/en/",
        "slogan": "thousands of decentralized applications.",
        "email": 0,
        "phone": 0,
        "real_name": 0
      },
      {
        "id": 372,
        "name": "ETH浏览器",
        "icon":
            "http://wallet-33.oss-cn-shanghai.aliyuncs.com/upload/application/2021da873a32642bd59a139f162ef028.jpg",
        "type": 1,
        "app_url": "https://cn.etherscan.com/",
        "slogan": "Ethereum Blockchain Browser",
        "email": 0,
        "phone": 0,
        "real_name": 0
      }
    ]
  },
  {
    "id": 2,
    "name": "比特元",
    "style": 1,
    "status": 1,
    "apps": [
      {
        "id": 374,
        "name": "BTY官网",
        "icon":
            "http://wallet-33.oss-cn-shanghai.aliyuncs.com/upload/application/f29291672dd23b106f58d9969b90cb63.png",
        "type": 1,
        "app_url": "https://bityuan.com/",
        "slogan": "BITYUAN is a decentralized blockchain",
        "email": 0,
        "phone": 0,
        "real_name": 0
      },
      {
        "id": 371,
        "name": "BTY浏览器",
        "icon":
            "http://wallet-33.oss-cn-shanghai.aliyuncs.com/upload/application/c3e062e62c32e5e086f488dcaf65199b.png",
        "type": 1,
        "app_url": "https://mainnet.bityuan.com",
        "slogan": "BitYuan Blockchain Browser",
        "email": 0,
        "phone": 0,
        "real_name": 0
      },
      {
        "id": 383,
        "name": "委托投票",
        "icon":
            "http://wallet-33.oss-cn-shanghai.aliyuncs.com/upload/application/6a923805b5df28bf2ce0c2e8db36745c.png",
        "type": 1,
        "app_url": "https://bityuan.com/pool-detail",
        "slogan": "pool-detail",
        "email": 0,
        "phone": 0,
        "real_name": 0
      }
    ]
  },
  {
    "id": 3,
    "name": "原链",
    "style": 1,
    "status": 1,
    "apps": [
      {
        "id": 375,
        "name": "原链官网",
        "icon":
            "http://wallet-33.oss-cn-shanghai.aliyuncs.com/upload/application/fb557ba790a736820d3a31019e07f1b4.png",
        "type": 1,
        "app_url": "https://yuan.org/home",
        "slogan": "Enterprise level blockchain SaaS platform",
        "email": 0,
        "phone": 0,
        "real_name": 0
      },
      {
        "id": 370,
        "name": "YCC-共识投票",
        "icon":
            "http://wallet-33.oss-cn-shanghai.aliyuncs.com/upload/application/cebb86ff0dc7d16aab85ac8c720dc47f.png",
        "type": 1,
        "app_url": "https://yuan.org/vote/#/",
        "slogan": "Voting is a decentralized applications",
        "email": 0,
        "phone": 0,
        "real_name": 0
      },
      {
        "id": 367,
        "name": "YCC浏览器",
        "icon":
            "http://wallet-33.oss-cn-shanghai.aliyuncs.com/upload/application/28b41371a9116ed45be2caba0e74076c.png",
        "type": 1,
        "app_url": "https://yuan.org/blockChainBrowser",
        "slogan": "YUANCHAIN Blockchain Browser",
        "email": 0,
        "phone": 0,
        "real_name": 0
      }
    ]
  }
];
