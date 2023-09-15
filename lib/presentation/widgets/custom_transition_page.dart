import 'package:flutter/material.dart';
import 'package:flutter_restaurant_fic5/presentation/pages/add_restaurant_page.dart';
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
      return SlideTransition(
        position: Tween(
          begin: const Offset(1.0, 0.0),
          end: const Offset(0.0, 0.0),
        ).animate(animation),
        child: child,
      );
    },
  );
}

final router = GoRouter(
  initialLocation: '/home',
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginPage(),
      pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: const LoginPage(),
      ),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegisterPage(),
      pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: const RegisterPage(),
      ),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomePage(),
      // pageBuilder: (context, state) => buildPageWithDefaultTransition(
      //   context: context,
      //   state: state,
      //   child: const HomePage(),
      // ),
    ),
    GoRoute(
      path: '/restaurant',
      builder: (context, state) => const RestaurantPage(),
      // pageBuilder: (context, state) => buildPageWithDefaultTransition(
      //   context: context,
      //   state: state,
      //   child: const RestaurantPage(),
      // ),
      redirect: (context, state) async {
        final isLogin = await LocalDataSource().isLogin();
        if (isLogin) {
          return null;
        } else {
          return '/login';
        }
      },
    ),
    GoRoute(
      path: '/detail-restaurant/:restaurantId',
      builder: (context, state) => DetailRestaurantPage(
        id: int.parse(state.pathParameters['restaurantId']!),
      ),
      pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: DetailRestaurantPage(
          id: int.parse(state.pathParameters['restaurantId']!),
        ),
      ),
    ),
    GoRoute(
      path: '/add-restaurant',
      builder: (context, state) => const AddRestaurantPage(),
      pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: const AddRestaurantPage(),
      ),
    ),
  ],
);
