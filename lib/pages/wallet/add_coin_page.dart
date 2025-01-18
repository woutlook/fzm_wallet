// ignore_for_file: constant_identifier_names

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:fzm_wallet/models/coin.dart';
import 'package:fzm_wallet/models/const/recommon_list.dart';
import 'package:fzm_wallet/models/tab_coin.dart';
import 'package:fzm_wallet/models/const/app_colors.dart';
import 'package:fzm_wallet/models/wallet.dart';
import 'package:fzm_wallet/provider/p.dart';
import 'package:fzm_wallet/widget/widgets.dart';

class AddCoinPage extends ConsumerStatefulWidget {
  const AddCoinPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddCoinPageState();
}

class _AddCoinPageState extends ConsumerState<AddCoinPage>
    with TickerProviderStateMixin {
  List<TabCategory> _tabs = [];
  List<bool> _isSelected = [];

  // ignore: unused_field
  final StreamController<List<String>> _controller =
      StreamController<List<String>>();

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 1, vsync: this);
    _isSelected = List.filled(1, false);
    fetchData();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  fetchData() async {
    final list = recommon_list;
    setState(() {
      final tabs = List<TabCategory>.from(
          list.map((e) => TabCategory.fromJson(e as Map<String, dynamic>)));
      final List<TabCategory> filterTabs = tabs.where((tab) {
        return tab.items.isNotEmpty;
      }).toList();
      _tabs = filterTabs;
      _isSelected = List.filled(1 + _tabs.length, false);
      _tabController = TabController(length: 1 + _tabs.length, vsync: this);
    });
  }

  @override
  Widget build(BuildContext context) {
    return buildLayout(context, child: _build(context));
  }

  Widget _build(BuildContext context) {
    List<TextButton> ts = _tabs
        .map(
          (e) => TextButton(
            onPressed: () {
              _tabController.animateTo(1 + _tabs.indexOf(e));
              setState(() {
                for (int i = 0; i < _isSelected.length; i++) {
                  _isSelected[i] = i == _tabs.indexOf(e) + 1;
                }
              });
            },
            child: Text(e.name,
                style: TextStyle(
                    color: _isSelected[_tabs.indexOf(e) + 1]
                        ? Colors.black
                        : Colors.blue)),
          ),
        )
        .toList();
    final wallet = ref.watch(walletProvider);
    final coins = wallet.coinList;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.navigate_before_outlined,
            size: 32,
          ),
          onPressed: () {
            Navigator.pop(context, coins);
          },
        ),
        title: SizedBox(
          height: 40,
          child: TextField(
            decoration: const InputDecoration(
              hintText: '输入token名称或合约地址',
              contentPadding: EdgeInsets.only(bottom: 8.0),
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(
                  width: 1.0,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(
                  width: 1.0,
                  color: Colors.grey, // 设置未聚焦时的边框颜色
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(
                  width: 1.0,
                  color: Colors.blue, // 设置聚焦时的边框颜色
                ),
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => _SearchCoins(
                    coins: coins,
                  ),
                ),
              );
            },
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(bottom: 10),
        color: Colors.white,
        child: Column(
          children: [
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      // _coins = ref.watch(coinsProvider);
                      for (int i = 0; i < _isSelected.length; i++) {
                        _isSelected[i] = i == 0;
                      }
                    });
                    _tabController.animateTo(0);
                  },
                  child: Text('主页',
                      style: TextStyle(
                          color: _isSelected[0]
                              ? Colors.black
                              : Colors.lightBlue)),
                ),
                ...ts,
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  ..._buildTabViews(coins, wallet),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildTabViews(coins, wallet) {
    final view0 = ListView.builder(
      itemCount: coins.length,
      itemBuilder: (context, index) {
        final coin = coins[index];
        return _AddCoinItem(
          coin,
        );
      },
    );

    final list = _tabs.map((e) {
      return ListView.builder(
        itemCount: e.items.length,
        itemBuilder: (context, index) {
          final coin = e.items[index];
          coins.map((e) {
            if (coin.id == e.id) {
              wallet.addCoin(coin);
            }
          }).toList();

          return _AddCoinItem(coin);
        },
      );
    }).toList();

    return [view0, ...list];
  }
}

class _AddCoinItem extends ConsumerStatefulWidget {
  final Coin coin;

  const _AddCoinItem(this.coin);

  @override
  _AddCoinItemState createState() => _AddCoinItemState();
}

class _AddCoinItemState extends ConsumerState<_AddCoinItem> {
  @override
  void initState() {
    super.initState();
  }

  void setCoin(Wallet wallet, Coin coin) {
    final Map<int, Coin> coins = wallet.coins;
    if (coins.containsKey(coin.id)) {
      wallet.removeCoin(coin.id);
    } else {
      wallet.addCoin(coin);
    }
    ref.read(walletProvider.notifier).updateWallet(wallet);
  }

  @override
  Widget build(BuildContext context) {
    final wallet = ref.watch(walletProvider);
    final added = wallet.coins.containsKey(widget.coin.id);
    Widget img;
    try {
      img = widget.coin.icon?.isEmpty == true
          ? const Icon(Icons.error)
          : Image.asset(
              widget.coin.icon ?? '',
              width: 32,
              height: 32,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.error),
            );
    } catch (e) {
      img = const Icon(Icons.error);
    }
    return Container(
      height: 70,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.black.withAlpha(25),
          blurRadius: 5,
          spreadRadius: 2,
        ),
        BoxShadow(
          color: Colors.white.withAlpha(25),
          blurRadius: 5,
          spreadRadius: 2,
        ),
      ], color: Colors.white, borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.only(left: 16, right: 16),
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          // Image.asset(
          //   widget.coin.icon ?? '',
          //   width: 32,
          //   height: 32,
          //   fit: BoxFit.cover,
          //   errorBuilder: (context, error, stackTrace) =>
          //       const Icon(Icons.error),
          // ),
          img,
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.coin.name,
                  style: TextStyle(
                      color: AppColors.gray33,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  "(${widget.coin.nickname})",
                  style: TextStyle(color: AppColors.gray8e, fontSize: 12),
                ),
              ],
            ),
          ),
          const Spacer(),
          IconButton(
            icon: Icon(!added ? Icons.add_outlined : Icons.remove_outlined),
            onPressed: () {
              setCoin(wallet, widget.coin);
              setState(() {});
            },
          ),
        ],
      ),
    );
  }
}

class _SearchCoins extends ConsumerStatefulWidget {
  final List<Coin> coins;
  const _SearchCoins({required this.coins});

  @override
  _SearchCoinsState createState() => _SearchCoinsState();
}

class _SearchCoinsState extends ConsumerState<_SearchCoins> {
  List<Coin> _coins = [];
  final ScrollController _scrollController = ScrollController();

  bool _isLoading = false;
  // int _page = 1;
  String _keyword = "";

  @override
  void initState() {
    super.initState();
    _loadMoreData();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
              _scrollController.position.maxScrollExtent &&
          !_isLoading) {
        _loadMoreData();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _loadMoreData() async {
    setState(() {
      _isLoading = true;
    });

    search();

    setState(() {
      _isLoading = false;
    });
  }

  Future<void> search() async {
    // final searchArgs = SearchArgs(
    //   page: _page,
    //   limit: 100,
    //   keyword: _keyword,
    //   chain: "",
    //   platform: "",
    // );

    final list = allCoinList.where((element) {
      final lk = _keyword.toLowerCase();
      final cname = element.name.toLowerCase();
      final cnickname = element.nickname?.toLowerCase();
      final x = cnickname?.contains(lk) ?? false;
      return cname.contains(_keyword) || x;
    }).toList();
    setState(() {
      _coins.addAll(list);
      // _page++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return buildLayout(context, child: _build(context));
  }

  Widget _build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.navigate_before_outlined, size: 32),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: SizedBox(
          height: 40,
          child: TextField(
            decoration: const InputDecoration(
              hintText: '输入token名称或合约地址',
              contentPadding: EdgeInsets.only(bottom: 8.0),
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(
                  width: 1.0,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(
                  width: 1.0,
                  color: Colors.grey, // 设置未聚焦时的边框颜色
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(
                  width: 1.0,
                  color: Colors.blue, // 设置聚焦时的边框颜色
                ),
              ),
            ),
            onChanged: (value) {
              _keyword = value;
              // _page = 1;
              _coins = [];
              search();
            },
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: _coins.length,
              itemBuilder: (context, index) {
                final coin = _coins[index];
                return _AddCoinItem(
                  coin,
                );
              },
            ),
          ),
          if (_isLoading)
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }
}
