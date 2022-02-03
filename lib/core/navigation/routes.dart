import 'package:flutter/cupertino.dart';
import 'package:wnees_demo/splash/splash.dart';
import 'package:wnees_demo/ui/auth/login/login_page.dart';
import 'package:wnees_demo/ui/auth/otpverification/otp_verification_page.dart';
import 'package:wnees_demo/ui/dashboard/category/category_page.dart';
import 'package:wnees_demo/ui/dashboard/entertainer_profile/entertainer_profile_page.dart';
import 'package:wnees_demo/ui/dashboard/home/home_page.dart';
import 'package:wnees_demo/ui/dashboard/services/service_page.dart';

class RoutesName {
  static const String root = "splash";
  static const String login = "/login";
  static const String otpVerification = "/otpverification";
  static const String home = "/home";
  static const String category = "/category";
  static const String service = "/service";
  static const String entertainerProfile = "/entertainerProfile";
}

class Routes {
  static final baseRoutes = <String, WidgetBuilder>{
    RoutesName.root: (context) {
      return SplashPage();
    },
    RoutesName.login: (context) {
      return LoginPage();
    },
    RoutesName.otpVerification: (context) {
      return OtpVerificationPage();
    },
    RoutesName.home: (context) {
      return HomePage();
    },
    RoutesName.category: (context) {
      return CategoryPage();
    },
    RoutesName.service: (context) {
      return EntertainerServicePage();
    },
    RoutesName.entertainerProfile: (context) {
      return EntertainerProfile();
    },
  };
}
