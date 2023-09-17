import 'package:deelze/core/themes/app_theme.dart';
import 'package:deelze/features/auth/cubit/bloc/auth_bloc.dart';
import 'package:deelze/navigation/go_rounter.dart';
import 'package:flutter/material.dart';

import 'package:deelze/dependencies.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';

final _router = di.getIt<GoRouterNavigation>().initGoRoute();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  di.InjectionContainer.initDependencyInjection();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (BuildContext context) =>
              di.getIt<AuthBloc>()..add(const AuthEvent.checkAuthStatus()),
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
