import 'package:deelze/core/presentation/bloc/timer_bloc.dart';
import 'package:deelze/core/themes/app_theme.dart';
import 'package:deelze/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:deelze/features/main/home/order_history/cubit/order_history_cubit.dart';
import 'package:deelze/firebase_options.dart';

import 'package:deelze/navigation/go_rounter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:deelze/dependencies.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';

final _router = di.getIt<GoRouterNavigation>().initGoRoute();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  di.InjectionContainer.initDependencyInjection();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await di.InjectionContainer.registerHive();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (BuildContext context) =>
              di.getIt<AuthBloc>()..add(const AuthEvent.checkAuthStatus()),
        ),
        BlocProvider<TimerBloc>(
          create: (BuildContext context) => di.getIt<TimerBloc>(),
        ),
        BlocProvider<OrderHistoryCubit>(
          create: (BuildContext context) => di.getIt<OrderHistoryCubit>(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      key: GlobalKey(),
      routerConfig: _router,
      theme: mainTheme,
      builder: (context, router) {
        return Scaffold(
          body: router,
        );
      },
    );
  }
}
