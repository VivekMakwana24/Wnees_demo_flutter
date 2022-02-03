import 'package:get_it/get_it.dart';
import 'package:wnees_demo/di/api/enc_text.dart';
import 'package:wnees_demo/di/api/http_client.dart';
import 'package:wnees_demo/di/api/repository/auth_repo.dart';
import 'package:wnees_demo/di/api/repository/user_repo.dart';
import 'package:wnees_demo/di/api/service/auth_service.dart';
import 'package:wnees_demo/di/api/service/user_service.dart';
import 'package:wnees_demo/ui/auth/auth_store/auth_store.dart';

import 'db/app_db.dart';
import 'navigation/navigation_service.dart';

GetIt locator = GetIt.I;

setupLocator() async {
  locator.registerSingleton<AuthStore>(AuthStore());
  locator.registerLazySingleton<AuthRepository>(() => AuthRepository());
  locator.registerLazySingleton<AuthService>(() => AuthService());

  locator.registerLazySingleton<UserRepository>(() => UserRepository());
  locator.registerLazySingleton<UserService>(() => UserService());

  locator.registerSingleton(HttpClient());
  locator.registerSingleton(NavigationService());
  locator.registerSingleton(EncText());

  locator.registerSingletonAsync<AppDB>(() => AppDB.getInstance());

/*  locator
      .registerLazySingleton<UserProfileServices>(() => UserProfileServices());
  locator.registerLazySingleton<AddressServices>(() => AddressServices());
  locator.registerLazySingleton<StoreServices>(() => StoreServices());
  locator.registerLazySingleton<CartService>(() => CartService());
  locator.registerLazySingleton<OrderService>(() => OrderService());
  locator.registerLazySingleton<ChatServices>(() => ChatServices());
  locator.registerLazySingleton<BankServices>(() => BankServices());


  locator.registerLazySingleton<UserProfileRepository>(
      () => UserProfileRepository());
  locator.registerLazySingleton<AddressRepository>(() => AddressRepository());
  locator.registerLazySingleton<StoreRepository>(() => StoreRepository());
  locator.registerLazySingleton<CartRepository>(() => CartRepository());
  locator.registerLazySingleton<OrderRepository>(() => OrderRepository());
  locator.registerLazySingleton<ChatRepository>(() => ChatRepository());
  locator.registerLazySingleton<BankRepository>(() => BankRepository());


  locator.registerLazySingleton<VerifyOtp>(() => VerifyOtp());
  locator.registerLazySingleton<AddMore>(() => AddMore());
  locator.registerLazySingleton<AddressUpdate>(() => AddressUpdate());
  locator.registerLazySingleton<AddressList>(() => AddressList());
  locator.registerLazySingleton<StoreApiStore>(() => StoreApiStore());
  locator.registerLazySingleton<ProfileStore>(() => ProfileStore());
  locator.registerLazySingleton<CartApi>(() => CartApi());
  locator.registerLazySingleton<OrderApi>(() => OrderApi());
  locator.registerLazySingleton<ChatApi>(() => ChatApi());
  locator.registerLazySingleton<BankApi>(() => BankApi());*/

}
