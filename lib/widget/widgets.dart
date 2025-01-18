import 'package:ai_barcode_scanner/ai_barcode_scanner.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:fzm_wallet/models/const/app_colors.dart';
import 'package:fzm_wallet/models/store.dart';
import 'package:fzm_wallet/models/wapi.dart';
import 'package:fzm_wallet/utils/app_utils.dart';
import 'package:fzm_wallet/widget/scan.dart';

Future<String?> showPasswordDialog(context) async {
  final TextEditingController controller = TextEditingController();
  return showDialog<String?>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('输入密码'),
        content: TextField(
          controller: controller,
          obscureText: true,
          decoration: const InputDecoration(hintText: '密码'),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('取消'),
          ),
          TextButton(
            onPressed: () async {
              final password = controller.text;
              final passwordHash = store.getPasswordHash();
              final hash = hashData(password);
              if (passwordHash != hash) {
                toast("密码错误");
                return;
              }
              if (context.mounted) {
                Navigator.of(context).pop(password);
              }
            },
            child: const Text('确认'),
          ),
        ],
      );
    },
  );
}

Widget passwordInput(controller1, controller2,
    {hintText1 = '请输入密码', hintText2 = '请重新输入密码'}) {
  return Column(
    children: [
      TextField(
        obscureText: true,
        controller: controller1,
        decoration: InputDecoration(
          labelText: '请输入8-16位密码, 包含字母和数字',
          labelStyle: TextStyle(color: AppColors.grayd9, fontSize: 14),
          floatingLabelStyle: TextStyle(color: AppColors.button, fontSize: 12),
          hintText: hintText1,
          hintStyle: TextStyle(
            color: AppColors.grayd9,
            fontSize: 14,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      const SizedBox(height: 10),
      TextField(
        obscureText: true,
        controller: controller2,
        decoration: InputDecoration(
          hintText: hintText2,
          hintStyle: TextStyle(
            color: AppColors.grayd9,
            fontSize: 14,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    ],
  );
}

Widget normalInput(
  controller,
  hintText, {
  String? labelText,
  obscureText = false,
  keyboardType = TextInputType.text,
  bool isNumber = false,
  bool disable = false,
}) {
  return TextField(
    controller: controller,
    keyboardType: keyboardType,
    obscureText: obscureText,
    inputFormatters: isNumber ? [FilteringTextInputFormatter.digitsOnly] : null,
    enabled: !disable,
    decoration: InputDecoration(
      labelText: labelText,
      labelStyle: TextStyle(color: AppColors.grayd9, fontSize: 14),
      floatingLabelStyle: TextStyle(color: AppColors.button, fontSize: 12),
      hintText: hintText,
      hintStyle: TextStyle(
        color: AppColors.grayd9,
        fontSize: 14,
        fontWeight: FontWeight.normal,
      ),
    ),
  );
}

Widget blackButton(text, onPressed, {double width = double.infinity}) {
  return Container(
    height: 45,
    width: width,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(6),
      color: AppColors.gray6,
    ),
    child: TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(fontSize: 16, color: Colors.white),
      ),
    ),
  );
}

Widget blueButton(text, onPressed, {double width = double.infinity}) {
  return Container(
    height: 45,
    width: width,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(6),
      color: AppColors.button,
    ),
    child: TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(fontSize: 16, color: Colors.white),
      ),
    ),
  );
}

Widget appBarTitle(title, {color = Colors.white}) {
  return Text(
    title,
    style: TextStyle(
      fontSize: 24,
      color: color,
    ),
  );
}

Widget appBarLeading(context, {onPressed, color = Colors.black}) {
  return IconButton(
    icon: Icon(Icons.navigate_before_outlined, size: 32, color: color),
    onPressed: onPressed ??
        () {
          Navigator.pop(context);
        },
  );
}

AppBar appBar(
  context,
  titleText, {
  Widget? title,
  Widget? leading,
  Widget? trailing,
  bgColor = Colors.white,
  titleColor = Colors.black,
  leadingColor = Colors.black,
}) {
  return AppBar(
    centerTitle: true,
    backgroundColor: bgColor,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Align(
            alignment: Alignment.centerLeft,
            child: leading ?? appBarLeading(context, color: leadingColor),
          ),
        ),
        title ?? appBarTitle(titleText, color: titleColor),
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: trailing ?? Container(),
          ),
        ),
      ],
    ),
    actions: [Container()],
    automaticallyImplyLeading: false,
  );
}

Widget scanButton(context,
    {required Function(BarcodeCapture) onDetect,
    double size = 32,
    color = Colors.black}) {
  return InkWell(
    onTap: () {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ScanPage(onScan: onDetect),
        ),
      );
    },
    child: SizedBox(
      width: size,
      height: size,
      child: Image.asset(
        "assets/images/home_top_left.png",
      ),
    ),
  );
}

Widget multLinesInput(controller, hintText,
    {maxLines = 3, bool isMnem = true, double hight = 100}) {
  return Column(
    children: [
      Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.only(left: 20, right: 20),
        height: hight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: AppColors.line,
        ),
        child: TextField(
          maxLines: maxLines,
          controller: controller,
          decoration: InputDecoration(
            focusedBorder: InputBorder.none,
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: TextStyle(
              color: AppColors.gray8e,
              fontSize: 15,
              fontWeight: FontWeight.normal,
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 15),
          ),
        ),
      ),
      isMnem
          ? Container(
              margin: const EdgeInsets.only(top: 10, bottom: 10),
              alignment: Alignment.center,
              child: Text(
                "钱包支持导入所有遵循BIP标准生成的助记词",
                style: TextStyle(color: AppColors.button, fontSize: 14),
              ),
            )
          : Container(),
    ],
  );
}

Widget endDrawer(context,
    {Widget? child,
    double width = 300,
    double height = 150,
    double top = 100}) {
  return Container(
    width: width,
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
      ),
    ),
    padding: EdgeInsets.only(left: 20, top: top, bottom: 0),
    child: Column(
      children: [
        Expanded(
          child: Container(
            height: MediaQuery.of(context).size.height - height,
            decoration: BoxDecoration(
              color: Colors.white.withAlpha(255),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
            ),
            child: SingleChildScrollView(
              child: child,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget coinItem(context, coin, {Widget? trailing, Function()? onTap}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      height: 70,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          //withOpacity不透明度
          color: Colors.black.withAlpha(25),
          //模糊半径
          blurRadius: 5,
          //扩散半径
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
          SizedBox(
            width: 32,
            height: 32,
            child: Image.network(coin.icon ?? "",
                width: 32, height: 32, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              coin.name ?? "",
              style: TextStyle(
                  color: AppColors.gray33,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text(
              "(${coin.nickname})",
              style: TextStyle(color: AppColors.gray8e, fontSize: 12),
            ),
          ),
          const Spacer(),
          trailing ?? Container(),
        ],
      ),
    ),
  );
}

const double myMaxWidth = 800.0;
const double myMaxHeight = 1000.0;
Widget buildLayout(context,
    {required Widget child, double? maxWidth, double? maxHeight}) {
  return Container(
    color: Theme.of(context).colorScheme.surfaceBright,
    child: Center(
      child: Container(
        constraints: BoxConstraints(
          maxWidth: maxWidth ?? myMaxWidth,
          maxHeight: maxHeight ?? myMaxHeight,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.shadow,
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        // child: child,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: child,
        ),
      ),
    ),
  );
}
