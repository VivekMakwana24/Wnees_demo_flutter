import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil_init.dart';
import 'package:hive/hive.dart';
import 'package:wnees_demo/core/navigation/navigation_service.dart';
import 'package:wnees_demo/core/navigation/routes.dart';
import 'package:wnees_demo/model/user.dart';
import 'package:wnees_demo/values/string_constants.dart';
import 'package:wnees_demo/values/theme.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'core/locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());

  await setupLocator();

  HttpOverrides.global = MyHttpOverrides();

  runApp(MyApp());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)..maxConnectionsPerHost = 5;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: StringConstants.app_name,
      theme: appTheme,
      initialRoute: RoutesName.root,
      routes: Routes.baseRoutes,
      navigatorKey: NavigationService.navigatorKey,
      builder: (context, child) {
        return ScreenUtilInit(
            allowFontScaling: false,
            designSize: Size(MediaQuery.of(context).size.width,
                MediaQuery.of(context).size.height),
            child: child);
      },
    );
  }
}
