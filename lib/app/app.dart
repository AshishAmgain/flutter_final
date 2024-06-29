import 'package:hotel_book/app/navigator_key/navigator_key.dart';
import 'package:hotel_book/app/themes/app_theme.dart';
import 'package:hotel_book/features/auth/presentation/view/register_view.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hotel_book/features/splash/presentation/view/splash_view.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      navigatorKey: AppNavigator.navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Application',
      theme: AppTheme.getApplicationTheme(false),
      home: SplashScreen(),
    );
  }
}
