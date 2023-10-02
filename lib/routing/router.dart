import 'package:cinnamon_riverpod_2/features/onboarding/view/onboarding_page.dart';
import 'package:cinnamon_riverpod_2/features/onboarding/view/start_page.dart';
import 'package:cinnamon_riverpod_2/features/planner/planner_home/planner_home_page.dart';
import 'package:cinnamon_riverpod_2/features/signup/view/signup_page.dart';
import 'package:cinnamon_riverpod_2/features/splash/view/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RoutePaths {
  static const splash = '/';
  static const home = '/home';
  static const onboarding = '/onboarding';
  static const start = '/start';
  static const signup = '/signup';
}

final GoRouter router = GoRouter(
  initialLocation: RoutePaths.splash,
  observers: [SimpleNavigationObserver()],
  routes: <RouteBase>[
    GoRoute(
      path: RoutePaths.splash,
      builder: (BuildContext context, GoRouterState state) {
        return const SplashPage();
      },
      routes: const [],
    ),
    GoRoute(
      path: RoutePaths.home,
      builder: (BuildContext context, GoRouterState state) {
        return const PlannerHomePage();
      },
      routes: const [],
    ),
    GoRoute(
      path: RoutePaths.onboarding,
      builder: (BuildContext context, GoRouterState state) {
        return const OnboardingPage();
      },
      routes: const [],
    ),
    GoRoute(
      path: RoutePaths.start,
      builder: (BuildContext context, GoRouterState state) {
        return const StartPage();
      },
      routes: const [],
    ),
    GoRoute(
      path: RoutePaths.signup,
      builder: (BuildContext context, GoRouterState state) {
        return SignupPage();
      },
      routes: const [],
    ),
  ],
);

class SimpleNavigationObserver extends RouteObserver {
  static String? currentRoute = RoutePaths.splash;

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (route.settings.name != null) currentRoute = route.settings.name;
    super.didPush(route, previousRoute);
  }
}
