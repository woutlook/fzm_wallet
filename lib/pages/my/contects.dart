import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fzm_wallet/models/coin.dart';

import 'package:fzm_wallet/models/contact.dart';
import 'package:fzm_wallet/models/store.dart';
import 'package:fzm_wallet/pages/wallet/send_page.dart';
import 'package:fzm_wallet/provider/p.dart';
import 'package:fzm_wallet/widget/widgets.dart';

class MyContactsPage extends ConsumerStatefulWidget {
  const MyContactsPage({super.key});

  @override
  ConsumerState<MyContactsPage> createState() => _MyContactsPageState();
}

class _MyContactsPageState extends ConsumerState<MyContactsPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Widget _buildBody(context) {
    final wallet = ref.watch(walletProvider);
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          TextField(
            onChanged: (value) {
              setState(() {});
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
            child: _buildContectsList(wallet),
          ),
        ],
      ),
    );
  }

  Widget _buildContectsList(wallet) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final contectsList = ref.watch(contectsProvider);
        final coins = wallet.coinList;
        return ListView.builder(
          shrinkWrap: true,
          itemCount: contectsList.length,
          itemBuilder: (context, index) {
            final contects = contectsList[index];
            return _buildContectsItem(context, contects, coins, constraints);
          },
        );
      },
    );
  }

  @override
  Widget build(context) {
    return buildLayout(context, child: _build(context));
  }

  Widget _build(context) {
    return Scaffold(
      appBar: appBar(
        context,
        '联系人',
        trailing: IconButton(
          onPressed: () async {
            await Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const EditContractsPage();
            }));
            setState(() {});
          },
          icon: const Icon(Icons.add),
        ),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildContectsItem(context, contect, coins, constraints) {
    final coinIconList = contect.addressList?.map((e) {
      final url =
          coins.firstWhere((coin) => coin.id.toString() == e.coinId).icon ?? '';
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
        onTap: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return EditContractsPage(
                  title: '联系人详情',
                  isEdit: true,
                  contect: contect,
                );
              },
            ),
          );
          setState(() {});
        },
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
                      contect.name,
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
                      contect.phoneNum,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () async {
                        await store.removeContact(contect.name);
                        ref.invalidate(contectsProvider);
                        // setState(() {});
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ),
                  ]),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    // const Icon(
                    //   Icons.token_outlined,
                    //   color: Colors.blue,
                    // ),
                    // const SizedBox(width: 10),
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

  // void _handleDeleteContects(contects) {
  //   deleteContects(contects: contects);
  //   ref.invalidate(contectsProvider(ref.read(walletProvider).id!));
  // }
}

class EditContractsPage extends ConsumerStatefulWidget {
  final bool isEdit;
  final String title;
  final Contact? contect;
  const EditContractsPage(
      {super.key, this.isEdit = false, this.title = '添加联系人', this.contect});

  @override
  ConsumerState createState() => _EditContractsPageState();
}

class _EditContractsPageState extends ConsumerState<EditContractsPage> {
  final TextEditingController _nickNameController = TextEditingController();
  final TextEditingController _phoneNumController = TextEditingController();
  final List<TextEditingController> _addressControllerList = [];
  Contact? _contect;
  Coin? _coin;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _contect = widget.contect;
    if (_contect != null) {
      _nickNameController.text = _contect!.name;
      _phoneNumController.text = _contect!.phoneNum;
      _addressControllerList.addAll(
        _contect?.addressList
                ?.map((e) => TextEditingController(text: e.address))
                .toList() ??
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

  Future<bool> _handleSaveContects() async {
    if (_nickNameController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('请输入联系人名称')),
      );
      return false;
    }
    if (_phoneNumController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('请输入手机号码')),
      );
      return false;
    }
    _contect ??= Contact();
    _contect!.name = _nickNameController.text;
    _contect!.phoneNum = _phoneNumController.text;
    for (var i = 0; i < _addressControllerList.length; i++) {
      if (_addressControllerList[i].text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('请输入地址')),
        );
        return false;
      }
      _contect!.addressList![i].address = _addressControllerList[i].text;
    }
    await store.updateContact('', _contect!);
    ref.invalidate(contectsProvider);
    return true;
  }

  @override
  Widget build(context) {
    return buildLayout(context, child: _build(context));
  }

  Widget _build(context) {
    final wallet = ref.watch(walletProvider);
    final filterCoins = wallet.coinList;
    final coinItems = filterCoins.map((e) {
      return coinItem(
        context,
        e,
        onTap: () {
          setState(() {
            _contect ??= Contact();
            _contect!.addAddress(
                ContactsAddress(coinId: e.id.toString(), address: ''));
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
              await Navigator.push(context,
                  MaterialPageRoute(builder: (context) {
                return EditContractsPage(
                    title: '编辑联系人', isEdit: false, contect: _contect);
              }));
              setState(() {
                _addressControllerList.clear();
                final length = _contect?.addressList?.length ?? 0;
                for (var i = 0; i < length; i++) {
                  _addressControllerList.add(TextEditingController(
                      text: _contect?.addressList?[i].address));
                }
              });
            } else {
              final result = await _handleSaveContects();
              if (result && context.mounted) {
                Navigator.pop(context);
              }
            }
          },
          child: Text(!widget.isEdit ? '保存' : '编辑'),
        ),
      ),
      endDrawer:
          endDrawer(context, child: Column(children: coinItems), top: 100),
      body: InkWell(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
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
                        final to =
                            _contect?.addressList?[_selectedIndex].address ??
                                '';
                        ref.read(toAddressProvider.notifier).state = to;
                        ref.read(coinProvider.notifier).state = _coin;
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const SendPage();
                        }));
                      })
                    : blueButton('添加地址', () {
                        Scaffold.of(context).openEndDrawer();
                      });
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAddressList(context, coins) {
    return ListView.builder(
      itemCount: _contect?.addressList?.length ?? 0,
      itemBuilder: (context, index) {
        Coin? coin;
        if (_contect?.addressList?.isNotEmpty ?? false) {
          coin = coins.firstWhere((e) =>
              e.id.toString() ==
              (_contect?.addressList?[index].coinId ?? "90"));
        }
        _coin = _coin ?? coin;
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
                                  scanButton(context, size: 12,
                                      onDetect: (barcodeCapture) {
                                    final address = barcodeCapture
                                        .barcodes.first.displayValue;
                                    setState(() {
                                      _addressControllerList[index].text =
                                          address ?? '';
                                    });
                                  }),
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _addressControllerList.removeAt(index);
                                        _contect!.addressList!.removeAt(index);
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
                                  final wallet = ref.read(walletProvider);
                                  final address = wallet.getAccountAddress(
                                      chain: _coin?.chain ?? '');
                                  Clipboard.setData(
                                    ClipboardData(text: address),
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
