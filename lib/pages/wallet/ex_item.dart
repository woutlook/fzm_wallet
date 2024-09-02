import 'package:flutter/material.dart';
import 'package:fwallet/bean/ex_bean.dart';
import 'package:fwallet/const/app_colors.dart';

class ExItem extends StatelessWidget {
  final Apps app;

  const ExItem(this.app, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Row(
        children: [
          app.icon != null
              ? SizedBox(
                  height: 40,
                  width: 40,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.network(app.icon ?? ""),
                  ),
                )
              : const Text(""),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  app.name ?? "",
                  style: TextStyle(
                      color: AppColors.gray33,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  app.slogan ?? "",
                  style: TextStyle(color: AppColors.gray33, fontSize: 13),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
