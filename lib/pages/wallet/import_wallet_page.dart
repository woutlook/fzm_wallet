import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:fwallet/api/api.dart';
import 'package:fwallet/api/fzm_http.dart';
import 'package:fwallet/bean/tab_coin.dart';
import 'package:fwallet/const/app_colors.dart';
import 'package:fwallet/const/my_routers.dart';
import 'package:fwallet/provider/p.dart';
import 'package:fwallet/bean/coin_bean.dart';
import 'package:fwallet/bean/pwallet_bean.dart';
import 'package:fwallet/utils/app_utils.dart';
import 'package:fwallet/widget/widgets.dart';

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
  final TextEditingController _pw1Controller = TextEditingController();
  final TextEditingController _pw2Controller = TextEditingController();
  final TextEditingController _privController = TextEditingController();

  List<CoinBean> _mainChains = [];
  CoinBean? _tab2SelectedChain;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    getMainChains();
  }

  Future<void> getMainChains() async {
    final resp = await Http.of().get(RECOMMEND_COIN);
    final tabs = (resp.data as List)
        .map((e) => TabCategory.fromJson(e as Map<String, dynamic>));
    if (tabs.isEmpty) {
      return;
    }
    setState(() {
      _mainChains = tabs.first.items;
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _mnemController.dispose();
    _nameController.dispose();
    _pw1Controller.dispose();
    _pw2Controller.dispose();
    _privController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final list = _mainChains.map((e) {
      return coinItem(
        context,
        e,
        onTap: () {
          setState(() {
            _tab2SelectedChain = e;
          });
          // Scaffold.of(context).openEndDrawer();
          Navigator.pop(context);
        },
      );
    }).toList();
    return Scaffold(
      appBar: appBar(
        context,
        '导入账户',
        trailing: scanButton(context, size: 28, (barcodeCaptrue) {
          setState(() {
            // _privController.text = barcodeCaptrue;
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
                text: '导入助记词',
              ),
              Tab(
                text: '导入私钥',
              ),
              Tab(
                text: '导入找回钱包',
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
                    _buildTabView(context, _tab2Children(context)),
                    _buildTabView(context, _tab3Children(context)),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _tab3Children(context) {
    return [];
  }

  List<Widget> _sharedChildren() {
    return [
      normalInput(_nameController, '设置账户名称', labelText: '钱包名称'),
      const SizedBox(height: 20),
      passwordInput(_pw1Controller, _pw2Controller),
    ];
  }

  List<Widget> _tab2Children(context) {
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
                  if (_tab2SelectedChain != null)
                    Image.network(_tab2SelectedChain!.icon!,
                        width: 32.0, height: 32.0),
                  const SizedBox(width: 8.0),
                  Text(
                    _tab2SelectedChain?.name ?? '选择主链',
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
        controller: _privController,
        maxLines: 2,
        decoration: InputDecoration(
          hintText: '请输入私钥或扫描私钥生成的二维码登录',
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
          "账户支持导入所有遵循BIP标准生成的助记词",
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
                    blackButton('导入账户', () {
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

  _finishTask(index) {
    final name = _nameController.text;
    final password = _pw1Controller.text;
    final passwordAgain = _pw2Controller.text;
    if (_checked(name, password, passwordAgain)) {
      if (index == 0) {
        final mnemS = _mnemController.text;
        final mnem = formatString(mnemS);
        _importMnemWallet(mnem, name, password);
      } else if (index == 1) {
        final privkey = _privController.text;
        if (_tab2SelectedChain == null) {
          toast("请选择主链");
          return;
        }
        _importPrivWallet(privkey, name, password, _tab2SelectedChain!);
      } else if (index == 2) {
        // _importFindWallet(mnem, name, password);
        toast("暂未开放");
      }
    }
  }

  bool _checked(String name, String password, String passwordAgain) {
    var check = true;
    if (name.isEmpty) {
      toast("请输入账户名称");
      check = false;
    } else if (password.isEmpty) {
      toast("请输入密码");
      check = false;
    } else if (passwordAgain.isEmpty) {
      toast("请再次输入密码");
      check = false;
    } else if (password.length < 8 || password.length > 16) {
      toast("请输入8-16位字符");
      check = false;
    } else if (password != passwordAgain) {
      toast("两次密码不相同");
      check = false;
    } else if (!isFormatValid(password)) {
      toast("请输入8-16位字母数字组合");
      check = false;
    }

    return check;
  }

  bool isFormatValid(String str) {
    RegExp regExp = RegExp(r"^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{8,16}$");
    return regExp.hasMatch(str);
  }

  void _importPrivWallet(privkey, name, password, CoinBean coin) async {
    EasyLoading.show();
    // final pubkey = await WalletApi().privToPub(coin.chain!, privkey);
    // final address = await WalletApi().pubToAddr(coin.chain!, pubkey!);
    final encPriv = WalletApi().encPriv(privkey, password);
    final passwordHash = WalletApi().passwordHash(password);

    final wallet = PwalletBean(
      type: PwalletBean.TYPE_PRIVATE,
      name: name,
      password: passwordHash,
      privKey: encPriv,
      chain: coin.chain,
      platform: coin.platform,
    );
    _saveWallet(wallet, password);
  }

  void _importMnemWallet(mnem, name, password) async {
    EasyLoading.show();
    final map = WalletApi().encMnem(mnem, password);
    var mnemHash = map["mnem"];
    var passwordHash = map["password"];
    Log.i("mnemHash = $mnemHash,\n passwordHash = $passwordHash");

    final wallet = PwalletBean(
      type: PwalletBean.TYPE_MNEM,
      name: name,
      password: passwordHash,
      mnem: mnemHash,
      mnemType: 0,
    );
    await _saveWallet(wallet, password);
  }

  Future<void> _saveWallet(wallet, password) async {
    await saveWallet(wallet, password);
    EasyLoading.dismiss();
    if (mounted) {
      Navigator.pushReplacementNamed(context, MyRouter.MAIN_TAB_PAGE);
    }
  }
}
