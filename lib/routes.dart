// Mobile Pages
import 'package:libuta_sugbo_app/pages/dashboard/dashboard_page.dart';
import 'package:libuta_sugbo_app/pages/landing/landing_page.dart';
import 'package:libuta_sugbo_app/pages/splash_page.dart';
import 'package:libuta_sugbo_app/pages/auth/login_page.dart';
import 'package:libuta_sugbo_app/cubit/auth/auth_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//Imports
import 'package:go_router/go_router.dart';

// GoRouter configuration
final router = GoRouter(
  // initialLocation: '/mobile_add_store',
  initialLocation: '/splash',
  // initialLocation: '/dashboard_web',
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (context, state) => LandingPage(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => LoginPage(),
    ),
     GoRoute(
      path: '/dashboard',
      builder: (context, state) => DashboardPage(),
    ),
    GoRoute(
      path: '/splash',
      builder: (context, state) => SplashPage(),
    ),
  ],
);
