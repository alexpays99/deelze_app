import 'package:deelze/core/helpers/ticker.dart';
import 'package:deelze/core/keys/box_names.dart';
import 'package:deelze/core/presentation/bloc/timer_bloc.dart';
import 'package:deelze/features/auth/domain/repository/aut_service.dart';
import 'package:deelze/features/auth/domain/repository/user_storage_service.dart';
import 'package:deelze/features/main/data/favourite_item/favourite_item.dart';
import 'package:deelze/features/main/data/servicers/hive_service.dart';
import 'package:deelze/features/main/data/servicers/main_service.dart';
import 'package:deelze/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:deelze/features/main/home/order_history/cubit/order_history_cubit.dart';
import 'package:deelze/navigation/go_rounter.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

GetIt getIt = GetIt.instance;

abstract class InjectionContainer {
  static void initDependencyInjection() async {
    // Side packages
    getIt.registerLazySingleton<Dio>(() => Dio());

    // Providers

    // Repositories

    // Data sourses

    // Services
    getIt.registerLazySingleton<MainService>(
      () => MainService(getIt.get<Dio>()),
    );
    getIt.registerLazySingleton<HiveService>(() => HiveService());
    getIt.registerLazySingleton<UserStorageService>(() => UserStorageService());
    getIt.registerLazySingleton<AuthServive>(() => AuthServive(
          userStorageService: getIt.get<UserStorageService>(),
        ));

    // Blocs and Cubits
    getIt.registerLazySingleton(() => AuthBloc());
    getIt.registerLazySingleton(() => TimerBloc(ticker: Ticker()));
    getIt.registerLazySingleton(() => OrderHistoryCubit());

    // Go Router
    getIt.registerFactory(() => GoRouterNavigation());
  }

  // Local storages
  static Future<void> registerHive() async {
    final appDocumentDirectory =
        await path_provider.getApplicationDocumentsDirectory();
    Hive.init(appDocumentDirectory.path);
    Hive.registerAdapter(FavouriteItemAdapter());
    await Hive.openBox(BoxName.favouriteItems);
  }
}
