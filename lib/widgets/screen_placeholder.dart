// @dart=2.9

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wnees_demo/values/colors.dart';
import 'package:wnees_demo/values/image_constants.dart';
import 'package:wnees_demo/values/string_constants.dart';
import 'package:wnees_demo/values/styles.dart';

class ScreenPlaceOrder extends StatefulWidget {
  String message;
  String icon;

  ScreenPlaceOrder({this.message, this.icon});

  @override
  _ScreenPlaceOrderState createState() => _ScreenPlaceOrderState();
}

class _ScreenPlaceOrderState extends State<ScreenPlaceOrder> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ImageIcon(
            AssetImage(widget.icon ?? ImageConstants.wnees_img),
            size: 70,
            color: greyColor,
          ),
          Visibility(
              visible: widget.message.isNotEmpty,
              child: SizedBox(height: 10.h)),
          Visibility(
            visible: widget.message.isNotEmpty,
            child: Text(
              widget.message ?? StringConstants.dataNotFound,
              style: textBold.copyWith(color: greyColor),
            ),
          )
        ],
      ),
    );
  }
}
