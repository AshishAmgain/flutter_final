import 'package:hotel_book/app/navigator/navigator.dart';
import 'package:hotel_book/features/dashboard/presentation/view/dashboard_view.dart';

class DashboardViewNavigator {}

mixin DashboardViewRoute {
  openDashBoardView() {
    NavigateRoute.pushRoute(DashboardView());
  }
}
