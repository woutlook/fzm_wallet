import 'package:flutter/material.dart';
import 'package:reorderables/reorderables.dart';

import '../../bean/backup_bean.dart';
import '../../const/wallet_color.dart';

/// 备份助记词
class WalletBackupWidget extends StatefulWidget {
  final String mnem;

  const WalletBackupWidget({super.key, required this.mnem});

  @override
  State<StatefulWidget> createState() => _WalletBackupWidgetState();
}

class _WalletBackupWidgetState extends State<WalletBackupWidget> {
  List<WalletBackup> walletBackUp = [];
  List<WalletBackup> walletValidation = [];

  List<Widget> listDragWidget() {
    List<Widget> widgets = [];
    for (var item in walletValidation) {
      widgets.add(ElevatedButton(
        onPressed: () {
          setState(() {
            walletBackUp
                .firstWhere((value) => value.mnem == item.mnem)
                .isSelected = false;
            walletValidation.removeWhere((value) => value.mnem == item.mnem);
          });
        },
        style: ButtonStyle(
            padding: WidgetStateProperty.all<EdgeInsets>(
                const EdgeInsets.only(left: 10, right: 10)),
            minimumSize: WidgetStateProperty.all<Size>(
                const Size(double.minPositive, 40)),
            overlayColor: WidgetStateProperty.all<Color>(WColors.black),
            backgroundColor: WidgetStateProperty.all<Color>(WColors.mnemColor),
            shape: WidgetStateProperty.all<OutlinedBorder>(
                const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(3))))),
        child: Text(item.mnem,
            softWrap: false,
            style: const TextStyle(color: Colors.white, fontSize: 18)),
      ));
    }
    return widgets;
  }

  List<Widget> listWidget() {
    List<Widget> widgets = [];
    for (var item in walletBackUp) {
      widgets.add(ElevatedButton(
        onPressed: () {
          if (!item.isSelected) {
            setState(() {
              item.isSelected = true;
              walletValidation.add(item);
            });
          }
        },
        style: ButtonStyle(
            padding: WidgetStateProperty.all<EdgeInsets>(
                const EdgeInsets.only(left: 10, right: 10)),
            minimumSize: WidgetStateProperty.all<Size>(
                const Size(double.minPositive, 40)),
            overlayColor: WidgetStateProperty.all<Color>(WColors.black),
            backgroundColor: WidgetStateProperty.all<Color>(
                item.isSelected ? WColors.black : WColors.mnemColor),
            shape: WidgetStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(
                    side: BorderSide(
                        color: WColors.bridgeGreyText,
                        width: item.isSelected ? 1.0 : 0.0),
                    borderRadius: const BorderRadius.all(Radius.circular(3))))),
        child: Text(item.mnem,
            softWrap: false,
            style: TextStyle(
                color: item.isSelected ? WColors.bridgeGreyText : Colors.white,
                fontSize: 18)),
      ));
    }
    return widgets;
  }

  List<String> itemMnems() {
    List<String> result = [];
    List<String> list = widget.mnem.split(' ');
    for (var item in list) {
      if (item.isNotEmpty) {
        result.add(item);
      }
    }
    return result;
  }

  bool confirmWidgetEnable() => walletValidation.length == itemMnems().length;

  void getHDWallet() {
    if (walletValidation.map((e) => e.mnem).toList().join() !=
        widget.mnem.replaceAll(' ', "")) {
      //getIt<ErrorReactiveService>().showToastMessage('助记词不正确' );
      return;
    }

    /// loading
    /*  showDialog(context: context, builder: (context) => LoadingDialog());
    invokeCreateWallet(widget.data).then((isSuccess) {
      /// 关闭弹框
      Navigator.pop(context);

      if(isSuccess) {
        /// 返回主页
        getIt<ErrorReactiveService>().showToastMessage('钱包创建成功' );
        Navigator.of(context).popUntil(ModalRoute.withName(MainRoutePath.HOME));
      }
    });*/
  }

  @override
  void initState() {
    super.initState();
    walletBackUp.addAll(itemMnems()
        .map((value) => WalletBackup(isSelected: false, mnem: value))
        .toList());
    walletBackUp.shuffle();

    for (var item in walletBackUp) {
      if (item.isSelected) walletValidation.add(item);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WColors.black,
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate.fixed([
              Container(
                color: WColors.blackSecondary,
                padding: const EdgeInsets.only(top: 18),
                alignment: Alignment.center,
                child: const Text(
                  '验证您备份的助记词',
                  style: TextStyle(color: WColors.bridgeGreyText, fontSize: 14),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 10, top: 20),
                color: WColors.blackSecondary,
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 2 / 5 - 60,
                child: ReorderableWrap(
                  spacing: 10,
                  runSpacing: 5,
                  children: listDragWidget(),
                  onReorder: (oldIndex, newIndex) {
                    setState(() {
                      walletValidation.insert(
                          newIndex, walletValidation.removeAt(oldIndex));
                    });
                  },
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 16, top: 35, bottom: 10),
                child: Text(
                  '请按照正确的顺序点击每个单词',
                  style: TextStyle(color: Color(0xFF999999), fontSize: 14),
                ),
              ),
              Column(
                children: [
                  Flow(
                    delegate: const MyFlowDelegate(type: 0),
                    children: listWidget(),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
                child: ElevatedButton(
                  onPressed: () => {if (confirmWidgetEnable()) getHDWallet()},
                  style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all<Color>(
                          confirmWidgetEnable()
                              ? WColors.backgroundBlue
                              : WColors.backgroundLight),
                      shape: WidgetStateProperty.all<OutlinedBorder>(
                          const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))))),
                  child: Container(
                    height: 45,
                    alignment: Alignment.center,
                    child: Text('确定',
                        softWrap: false,
                        style: TextStyle(
                            color: confirmWidgetEnable()
                                ? Colors.white
                                : WColors.lightTextColor,
                            fontSize: 15)),
                  ),
                ),
              )
            ]),
          )
        ],
      ),
    );
  }
}

class MyFlowDelegate extends FlowDelegate {
  final int type;

  const MyFlowDelegate({required this.type});

  @override
  void paintChildren(FlowPaintingContext context) {
    var screenW = context.size.width;
    double padding = 10;
    double offsetX = padding;
    double offsetY = padding;

    for (var index = 0; index < context.childCount; index++) {
      Size? childSize = context.getChildSize(index);
      double boxWidget = 0;
      double boxHeight = 0;
      if (childSize != null) {
        boxWidget = childSize.width;
        boxHeight = childSize.height;
      }
      if (offsetX + boxWidget < screenW) {
        context.paintChild(index,
            transform: Matrix4.translationValues(offsetX, offsetY, 0));
        offsetX = offsetX + boxWidget + padding;
      } else {
        offsetX = padding;
        if (type == 0) {
          offsetY = offsetY + boxHeight + padding;
        } else {
          offsetY = offsetY + boxHeight;
        }
        context.paintChild(index,
            transform: Matrix4.translationValues(offsetX, offsetY, 0));
        offsetX = offsetX + boxWidget + padding;
      }
    }
  }

  @override
  Size getSize(BoxConstraints constraints) {
    return const Size(double.infinity, 220);
  }

  @override
  bool shouldRepaint(covariant FlowDelegate oldDelegate) => true;
}
