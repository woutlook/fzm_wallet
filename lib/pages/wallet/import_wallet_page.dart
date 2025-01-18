import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:fzm_wallet/models/coin.dart';
import 'package:fzm_wallet/models/store.dart';
import 'package:fzm_wallet/models/const/app_colors.dart';
import 'package:fzm_wallet/models/const/my_routers.dart';
import 'package:fzm_wallet/models/wallet.dart';
import 'package:fzm_wallet/provider/p.dart';
import 'package:fzm_wallet/utils/app_utils.dart';
import 'package:fzm_wallet/widget/widgets.dart';

class ImportWalletPage extends StatefulWidget {
  const ImportWalletPage({super.key});

  @override
  State<ImportWalletPage> createState() => _ImportWalletPageState();
}

class _ImportWalletPageState extends State<ImportWalletPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final TextEditingController _mnemController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _privOrAddrController = TextEditingController();

  Coin? _selectedCoin;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _mnemController.dispose();
    _nameController.dispose();
    _privOrAddrController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return buildLayout(context, child: _build(context));
  }

  Widget _build(BuildContext context) {
    final list = nativeCoinList.map((e) {
      return coinItem(
        context,
        e,
        onTap: () {
          setState(() {
            _selectedCoin = e;
          });
          // Scaffold.of(context).openEndDrawer();
          Navigator.pop(context);
        },
      );
    }).toList();
    return Scaffold(
      appBar: appBar(
        context,
        '导入钱包',
        trailing: scanButton(context, size: 28, onDetect: (barcodeCaptrue) {
          final result = barcodeCaptrue.barcodes.first.rawValue;
          setState(() {
            _privOrAddrController.text = result ?? '';
          });
        }),
      ),
      endDrawer: endDrawer(context, child: Column(children: list)),
      body: Column(
        children: [
          TabBar(
            controller: _tabController,
            tabs: const [
              Tab(
                text: '导入助记词钱包',
              ),
              Tab(
                text: '导入私钥钱包',
              ),
              Tab(
                text: '导入观察钱包',
              ),
            ],
          ),
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return TabBarView(
                  controller: _tabController,
                  children: [
                    _buildTabView(context, _tab1Children(context)),
                    _buildTabView(context,
                        _tab23Children(context, hintText: '请输入私钥或扫描私钥二维码')),
                    _buildTabView(context,
                        _tab23Children(context, hintText: '请输入地址或扫描地址二维码')),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _sharedChildren() {
    return [
      normalInput(_nameController, '设置钱包名称', labelText: '钱包名称'),
      const SizedBox(height: 20),
      // passwordInput(_pw1Controller, _pw2Controller),
    ];
  }

  List<Widget> _tab23Children(context, {required String hintText}) {
    return [
      GestureDetector(
        onTap: () {
          Scaffold.of(context).openEndDrawer();
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blue),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Spacer(),
              Row(
                children: [
                  if (_selectedCoin != null)
                    Image.network(_selectedCoin!.icon!,
                        width: 32.0, height: 32.0),
                  const SizedBox(width: 8.0),
                  Text(
                    _selectedCoin?.name ?? '选择主链',
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
              const Spacer(),
              const Icon(Icons.arrow_forward_ios),
            ],
          ),
        ),
      ),
      const SizedBox(height: 20.0),
      TextField(
        controller: _privOrAddrController,
        maxLines: 2,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: AppColors.grayd9),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
      const SizedBox(height: 20.0),
      ..._sharedChildren(),
    ];
  }

  List<Widget> _tab1Children(contex) {
    return [
      Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.only(left: 10),
        height: 150,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4), color: AppColors.line),
        child: TextField(
          controller: _mnemController,
          style: TextStyle(
            color: AppColors.gray33,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
          maxLines: null,
          decoration: InputDecoration(
            focusedBorder: InputBorder.none,
            border: InputBorder.none,
            hintText: "请输入助记词，用空格分割",
            hintStyle: TextStyle(
              color: AppColors.gray8e,
              fontSize: 15,
              fontWeight: FontWeight.normal,
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 15),
          ),
        ),
      ),
      Container(
        margin: const EdgeInsets.only(top: 15, bottom: 30),
        alignment: Alignment.center,
        child: Text(
          "钱包支持导入所有遵循BIP标准生成的助记词",
          style: TextStyle(color: AppColors.button, fontSize: 14),
        ),
      ),
      ..._sharedChildren(),
    ];
  }

  Widget _buildTabView(context, children) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: constraints.maxWidth,
              minHeight: constraints.maxHeight,
            ),
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.only(left: 16, right: 16, top: 50),
              child: IntrinsicHeight(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    ...children,
                    const Spacer(),
                    const SizedBox(height: 20),
                    blackButton('导入钱包', () {
                      final index = _tabController.index;
                      _finishTask(index);
                    }),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  _finishTask(index) async {
    final name = _nameController.text;
    if (name.isEmpty) {
      toast("请输入钱包名称");
      return;
    }
    final walletList = store.getWalletList();
    for (var w in walletList) {
      if (w == name) {
        toast("钱包名称已存在");
        return;
      }
    }
    final password = await showPasswordDialog(context);
    if (password == null) {
      return;
    }
    if (index == 0) {
      final mnemS = _mnemController.text;
      final mnem = formatString(mnemS);
      _importMnemWallet(mnem, name, password);
    } else if (index == 1) {
      final privkey = _privOrAddrController.text;
      if (_selectedCoin == null) {
        toast("请选择主链");
        return;
      }
      _importPrivWallet(privkey, name, password, _selectedCoin!);
    } else if (index == 2) {
      // _importFindWallet(mnem, name, password);
      toast("暂未开放");
    }
  }

  bool isFormatValid(String str) {
    RegExp regExp = RegExp(r"^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{8,16}$");
    return regExp.hasMatch(str);
  }

  void _importPrivWallet(privkey, name, password, Coin coin) async {
    EasyLoading.show();
    final wallet = PrivateWallet.fromPrivateKey(
      privateKey: privkey,
      name: name,
      password: password,
      chain: coin.chain,
    );

    _saveWallet(wallet);
  }

  void _importMnemWallet(mnem, name, password) async {
    EasyLoading.show();
    final wallet = MnemonicWallet.fromMnemonic(
        mnemonic: mnem, name: name, password: password);

    await _saveWallet(wallet);
  }

  Future<void> _saveWallet(wallet) async {
    store.setWallet(wallet);
    // ref.read(walletProvider.notifier).updateWallet(wallet);
    EasyLoading.dismiss();
    if (mounted) {
      Navigator.pushReplacementNamed(context, MyRouter.MAIN_TAB_PAGE);
    }
  }
}
