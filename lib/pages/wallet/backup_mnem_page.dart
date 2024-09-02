import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reorderables/reorderables.dart';

import 'package:fwallet/api/api.dart';
import 'package:fwallet/bean/backup_bean.dart';
import 'package:fwallet/bean/pwallet_bean.dart';
import 'package:fwallet/const/app_colors.dart';
import 'package:fwallet/provider/p.dart';
import 'package:fwallet/utils/app_utils.dart';
import 'package:fwallet/widget/widgets.dart';
import 'package:fwallet/const/my_routers.dart';
import 'package:fwallet/const/wallet_color.dart';

//import 'dart:ffi'; 莫名出现这个要删除
class BackUpMnemPage extends ConsumerStatefulWidget {
  const BackUpMnemPage({super.key});

  @override
  ConsumerState<BackUpMnemPage> createState() => _BackUpMnemPageState();
}

class _BackUpMnemPageState extends ConsumerState<BackUpMnemPage> {
  PwalletBean? _wallet;
  final List<WalletBackup> _selectMnems = [];
  List<WalletBackup> _mnems = [];

  @override
  void initState() {
    super.initState();

    var arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    _wallet = arguments["wallet"];
    final initList = _wallet!.mnem!.split(" ");
    setState(() {
      _mnems = initList
          .map((value) => WalletBackup(isSelected: false, mnem: value))
          .toList();
      _mnems.shuffle();
    });
  }

  List<Widget> listDragWidget() {
    List<Widget> rows = [];
    for (var item in _selectMnems) {
      rows.add(ElevatedButton(
        onPressed: () {
          setState(() {
            _selectMnems.removeWhere((value) => value.mnem == item.mnem);
            _mnems.singleWhere((value) => value.mnem == item.mnem).isSelected =
                false;
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

    return rows;
  }

  List<Widget> _listWidget() {
    List<Widget> rows = [];
    for (var item in _mnems) {
      rows.add(
        ElevatedButton(
          onPressed: () {
            if (!item.isSelected) {
              setState(() {
                item.isSelected = true;
                _selectMnems.add(item);
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
                  width: item.isSelected ? 1.0 : 0.0,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(3),
                ),
              ),
            ),
          ),
          child: Text(
            item.mnem,
            softWrap: false,
            style: TextStyle(
              color: item.isSelected ? WColors.bridgeGreyText : Colors.white,
              fontSize: 18,
            ),
          ),
        ),
      );
    }

    return rows;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: BaseAppBar("备份助记词"),
      appBar: appBar(context, '备份助记词'),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 300,
          padding:
              const EdgeInsets.only(top: 20, bottom: 20, left: 16, right: 16),
          color: AppColors.gray6,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 30, top: 20),
                child: Text(
                  "验证您备份的助记词",
                  style: TextStyle(color: AppColors.gray8e),
                ),
              ),
              ReorderableWrap(
                spacing: 10,
                runSpacing: 5,
                children: listDragWidget(),
                onReorder: (oldIndex, newIndex) {
                  setState(
                    () {
                      _selectMnems.insert(
                          newIndex, _selectMnems.removeAt(oldIndex));
                    },
                  );
                },
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            width: MediaQuery.of(context).size.width,
            color: AppColors.gray2b,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 16, top: 35, bottom: 20),
                  child: Text(
                    '请按照正确的顺序点击每个单词',
                    style: TextStyle(color: Color(0xFF999999), fontSize: 14),
                  ),
                ),
                Wrap(
                  spacing: 10,
                  runSpacing: 5,
                  children: _listWidget(),
                ),
                const Spacer(),
                blackButton(
                  '创建钱包',
                  _createHDWallet,
                ),
                // Padding(
                //   padding: const EdgeInsets.only(bottom: 20),
                //   child: SizedBox(
                //     width: 220,
                //     height: 45,
                //     child: ElevatedButton(
                //         onPressed: () {
                //           getHDWallet();
                //         },
                //         style: ButtonStyle(
                //             backgroundColor:
                //                 WidgetStateProperty.all(AppColors.gray2b),
                //             shape: WidgetStateProperty.all(
                //                 RoundedRectangleBorder(
                //                     borderRadius: BorderRadius.circular(5),
                //                     side: const BorderSide(
                //                         width: 0.5, color: Colors.white)))),
                //         child: const Text(
                //           "创建钱包",
                //           style: TextStyle(color: Colors.white),
                //         )),
                //   ),
                // )
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _createHDWallet() async {
    // var selectMnemStr = _selectMnems.map((item) => item.mnem).toList().join();
    EasyLoading.show();
    final mnem = _wallet!.mnem!;
    // if (selectMnemStr != mnem) {
    //   toast("助记词不正确");
    //   return;
    // }
    final map = WalletApi().encMnem(mnem, _wallet!.password!);
    var mnemHash = map["mnem"];
    var passwordHash = map["password"];
    final realPassward = _wallet!.password!;
    Log.i("mnemHash = $mnemHash,\n passwordHash = $passwordHash");

    _wallet!.password = passwordHash;
    _wallet!.mnem = mnemHash;
    _wallet!.type = 0;

    final wallet = _wallet!;
    await saveWallet(wallet, realPassward);
    EasyLoading.dismiss();
    if (mounted) {
      Navigator.pushReplacementNamed(context, MyRouter.MAIN_TAB_PAGE);
    }
    ref.read(walletProvider.notifier).updateWallet(wallet);
  }

  @override
  void dispose() {
    _selectMnems.clear();
    _mnems.clear();
    super.dispose();
  }
}
