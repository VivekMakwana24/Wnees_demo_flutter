import 'package:hive/hive.dart';
import 'package:wnees_demo/model/user.dart';

import '../locator.dart';

class AppDB {
  static const _appDbBox = '_appDbBox';
  static const fcmKey = 'fcm_key';
  static const platform = 'platform';
  final Box<dynamic> _box;

  AppDB._(this._box);

  static Future<AppDB> getInstance() async {
    final box = await Hive.openBox<dynamic>(_appDbBox);
    return AppDB._(box);
  }

  T getValue<T>(dynamic key, {T? defaultValue}) =>
      _box.get(key, defaultValue: defaultValue) as T;

  Future<void> setValue<T>(dynamic key, T value) => _box.put(key, value);

  User get user => getValue("user");
  
  set user(User user) => setValue("user", user);

  String get token => getValue("token", defaultValue: "");

  set token(String token) => setValue("token", token);

  String get apiKey => getValue("apiKey",
      defaultValue: "XDXxZUmC2ltIqv81TNwD/G/2E8+6iMptrh24PJhJkEyftV7Ds+iQFlcqtO4zRmAX");

  set apiKey(String update) => setValue("apiKey", update);

  logout() {
    token = "";
  }
}

final appDB = locator<AppDB>();
