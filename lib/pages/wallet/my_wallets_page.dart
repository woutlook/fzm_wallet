import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:fwallet/bean/pwallet_bean.dart';
import 'package:fwallet/const/app_colors.dart';
import 'package:fwallet/const/my_routers.dart';
import 'package:fwallet/pages/wallet/wallet_item.dart';
import 'package:fwallet/provider/p.dart';
import 'package:fwallet/db/db.dart';
import 'package:fwallet/widget/widgets.dart';

List<PwalletBean> _wallets = [];

class MyWalletsPage extends ConsumerStatefulWidget {
  const MyWalletsPage({super.key});

  @override
  ConsumerState<MyWalletsPage> createState() => _MyWalletsPageState();
}

class _MyWalletsPageState extends ConsumerState<MyWalletsPage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  int _tabIndex = 0;
  @override
  void initState() {
    super.initState();
    _getWallets();
    _tabController = TabController(length: 2, vsync: this);
    _tabController!.addListener(() {
      setState(() {
        _tabIndex = _tabController!.index;
      });
    });
  }

  Future<void> _getWallets() async {
    var db = await DatabaseHelper().database;
    List list = await db.query("Wallet");
    var wList = list.map((e) => PwalletBean.fromJson(e)).toList();
    setState(() {
      _wallets.clear();
      _wallets.addAll(wList);
    });
  }

  Widget _buildTab(index, title) {
    return InkWell(
      onTap: () {
        _tabController!.animateTo(index);
      },
      child: Container(
        height: 30,
        decoration: BoxDecoration(
          color: _tabIndex == index ? AppColors.gray6 : Colors.transparent,
          border: Border.all(
            color: AppColors.gray6, // 边框颜色
            // width: _tabIndex == 0 ? 0.5 : 1, // 边框宽度
            strokeAlign: BorderSide.strokeAlignOutside,
          ),
          borderRadius: BorderRadius.circular(2.0),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 2),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 16,
              color: _tabIndex == index ? Colors.white : AppColors.gray33,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(x);
    return Scaffold(
      appBar: appBar(context, '',
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildTab(0, '创建/导入'),
              _buildTab(1, '观察账户'),
            ],
          ),
          bgColor: Colors.white,
          titleColor: AppColors.gray33),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildView(0),
          _buildView(1),
        ],
      ),
    );
  }

  Widget _buildView(index) {
    final wallets = _wallets.where((wallet) {
      if (index == 0) {
        return wallet.type != PwalletBean.TYPE_KEYADD;
      } else {
        return wallet.type == PwalletBean.TYPE_KEYADD;
      }
    }).toList();
    return Container(
      padding: const EdgeInsets.only(bottom: 10, left: 20, right: 20, top: 10),
      color: Colors.white,
      child: Column(
        children: [
          Divider(
            height: 0.5,
            color: AppColors.grayd9,
          ),
          // const SizedBox(height: 20),
          Expanded(
            child: RefreshIndicator(
              onRefresh: _getWallets,
              child: ListView.builder(
                itemCount: wallets.length,
                itemBuilder: (context, index) {
                  final wallet = wallets[index];
                  final subWidget = Padding(
                    padding: const EdgeInsets.only(left: 60, top: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          wallet.name ?? "",
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 16),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          wallet.typeString(),
                          style:
                              TextStyle(color: AppColors.gray8e, fontSize: 14),
                        )
                      ],
                    ),
                  );
                  return Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: WalletItem(
                      subWidget,
                      () {
                        ref
                            .read((walletProvider).notifier)
                            .updateWallet(wallet);
                        Navigator.pop(context);
                      },
                      wid: wallet.id!,
                      del: () async {
                        _deleteWallet(wallet, wallets);
                      },
                    ),
                  );
                },
              ),
            ),
          ),
          (index == 0)
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    blueButton('创建账户', () {
                      Navigator.pushNamed(context, MyRouter.CREATE_WALLET_PAGE);
                    }, width: 120),
                    blackButton('导入账户', () {
                      Navigator.pushNamed(context, MyRouter.IMPORT_WALLET_PAGE);
                    }, width: 120),
                  ],
                )
              : blackButton('导入账户', () {
                  Navigator.pushNamed(context, MyRouter.IMPORT_WALLET_PAGE);
                }),
        ],
      ),
    );
  }

  _deleteWallet(wallet, wallets) async {
    final ok = await wallet.unlock(context, wallet.password);
    if (!ok) {
      return;
    }
    final current = ref.watch(walletProvider);
    if (current.id == wallet.id) {
      ref.read((walletProvider).notifier).updateWallet(_wallets[0]);
    }
    await deleteWallet(wallet, wallets);
    await _getWallets();
  }
}
