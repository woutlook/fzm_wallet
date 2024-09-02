import 'package:flutter/material.dart';
import 'package:fwallet/const/app_colors.dart';
import 'package:fwallet/const/my_routers.dart';

class WalletIndexPage extends StatefulWidget {
  const WalletIndexPage({super.key});

  @override
  State<StatefulWidget> createState() => _WalletIndexPage();
}

class _WalletIndexPage extends State<WalletIndexPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 0,
      ),
      body: Container(
        height: 150,
        margin: const EdgeInsets.only(top: 400,left: 20,right: 20),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColors.gray2b),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "区块链账户",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w600),
                )),
            Row(
              children: [
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            WidgetStateProperty.all(Colors.white),
                        shape: WidgetStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)))),
                    onPressed: () {
                      Navigator.pushNamed(context, MyRouter.CREATE_WALLET_PAGE);
                    },
                    child: Text(
                      "创建账户",
                      style: TextStyle(color: AppColors.gray33),
                    )),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, MyRouter.IMPORT_WALLET_PAGE);
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            WidgetStateProperty.all(AppColors.button),
                        shape: WidgetStateProperty.all(const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))))),
                    child: const Text("导入账户"),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
