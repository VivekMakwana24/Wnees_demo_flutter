import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:wnees_demo/model/sampledata.dart';
import 'package:wnees_demo/values/colors.dart' as colors;
import 'package:wnees_demo/values/image_constants.dart';
import 'package:wnees_demo/values/omi_extensions.dart';
import 'package:wnees_demo/values/styles.dart';

AppBar buildAppBar(String? appbarTitle, BuildContext context) {
  return AppBar(
    centerTitle: true,
    backgroundColor: Colors.white,
    elevation: 0,
    shadowColor: Colors.black54,
    leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(Icons.arrow_back_rounded),
      color: const Color(0xff000000),
    ),
    title: Text(
      appbarTitle!,
      style: textRegularBlack(context, 0.021,color: colors.blackColor),
    ),
  );
}

