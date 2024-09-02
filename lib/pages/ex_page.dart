import 'package:flutter/material.dart';

import 'package:fwallet/api/fzm_http.dart';
import 'package:fwallet/const/my_routers.dart';
import 'package:fwallet/pages/wallet/ex_item.dart';
import 'package:fwallet/utils/app_utils.dart';
import 'package:fwallet/bean/ex_bean.dart';

class ExPage extends StatefulWidget {
  const ExPage({super.key});

  @override
  State<StatefulWidget> createState() => _ExPageState();
}

class _ExPageState extends State<ExPage> {
  final List<Apps> _newList = [];

  @override
  void initState() {
    super.initState();
    getExs();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _newList.length,
        itemBuilder: (context, index) => InkWell(
            onTap: () {
              Navigator.pushNamed(context, MyRouter.WEB_PAGE,
                  arguments: {"url": _newList[index].appUrl});
              toast(_newList[index].name ?? "");
            },
            child: ExItem(_newList[index])));
  }

  Future<void> getExs() async {
    var response = await Http.of().post(EXS);
    if (response.ok) {
      List list = response.data;
      List<ExBean> exList = list.map((e) => ExBean.fromJson(e)).toList();
      setState(() {
        for (var ex in exList) {
          Apps apps = Apps(name: ex.name);
          _newList.add(apps);
          for (var app in ex.apps!) {
            _newList.add(app);
          }
        }
      });
    }
  }
}
