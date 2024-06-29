import 'package:hotel_book/app/navigator/navigator.dart';
import 'package:hotel_book/features/auth/presentation/navigator/register_navigator.dart';
import 'package:hotel_book/features/auth/presentation/view/login_view.dart';
import 'package:hotel_book/features/dashboard/presentation/navigator/dashboard_navigator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginViewNavigatorProvider = Provider((ref) => LoginViewNavigator());

class LoginViewNavigator with RegisterViewRoute, DashboardViewRoute {}

mixin LoginViewRoute {
  openLoginView() {
    NavigateRoute.pushRoute(const LoginStateful());
  }
}
