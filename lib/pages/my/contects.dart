import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fwallet/bean/coin_bean.dart';
import 'package:fwallet/bean/contects.dart';
import 'package:fwallet/const/my_routers.dart';
import 'package:fwallet/provider/p.dart';
import 'package:fwallet/widget/widgets.dart';

class MyContactsPage extends ConsumerStatefulWidget {
  const MyContactsPage({super.key});

  @override
  ConsumerState<MyContactsPage> createState() => _MyContactsPageState();
}

class _MyContactsPageState extends ConsumerState<MyContactsPage> {
  final TextEditingController _searchController = TextEditingController();
  String _searchText = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(context) {
    final wallet = ref.watch(walletProvider);
    return Scaffold(
      appBar: appBar(
        context,
        '联系人',
        trailing: IconButton(
          onPressed: () async {
            await Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const EditContractsPage();
            }));
            setState(() {
              // ignore: unused_result
              // ref.refresh(contectsProvider(wallet.id!));
            });
          },
          icon: const Icon(Icons.add),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              onChanged: (value) {
                setState(() {
                  _searchText = value;
                });
              },
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final contectsList = ref.watch(contectsProvider(wallet.id!));
                  final coins = ref.watch(coinsProvider);
                  return contectsList.when(
                    data: (list) {
                      final clist = list
                          .where((element) =>
                              element.name.contains(_searchText) ||
                              element.phoneNum.contains(_searchText))
                          .toList();
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: clist.length,
                        itemBuilder: (context, index) {
                          return _buildContectsItem(
                              context, index, clist, coins, constraints);
                        },
                      );
                    },
                    loading: () {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                    error: (error, stackTrace) {
                      return Center(
                        child: Text('Error: $error'),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContectsItem(context, index, clist, coins, constraints) {
    final contects = clist[index];
    final coinIconList = contects.addressList?.map((e) {
      final url =
          coins.firstWhere((coin) => coin.netId.toString() == e.coinId).icon ??
              '';
      try {
        return Image.network(
          url,
          width: 20,
          height: 20,
        );
      } catch (e) {
        return const SizedBox();
      }
    }).toList();
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return EditContractsPage(
                title: '联系人详情',
                isEdit: true,
                contects: contects,
              );
            },
          ),
        ),
        child: Card(
          color: Colors.white,
          shadowColor: Colors.grey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          elevation: 10,
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  padding: const EdgeInsets.only(left: 20, top: 2.0, bottom: 2),
                  child: Row(children: [
                    const Icon(Icons.person, color: Colors.white),
                    const SizedBox(width: 5),
                    Text(
                      contects.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(width: 20),
                    const Icon(Icons.phone_android_outlined,
                        color: Colors.white),
                    const SizedBox(width: 5),
                    Text(
                      contects.phoneNum,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ]),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(
                      Icons.token_outlined,
                      color: Colors.blue,
                    ),
                    const SizedBox(width: 10),
                    SizedBox(
                      width: constraints.maxWidth - 70,
                      child: Wrap(
                        runSpacing: 4,
                        spacing: 6,
                        children: [
                          ...coinIconList ?? [],
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class EditContractsPage extends ConsumerStatefulWidget {
  final bool isEdit;
  final String title;
  final Contects? contects;
  const EditContractsPage(
      {super.key, this.isEdit = false, this.title = '添加联系人', this.contects});

  @override
  ConsumerState createState() => _EditContractsPageState();
}

class _EditContractsPageState extends ConsumerState<EditContractsPage> {
  final TextEditingController _nickNameController = TextEditingController();
  final TextEditingController _phoneNumController = TextEditingController();
  final List<TextEditingController> _addressControllerList = [];
  Contects? _contects;
  CoinBean? _coin;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _contects = widget.contects;
    if (_contects != null) {
      _nickNameController.text = _contects!.name;
      _phoneNumController.text = _contects!.phoneNum;
      _addressControllerList.addAll(
        _contects?.addressList?.map((e) => TextEditingController()).toList() ??
            [],
      );
    }
  }

  @override
  void dispose() {
    _nickNameController.dispose();
    _phoneNumController.dispose();
    for (var e in _addressControllerList) {
      e.dispose();
    }
    super.dispose();
  }

  Widget _buildCard(child) {
    return Card(
      color: Colors.white,
      shadowColor: Colors.grey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: child,
      ),
    );
  }

  Future<void> _handleSaveContects() async {
    if (_nickNameController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('请输入联系人名称')),
      );
      return;
    }
    if (_phoneNumController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('请输入手机号码')),
      );
      return;
    }
    _contects ??= Contects();
    _contects!.name = _nickNameController.text;
    _contects!.phoneNum = _phoneNumController.text;
    _contects!.addressList?.map((e) {
      e.address =
          _addressControllerList[_contects!.addressList!.indexOf(e)].text;
    });
    final wallet = ref.watch(walletProvider);
    await saveContects(contects: _contects!, walletId: wallet.id!);
  }

  @override
  Widget build(context) {
    final coins = ref.watch(coinsProvider);
    final filterCoins = coins.where((coin) => coin.added).toList();
    final coinItems = filterCoins.map((e) {
      return coinItem(
        context,
        e,
        onTap: () {
          setState(() {
            _contects ??= Contects();
            _contects!.addAddress(
                ContactsAddress(coinId: e.netId.toString(), address: ''));
            _addressControllerList.add(TextEditingController());
          });
          Navigator.pop(context);
        },
      );
    }).toList();
    return Scaffold(
      endDrawerEnableOpenDragGesture: false,
      appBar: appBar(
        context,
        widget.title,
        trailing: TextButton(
          onPressed: () async {
            if (widget.isEdit) {
              final len = await Navigator.push(context,
                  MaterialPageRoute(builder: (context) {
                return EditContractsPage(
                    title: '编辑联系人', isEdit: false, contects: _contects);
              }));
              setState(() {
                _addressControllerList.clear();
                for (var i = 0; i < len; i++) {
                  _addressControllerList.add(TextEditingController());
                }
              });
            } else {
              await _handleSaveContects();
              if (context.mounted) {
                Navigator.pop(context, _contects?.addressList?.length ?? 0);
              }
            }
          },
          child: Text(!widget.isEdit ? '保存' : '编辑'),
        ),
      ),
      endDrawer:
          endDrawer(context, child: Column(children: coinItems), top: 100),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCard(
              Column(
                children: [
                  Row(
                    children: [
                      const Text('联系人'),
                      const SizedBox(width: 20),
                      Expanded(
                        child: normalInput(
                          _nickNameController,
                          '小于16个字符',
                          disable: widget.isEdit,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text('手机号'),
                      const SizedBox(width: 20),
                      Expanded(
                        child: normalInput(
                          _phoneNumController,
                          '手机号码',
                          keyboardType: TextInputType.phone,
                          isNumber: true,
                          disable: widget.isEdit,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Container(
                  width: 5,
                  height: 20,
                  color: Colors.blue,
                ),
                const SizedBox(width: 4),
                const Text('地址'),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: _buildAddressList(context, filterCoins),
            ),
            const SizedBox(height: 20),
            LayoutBuilder(builder: (context, filterCoins) {
              return widget.isEdit
                  ? blackButton('去转账', () {
                      Navigator.pushNamed(context, MyRouter.TRANS_PAGE,
                          arguments: {'coin': _coin, 'contects': _contects});
                    })
                  : blueButton('添加地址', () {
                      Scaffold.of(context).openEndDrawer();
                    });
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildAddressList(context, coins) {
    return ListView.builder(
      itemCount: _contects?.addressList?.length ?? 0,
      itemBuilder: (context, index) {
        CoinBean? coin;
        if (_contects?.addressList?.isNotEmpty ?? false) {
          coin = coins.firstWhere((e) =>
              e.netId.toString() ==
              (_contects?.addressList?[index].coinId ?? "90"));
        }
        return Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: InkWell(
            onTap: () {
              if (widget.isEdit) {
                setState(() {
                  _coin = coin;
                  _selectedIndex = index;
                });
              }
            },
            child: Card(
              color: Colors.white,
              shadowColor: Colors.grey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: widget.isEdit
                    ? BorderSide(
                        color:
                            _selectedIndex == index ? Colors.blue : Colors.grey,
                        width: _selectedIndex == index ? 3 : 1)
                    : BorderSide.none,
              ),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.network(coin?.icon ?? "", width: 24, height: 24),
                        const SizedBox(width: 10),
                        Text('${coin?.name}(${coin?.nickname})'),
                        const Spacer(),
                        !widget.isEdit
                            ? Row(
                                children: [
                                  scanButton(context, size: 12, (cap) {
                                    setState(() {
                                      // widget.contects!.addressList[index]
                                      //     .address = cap.barcodes.first.code.name;
                                    });
                                  }),
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _addressControllerList.removeAt(index);
                                        _contects!.addressList!.removeAt(index);
                                      });
                                    },
                                    icon: const Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                      size: 16,
                                    ),
                                  ),
                                ],
                              )
                            : IconButton(
                                onPressed: () {
                                  Clipboard.setData(
                                    ClipboardData(text: coin?.address ?? ""),
                                  );
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('地址已复制到剪贴板'),
                                    ),
                                  );
                                },
                                icon: const Icon(
                                  Icons.copy,
                                  size: 20,
                                ),
                              ),
                      ],
                    ),
                    normalInput(_addressControllerList[index], '扫描或输入地址',
                        disable: widget.isEdit),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
