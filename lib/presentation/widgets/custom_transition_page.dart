import 'package:flutter/material.dart';
import 'package:flutter_restaurant_fic5/presentation/pages/detail_restaurant_page.dart';
import 'package:go_router/go_router.dart';

import '../../data/local_datasources/local_datasource.dart';
import '../pages/home_page.dart';
import '../pages/login_page.dart';
import '../pages/register_page.dart';
import '../pages/restaurant_page.dart';

CustomTransitionPage buildPageWithDefaultTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage(
    key: state.pageKey,
    child: child,
    transitionDuration: const Duration(milliseconds: 250),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(opacity: animation, child: child);
    },
  );
}

final router = GoRouter(
  initialLocation: HomePage.routeName,
  routes: [
    GoRoute(
      path: LoginPage.routeName,
      builder: (context, state) => const LoginPage(),
      pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: const LoginPage(),
      ),
    ),
    GoRoute(
      path: RegisterPage.routeName,
      builder: (context, state) => const RegisterPage(),
      pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: const RegisterPage(),
      ),
    ),
    GoRoute(
      path: HomePage.routeName,
      builder: (context, state) => const HomePage(),
      pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: const HomePage(),
      ),
    ),
    GoRoute(
      path: RestaurantPage.routeName,
      builder: (context, state) => const RestaurantPage(),
      pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: const RestaurantPage(),
      ),
      redirect: (context, state) async {
        final isLogin = await LocalDataSource().isLogin();
        if (isLogin) {
          return null;
        } else {
          return LoginPage.routeName;
        }
      },
    ),
    GoRoute(
      path: '${DetailRestaurantPage.routeName}/:restaurantId',
      builder: (context, state) => DetailRestaurantPage(
        id: int.parse(state.pathParameters['restaurantId']!),
      ),
      // pageBuilder: (context, state) => buildPageWithDefaultTransition(
      //   context: context,
      //   state: state,
      //   child: DetailRestaurantPage(
      //     id: int.parse(state.pathParameters['restaurantId']!),
      //   ),
      // ),
    ),
  ],
);
