import 'package:deelze/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:deelze/navigation/router_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.maybeWhen(
          loggedIn: () {
            context.replace('${RoutePaths.authWrapper}/${RoutePaths.home}');
          },
          loggedOut: () {
            context.replace('${RoutePaths.authWrapper}/${RoutePaths.intro}');
          },
          orElse: () {},
        );
      },
      child: Container(),
    );
  }
}
