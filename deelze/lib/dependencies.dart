import 'package:deelze/core/helpers/ticker.dart';
import 'package:deelze/core/presentation/bloc/timer_bloc.dart';
import 'package:deelze/features/main/data/servicers/main_service.dart';
import 'package:deelze/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:deelze/features/main/home/order_history/cubit/order_history_cubit.dart';
import 'package:deelze/navigation/go_rounter.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

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

    // Blocs and Cubits
    getIt.registerLazySingleton(() => AuthBloc());
    getIt.registerLazySingleton(() => TimerBloc(ticker: Ticker()));
    getIt.registerLazySingleton(() => OrderHistoryCubit());

    // Go Router
    getIt.registerFactory(() => GoRouterNavigation());
  }
}
