import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fwallet/const/app_colors.dart';

class MyPageItem extends StatefulWidget {
  final String imgUri;
  final String title;
  final Function()? onTap;

  const MyPageItem(this.imgUri, this.title, {super.key, this.onTap});

  @override
  State<MyPageItem> createState() => _MyPageItemState();
}

class _MyPageItemState extends State<MyPageItem> {
  @override
  void initState() {
    super.initState();
    // setState(() {
    //   _isPressed = false;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: InkWell(
        // onTapDown: (value) {
        //   setState(() {
        //     _isPressed = true;
        //   });
        // },
        // onTapUp: (value) {
        //   setState(() {
        //     _isPressed = false;
        //   });
        // },
        onTap: () {
          if (widget.onTap != null) {
            widget.onTap!();
          }
        },
        child: Container(
          // color: _isPressed ? Colors.white10 : Colors.white,
          height: 50,
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image(
                    image: AssetImage(widget.imgUri),
                    width: 25,
                    height: 25,
                  ),
                  const Padding(padding: EdgeInsets.only(left: 20)),
                  Text(
                    widget.title,
                    style: TextStyle(color: AppColors.gray33, fontSize: 16),
                  ),
                ],
              ),
              SvgPicture.asset(
                "images/ic_right.svg",
                width: 16,
                height: 16,
              )
            ],
          ),
        ),
      ),
    );
  }
}
