import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fzm_wallet/models/const/my_routers.dart';
import 'package:fzm_wallet/models/store.dart';
import 'package:fzm_wallet/models/wallet.dart';
import 'package:fzm_wallet/provider/p.dart';
import 'package:reorderables/reorderables.dart';

import 'package:fzm_wallet/models/const/wallet_color.dart';
import 'package:fzm_wallet/models/const/app_colors.dart';
import 'package:fzm_wallet/widget/widgets.dart';

class MnemSelect {
  late bool isSelected;
  late String word;

  MnemSelect({required this.isSelected, required this.word});

  // @override
  // bool operator ==(Object other) {
  //   return other is MnemSelect && other.word == word;
  // }

  // @override
  // int get hashCode => super.hashCode;
}

//import 'dart:ffi'; 莫名出现这个要删除
class VirefyMnemPage extends ConsumerStatefulWidget {
  const VirefyMnemPage({super.key});

  @override
  ConsumerState<VirefyMnemPage> createState() => _VirefyMnemPageState();
}

class _VirefyMnemPageState extends ConsumerState<VirefyMnemPage> {
  final List<MnemSelect> _selectMnems = [];

  List<Widget> listDragWidget(mnems) {
    List<Widget> rows = [];
    for (var item in _selectMnems) {
      rows.add(ElevatedButton(
        onPressed: () {
          setState(() {
            _selectMnems.removeWhere((value) => value.word == item.word);
            mnems.singleWhere((value) => value.word == item.word).isSelected =
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
        child: Text(item.word,
            softWrap: false,
            style: const TextStyle(color: Colors.white, fontSize: 18)),
      ));
    }

    return rows;
  }

  List<Widget> _listWidget(mnems) {
    List<Widget> rows = [];
    for (var item in mnems) {
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
            item.word,
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
    return buildLayout(context, child: _build(context));
  }

  Widget _build(BuildContext context) {
    var arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final originalMnem = arguments['mnem'];
    final name = arguments['name'];
    final password = arguments['password'];
    final mnemList = originalMnem!.split(' ');
    final mnems = mnemList
        .map((value) => MnemSelect(isSelected: false, word: value))
        .toList();
    mnems.shuffle();
    return Scaffold(
      appBar: appBar(context, '验证助记词'),
      body: _buildBody(context, mnems, originalMnem, name, password),
    );
  }

  Widget _buildBody(context, mnems, originalMnem, name, password) {
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
                children: listDragWidget(mnems),
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
                  children: _listWidget(mnems),
                ),
                const Spacer(),
                blackButton(
                  '创建钱包',
                  () {
                    _createHDWallet(context, originalMnem, name, password);
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // ...existing code...
  void _createWallet(BuildContext context, String originalMnem,
      String name, String password) {
    final wallet = MnemonicWallet.fromMnemonic(
      mnemonic: originalMnem,
      name: name,
      password: password,
    );
    store.setWallet(wallet);
    ref.read(walletProvider.notifier).updateWallet(wallet);
    Navigator.pushNamed(context, MyRouter.MAIN_TAB_PAGE);
  }
  // ...existing code...

  void _createHDWallet(context, String originalMnem, name, password) {
    var selectMnemStr =
        _selectMnems.map((item) => item.word).toList().join(' ');
    if (selectMnemStr != originalMnem) {
      // toast("助记词不正确");
      // return;
    }
    EasyLoading.show(status: '创建中...');
    _createWallet(context, originalMnem, name, password);
    EasyLoading.dismiss();
  }
}
