import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wnees_demo/core/db/app_db.dart';
import 'package:wnees_demo/core/locator.dart';
import 'package:wnees_demo/core/navigation/navigation_service.dart';
import 'package:wnees_demo/core/navigation/routes.dart';
import 'package:wnees_demo/values/colors.dart' as colors;
import 'package:wnees_demo/values/image_constants.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  initState() {
    initSettings();

    super.initState();
  }

  Future<void> initSettings() async {
    await locator.isReady<AppDB>();

    Timer(const Duration(seconds: 2), () async {

      if (appDB.user == null) {
        navigator.pushReplacementNamed(RoutesName.login);

      } else {
        navigator.pushReplacementNamed(RoutesName.home);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: colors.primaryColor,
          image: DecorationImage(
              image: AssetImage(ImageConstants.spalsh_img),
              fit: BoxFit.cover,
              colorFilter: const ColorFilter.mode(
                  colors.primaryColor, BlendMode.color))),
    );
  }
}
