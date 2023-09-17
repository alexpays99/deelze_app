import 'package:deelze/features/auth/cubit/bloc/auth_bloc.dart';
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

    // Blocs and Cubits
    getIt.registerLazySingleton(() => AuthBloc());

    // Go Router
    getIt.registerFactory(() => GoRouterNavigation());
  }
}
