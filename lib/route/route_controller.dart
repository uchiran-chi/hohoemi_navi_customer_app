import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';


import '../pages/first_signup_page.dart';
import '../pages/home.dart';
import '../pages/login_page.dart';

final navigatorKey = GlobalKey<NavigatorState>();

final routeProvider = Provider<GoRouter>(
  (ref) => GoRouter(
    initialLocation: '/',
    navigatorKey: navigatorKey,
    routes: [
      GoRoute(
        path: '/',
        builder: (context, _) => const LoginPage(),
      ),
      GoRoute(
        path: '/first_signup_page',
        builder: (context, _) => const FirstSignUpPage(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, _) => const Home(),
      ),
    ],
  ),
);
