import 'package:hotel_book/app/navigator_key/navigator_key.dart';
import 'package:flutter/material.dart';

class NavigateRoute {
  NavigateRoute._();
  static void pushRoute(Widget view) {
    Navigator.push(
      AppNavigator.navigatorKey.currentState!.context,
      MaterialPageRoute(builder: (context) => view),
    );
  }

  static void popAndPushRoute(Widget view) {
    Navigator.pushReplacement(AppNavigator.navigatorKey.currentState!.context,
        MaterialPageRoute(builder: (context) => view));
  }

  static void pop() {
    Navigator.pop(
      AppNavigator.navigatorKey.currentState!.context,
    );
  }
}
