import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fzm_wallet/provider/p.dart';

class WalletItem extends ConsumerWidget {
  final Widget widget;
  final String name;
  final Function() onTap;
  final Function()? del;

  const WalletItem(this.widget, this.onTap,
      {super.key, this.del, required this.name});

  @override
  Widget build(context, ref) {
    final wallet = ref.watch(walletProvider);
    return _buildWalletItem(context, ref, onTap, wallet, widget);
  }

  Widget _buildWalletItem(context, ref, onTap, wallet, widget) {
    double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth > 400) {
      screenWidth = 400;
    }
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: screenWidth * 0.8,
        height: screenWidth * 0.8 * 0.4,
        child: Stack(
          children: [
            Positioned.fill(
              child: Image(
                image: AssetImage('assets/images/my_wallet_bg_black.png'),
                fit: BoxFit.fill,
              ),
            ),
            if (wallet.name == name)
              Positioned(
                top: -4,
                right: 0,
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/images/my_wallet_current.png',
                      width: 80,
                      height: 30,
                    ),
                    const Positioned(
                      left: 16,
                      top: 8,
                      child: Text(
                        '当前选中',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            Positioned(
              left: 0,
              top: 40,
              // bottom: 0,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Image.asset(
                  'assets/images/my_wallet_coins.png',
                  width: 40,
                  height: 40,
                ),
              ),
            ),
            Positioned(
              left: 20,
              top: 20,
              child: widget,
            ),
            Positioned(
              bottom: -4,
              right: -4,
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
      ),
    );
  }
}
