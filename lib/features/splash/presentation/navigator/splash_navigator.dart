import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hotel_book/app/navigator/navigator.dart';
import 'package:hotel_book/features/auth/presentation/view/login_view.dart';

import '../../../auth/presentation/navigator/login_navigator.dart';

final splashViewNavigatorProvider = Provider((ref) => SplashViewNavigator());

class SplashViewNavigator with LoginViewRoute {} //open from splash screen

mixin SplashViewRoute {
  openSplashView() {
    NavigateRoute.pushRoute(const LoginStateful());
  }
}   //used for opening splash screen
