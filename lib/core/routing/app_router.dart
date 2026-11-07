// core/routing/app_router.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storey_app/core/routing/routes.dart';
import 'package:storey_app/features/auth/presentation/cubits/auth_cubit/auth_cubit.dart';
import 'package:storey_app/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:storey_app/features/home/presentation/cubits/products_cubit/products_cubit.dart';
import 'package:storey_app/features/home/presentation/screens/home_screen.dart';
import 'package:storey_app/main_screen.dart';

class AppRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.signupScreen:
        return _createRoute(
          BlocProvider(create: (context) => AuthCubit(), child: SignUpScreen()),
        );
      case Routes.homeScreen:
        return _createRoute(
          BlocProvider(
            create: (context) => ProductsCubit()..fetchProducts(),
            child: HomeScreen(),
          ),
        );
      case Routes.mainScreen:
        return _createRoute(MainScreen());
      default:
        return null;
    }
  }

  static PageRouteBuilder _createRoute(Widget page) {
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 400),
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(opacity: animation, child: child);
      },
    );
  }
}
