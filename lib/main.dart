// main.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storey_app/app_bloc_observer.dart';
import 'package:storey_app/core/routing/app_router.dart';
import 'package:storey_app/features/home/presentation/cubits/products_cubit/products_cubit.dart';
import 'package:storey_app/features/home/presentation/screens/home_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver(); // Set the Bloc observer for debugging
  await Supabase.initialize(
    url: 'https://mbprotxzhesdejdxydoo.supabase.co',
    publishableKey: 'sb_publishable_SBmeMdH44iRKFlkEz_G-1w_6IOwTUY1',
  );

  runApp(const StoreyApp());
}

class StoreyApp extends StatelessWidget {
  const StoreyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: AppRouter.generateRoute,
      debugShowCheckedModeBanner: false,
      title: 'Storey',
      theme: AppTheme.lightTheme,
      home: BlocProvider(
        create: (context) => ProductsCubit()..fetchProducts(),
        child: const HomeScreen(),
      ),
    );
  }
}
