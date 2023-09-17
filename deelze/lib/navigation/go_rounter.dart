import 'package:deelze/core/presentation/network_wrapper.dart';
import 'package:deelze/features/auth/enter_code_screen/enter_code_screen.dart';
import 'package:deelze/features/auth/intro_screen/intro_scfreen.dart';
import 'package:deelze/features/auth/signup_signin_screen/signin_signup_screen.dart';
import 'package:deelze/features/main/deelse_screen/deelze_screen.dart';
import 'package:deelze/features/main/favourite_screen/favourite_screen.dart';
import 'package:deelze/features/main/home_screen/home_screen.dart';
import 'package:deelze/features/main/profile_screen/profile_screen.dart';
import 'package:deelze/navigation/bottom_navigaion_bar.dart';
import 'package:deelze/navigation/router_paths.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _sectionNavigatorHomeKey = GlobalKey<NavigatorState>(debugLabel: 'Home');
final _sectionNavigatorFavouriteKey =
    GlobalKey<NavigatorState>(debugLabel: 'Favourite');
final _sectionNavigatorProfileKey =
    GlobalKey<NavigatorState>(debugLabel: 'Profile');
final _sectionNavigatorDeelzeKey =
    GlobalKey<NavigatorState>(debugLabel: 'Deelze');

class GoRouterNavigation {
  GoRouter initGoRoute() {
    return GoRouter(
      initialLocation: RoutePaths.authWrapper,
      navigatorKey: _rootNavigatorKey,
      debugLogDiagnostics: true,
      routes: <RouteBase>[
        GoRoute(
          path: RoutePaths.authWrapper,
          name: 'authWrapper',
          builder: (context, state) => const NetworkWrapper(),
          routes: [
            GoRoute(
              path: RoutePaths.intro,
              name: RoutePaths.intro,
              builder: (context, state) => const IntroScreen(),
            ),
            GoRoute(
              path: RoutePaths.signinSignup,
              name: RoutePaths.signinSignup,
              builder: (context, state) => const SigninSignupScreen(),
            ),
            GoRoute(
              path: RoutePaths.enterCode,
              name: RoutePaths.enterCode,
              builder: (context, state) => const EnterCodeScreen(),
            ),
            StatefulShellRoute.indexedStack(
              parentNavigatorKey: _rootNavigatorKey,
              builder: (context, state, navigationShell) {
                return BottomNavigationBarWidget(
                    navigationShell: navigationShell);
              },
              branches: [
                StatefulShellBranch(
                  navigatorKey: _sectionNavigatorHomeKey,
                  routes: [
                    GoRoute(
                      path: RoutePaths.home,
                      name: RoutePaths.home,
                      pageBuilder: (context, state) => const NoTransitionPage(
                        child: HomeScreen(),
                      ),
                    ),
                  ],
                ),
                StatefulShellBranch(
                  navigatorKey: _sectionNavigatorFavouriteKey,
                  routes: <RouteBase>[
                    GoRoute(
                      path: RoutePaths.favourite,
                      name: RoutePaths.favourite,
                      pageBuilder: (context, state) => const NoTransitionPage(
                        child: FavouriteScreen(),
                      ),
                    ),
                  ],
                ),
                StatefulShellBranch(
                  navigatorKey: _sectionNavigatorProfileKey,
                  routes: <RouteBase>[
                    GoRoute(
                      path: RoutePaths.profile,
                      name: RoutePaths.profile,
                      builder: (context, state) => const ProfileScreen(),
                    ),
                  ],
                ),
                StatefulShellBranch(
                  navigatorKey: _sectionNavigatorDeelzeKey,
                  routes: <RouteBase>[
                    GoRoute(
                      path: RoutePaths.deelze,
                      name: RoutePaths.deelze,
                      builder: (context, state) => const DeelzeScreen(),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
