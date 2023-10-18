import 'package:deelze/core/presentation/network_wrapper.dart';
import 'package:deelze/features/auth/presentation/enter_code_screen/enter_code_screen.dart';
import 'package:deelze/features/auth/presentation/intro_screen/intro_scfreen.dart';
import 'package:deelze/features/auth/presentation/signup_signin_screen/signin_signup_screen.dart';
import 'package:deelze/features/main/deelse/deelze_screen.dart';
import 'package:deelze/features/main/favourite/favourite_screen.dart';
import 'package:deelze/features/main/home/home_screen.dart';
import 'package:deelze/features/main/home/order_history/offers_history_screen.dart';
import 'package:deelze/features/main/payment_details_screen/payment_details_screen.dart';
import 'package:deelze/features/main/profile/profile_screen.dart';
import 'package:deelze/features/main/scan_qr_code_screen/scan_qr_code_screen.dart';
import 'package:deelze/features/main/vaucher_info_screen/vaucher_info_screen.dart';
import 'package:deelze/navigation/bottom_navigaion_bar.dart';
import 'package:deelze/navigation/router_paths.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _sectionNavigatorHomeKey = GlobalKey<NavigatorState>(debugLabel: 'Home');
final _sectionNavigatorFavouriteKey =
    GlobalKey<NavigatorState>(debugLabel: 'Favourite');
final _sectionNavigatorProfileKey =
    GlobalKey<NavigatorState>(debugLabel: 'Profile');
final _sectionNavigatorDeelzeKey =
    GlobalKey<NavigatorState>(debugLabel: 'Deelze');

final _sectionNavigatorOrderHistoryKey =
    GlobalKey<NavigatorState>(debugLabel: 'OrderHistory');
final _sectionNavigatorPaymentDetailsKey =
    GlobalKey<NavigatorState>(debugLabel: 'PaymentDetails');
final _sectionNavigatorScanQrCodeKey =
    GlobalKey<NavigatorState>(debugLabel: 'ScanQrCode');
final _sectionNavigatorVaucherInfoKey =
    GlobalKey<NavigatorState>(debugLabel: 'VaucherInfo');

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
              builder: (context, state) {
                final phone = state.extra;
                if (phone is String) {
                  return EnterCodeScreen(phoneNumber: phone);
                } else {
                  return Container();
                }
              },
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

                // Offers History
                StatefulShellBranch(
                  navigatorKey: _sectionNavigatorOrderHistoryKey,
                  routes: <RouteBase>[
                    GoRoute(
                      path: RoutePaths.orderHistory,
                      name: RoutePaths.orderHistory,
                      builder: (context, state) => const OffersHistoryScreen(),
                    ),
                  ],
                ),

                // Payment Details
                StatefulShellBranch(
                  navigatorKey: _sectionNavigatorPaymentDetailsKey,
                  routes: <RouteBase>[
                    GoRoute(
                      path: RoutePaths.paymentDetails,
                      name: RoutePaths.paymentDetails,
                      builder: (context, state) => const PaymentDetailsScreen(),
                    ),
                  ],
                ),

                // Scan Qr code
                StatefulShellBranch(
                  navigatorKey: _sectionNavigatorScanQrCodeKey,
                  routes: <RouteBase>[
                    GoRoute(
                      path: RoutePaths.scanQrCode,
                      name: RoutePaths.scanQrCode,
                      builder: (context, state) => const ScanQrCodeScreen(),
                    ),
                  ],
                ),

                // Vaucher Info
                StatefulShellBranch(
                  navigatorKey: _sectionNavigatorVaucherInfoKey,
                  routes: <RouteBase>[
                    GoRoute(
                      path: RoutePaths.vaucherInfo,
                      name: RoutePaths.vaucherInfo,
                      builder: (context, state) {
                        final extra = state.extra as Map<String, dynamic>;
                        final title = extra["title"];
                        final vaucher = extra["vaucher"];
                        final logo = extra["logo"];
                        final lattitude = extra["lattitude"];
                        final longitude = extra["longitude"];
                        if (title != null && vaucher != null) {
                          return VaucherInfoScreen(
                            title: title,
                            vaucher: vaucher,
                            image:
                                logo ?? 'assets/images/info_appbar_image.png',
                            lattitude: lattitude,
                            longitude: longitude,
                          );
                        } else {
                          return Container();
                        }
                      },
                      // builder: (context, state) => const VaucherInfoScreen(),
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
