// ignore_for_file: constant_identifier_names

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fwallet/api/fzm_http.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:fwallet/bean/coin_bean.dart';
import 'package:fwallet/bean/tab_coin.dart';
import 'package:fwallet/const/app_colors.dart';
import 'package:fwallet/db/db.dart';
import 'package:fwallet/provider/p.dart';

class AddCoinPage extends ConsumerStatefulWidget {
  const AddCoinPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddCoinPageState();
}

class _AddCoinPageState extends ConsumerState<AddCoinPage>
    with TickerProviderStateMixin {
  late Database _db;
  late List<TabCategory> _tabs = [];
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
    _db = await DatabaseHelper().database;
    final resp = await Http.of().get(RECOMMEND_COIN);
    final tabs = (resp.data as List)
        .map((e) => TabCategory.fromJson(e as Map<String, dynamic>))
        .toList();
    setState(() {
      _tabs = tabs.where((tab) => tab.items.isNotEmpty).toList();
      _tabController = TabController(length: 1 + _tabs.length, vsync: this);
      _isSelected = List.filled(1 + _tabs.length, false);
    });
  }

  @override
  Widget build(BuildContext context) {
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
    final coins = ref.watch(coinsProvider);

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
                    db: _db,
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
                  ..._buildTabViews(coins),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildTabViews(coins) {
    final view0 = ListView.builder(
      itemCount: coins.length,
      itemBuilder: (context, index) {
        final coin = coins[index];
        return _AddCoinItem(coin, () {
          setCoin(ref, _db, coin);
        });
      },
    );

    final list = _tabs.map((e) {
      return ListView.builder(
        itemCount: e.items.length,
        itemBuilder: (context, index) {
          final coin = e.items[index];
          coins.map((e) {
            if (coin.netId == e.netId) {
              coin.added = e.added;
            }
          }).toList();

          return _AddCoinItem(coin, () {
            setCoin(ref, _db, coin);
          });
        },
      );
    }).toList();

    return [view0, ...list];
  }
}

void setCoin(ref, db, coin) {
  final coins = ref.watch(coinsProvider);
  final wallet = ref.watch(walletProvider);
  coin.pwalletId = wallet.id;

  if (coin.address == null) {
    for (var hcoin in coins) {
      if (hcoin.chain == coin.chain && hcoin.platform == coin.platform) {
        coin.pubkey = hcoin.pubkey;
        coin.address = hcoin.address;
        coin.privkey = hcoin.privkey;
        break;
      }
    }
  }

  // if (coin.address == null) {
  //   if(coin.chain == wallet.chain && coin.platform == wallet.platform) {
  //     coin.pubkey = wallet.pubkey;
  //     coin.address = wallet.address;
  //     coin.privkey = wallet.privPey;
  //   }
  // }

  final index = coins.indexWhere((e) => e.netId == coin.netId);
  if (index != -1) {
    for (var hcoin in coins) {
      if (hcoin.netId == coin.netId) {
        hcoin.added = coin.added;
        hcoin.contract = coin.contract;
        break;
      }
    }
  } else {
    coins.add(coin);
  }
  updateCoin(db, coin);
  ref.read(coinsProvider.notifier).updateCoins(coins);
}

class _AddCoinItem extends StatefulWidget {
  final CoinBean coin;
  final Function() callback;

  const _AddCoinItem(this.coin, this.callback);

  @override
  _AddCoinItemState createState() => _AddCoinItemState();
}

class _AddCoinItemState extends State<_AddCoinItem> {
  bool _added = false;

  @override
  void initState() {
    super.initState();
    _added = widget.coin.added;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          //withOpacity不透明度
          color: Colors.black.withOpacity(0.1),
          //模糊半径
          blurRadius: 5,
          //扩散半径
          spreadRadius: 2,
        ),
        BoxShadow(
          color: Colors.white.withOpacity(0.1),
          blurRadius: 5,
          spreadRadius: 2,
        ),
      ], color: Colors.white, borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.only(left: 16, right: 16),
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          SizedBox(
            width: 32,
            height: 32,
            child: Image.network(
              widget.coin.icon ?? "",
              width: 32,
              height: 32,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.error),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.coin.name ?? "",
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
            icon: Icon(!_added ? Icons.add_outlined : Icons.remove_outlined),
            onPressed: () {
              widget.coin.added = !_added;
              setState(() {
                _added = !_added;
              });
              widget.callback();
            },
          ),
        ],
      ),
    );
  }
}

class _SearchCoins extends ConsumerStatefulWidget {
  final Database db;
  final List<CoinBean> coins;
  const _SearchCoins({required this.db, required this.coins});

  @override
  _SearchCoinsState createState() => _SearchCoinsState();
}

class _SearchCoinsState extends ConsumerState<_SearchCoins> {
  List<CoinBean> _coins = [];
  final ScrollController _scrollController = ScrollController();

  bool _isLoading = false;
  int _page = 1;
  String _keyword = "";

  @override
  void initState() {
    super.initState();
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
    final searchArgs = SearchArgs(
      page: _page,
      limit: 100,
      keyword: _keyword,
      chain: "",
      platform: "",
    );

    final resp =
        await Http.of().post(SEARCH_COIN, data: searchArgs.toJson());
    final list = (resp.data as List)
        .map((e) => CoinBean.fromJson(e as Map<String, dynamic>))
        .toList();
    setState(() {
      final coins = list.map((e) {
        e.added =
            widget.coins.any((element) => element.id == e.id && element.added);
        return e;
      }).toList();
      _coins.addAll(coins);
      _page++;
    });
  }

  @override
  Widget build(BuildContext context) {
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
              _page = 1;
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
                return _AddCoinItem(coin, () {
                  setCoin(ref, widget.db, coin);
                });
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
