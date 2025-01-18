import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:fzm_wallet/models/const/app_colors.dart';
import 'package:fzm_wallet/models/store.dart';
import 'package:fzm_wallet/models/wallet.dart';
import 'package:fzm_wallet/pages/wallet/create_wallet_page.dart';
import 'package:fzm_wallet/pages/wallet/import_wallet_page.dart';
import 'package:fzm_wallet/pages/wallet/wallet_item.dart';
import 'package:fzm_wallet/provider/p.dart';
import 'package:fzm_wallet/utils/app_utils.dart';
import 'package:fzm_wallet/widget/widgets.dart';

class MyWalletsPage extends ConsumerStatefulWidget {
  const MyWalletsPage({super.key});

  @override
  ConsumerState<MyWalletsPage> createState() => _MyWalletsPageState();
}

class _MyWalletsPageState extends ConsumerState<MyWalletsPage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  final List<Wallet> _wallets = [];
  int _tabIndex = 0;
  @override
  void initState() {
    super.initState();
    _getWallets();
    _tabController = TabController(length: 1, vsync: this);
    _tabController!.addListener(() {
      setState(() {
        _tabIndex = _tabController!.index;
      });
    });
  }

  void _getWallets() {
    final list = store.getWalletList();
    var wList = list.map((e) => store.getWallet(e)).toList();
    setState(() {
      _wallets.clear();
      final List<Wallet> list = wList.whereType<Wallet>().toList();
      _wallets.addAll(list);
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
    return buildLayout(context, child: _build(context));
  }

  Widget _build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, '',
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildTab(0, '创建/导入'),
              // _buildTab(1, '观察钱包'),
            ],
          ),
          bgColor: Colors.white,
          titleColor: AppColors.gray33),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildView(0),
          // _buildView(1),
        ],
      ),
    );
  }

  Widget _buildView(index) {
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
            child: ListView.builder(
              itemCount: _wallets.length,
              itemBuilder: (context, index) {
                final wallet = _wallets[index];
                final subWidget = Padding(
                  padding: const EdgeInsets.only(left: 60, top: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        wallet.name,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        wallet.typeString(),
                        style: TextStyle(color: AppColors.gray8e, fontSize: 14),
                      )
                    ],
                  ),
                );
                return Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: WalletItem(
                    subWidget,
                    name: wallet.name,
                    () {
                      ref.read((walletProvider).notifier).updateWallet(wallet);
                      Navigator.pop(context);
                    },
                    // wid: wallet.id!,
                    del: () async {
                      _deleteWallet(wallet, _wallets);
                    },
                  ),
                );
              },
            ),
          ),
          (index == 0)
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    blueButton('创建钱包', () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CreateWalletPage()));
                    }, width: 120),
                    blackButton('导入钱包', () async {
                      await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ImportWalletPage()));
                      _getWallets();
                    }, width: 120),
                  ],
                )
              : blackButton('导入钱包', () async {
                  await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ImportWalletPage()));
                  _getWallets();
                }),
        ],
      ),
    );
  }

  _deleteWallet(Wallet wallet, wallets) async {
    if (wallets.length == 1) {
      toast('至少保留一个钱包');
      return;
    }
    final current = ref.watch(walletProvider);
    if (current.name == wallet.name) {
      final newWallet = wallets[0];
      ref.read((walletProvider).notifier).updateWallet(newWallet);
    }
    store.removeWallet(wallet.name);
    _getWallets();
  }
}
