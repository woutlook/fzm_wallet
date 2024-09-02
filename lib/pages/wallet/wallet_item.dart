import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fwallet/provider/p.dart';

class WalletItem extends ConsumerWidget {
  final Widget widget;
  final int wid;
  final Function() onTap;
  final Function()? del;

  const WalletItem(this.widget, this.onTap,
      {super.key, required this.wid, this.del});

  @override
  Widget build(context, ref) {
    final wallet = ref.watch(walletProvider);
    return _buildWalletItem(context, ref, widget, onTap, wallet);
  }

  Widget _buildWalletItem(context, ref, widget, onTap, wallet) {
    return InkWell(
      onTap: onTap,
      child: Stack(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 10, top: 0),
            child: Image(
              image: AssetImage('images/my_wallet_bg_black.png'),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Spacer(),
                  wallet.id == wid
                      ? Stack(
                          children: [
                            ClipRect(
                              child: Align(
                                alignment: Alignment.center,
                                heightFactor: 0.70,
                                child: Image.asset(
                                  'images/my_wallet_current.png',
                                  width: 80,
                                  height: 30,
                                ),
                              ),
                            ),
                            const Positioned(
                              left: 16,
                              top: 2,
                              child: Text(
                                '当前选中',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 11),
                              ),
                            ),
                          ],
                        )
                      : const SizedBox(height: 20),
                ],
              ),
              widget,
            ],
          ),
          Positioned(
            left: 0,
            top: 40,
            // bottom: 0,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Image.asset(
                'images/my_wallet_coins.png',
                width: 40,
                height: 40,
              ),
            ),
          ),
          Positioned(
            right: 10,
            bottom: 0,
            child: IconButton(
              onPressed: del,
              icon: const Icon(
                Icons.delete_forever_outlined,
                color: Colors.red,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
