import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hotel_book/features/auth/presentation/viewmodel/auth_view_model.dart';
import 'package:hotel_book/features/splash/presentation/viewmodel/splash_view_model.dart';

class SplashScreen extends ConsumerStatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    ));
    _animationController.forward();
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(Duration(seconds: 4), () {
          ref.read(splashViewModelProvider.notifier).openLoginView();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isTablet = MediaQuery.of(context).size.shortestSide >= 600;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FadeTransition(
              opacity: _animation,
              child: Image.asset(
                'assets/images/logo.jpg',
                width: isTablet ? 200.0 : 100.0, // Adjusted size for tablet
                height: isTablet ? 200.0 : 100.0, // Adjusted size for tablet
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Hotel-Book',
              style: TextStyle(
                fontSize: isTablet ? 32 : 24, // Adjusted size for tablet
                fontWeight: FontWeight.bold,
                color: Colors.blue, // Change text color if needed
                fontFamily: 'Montserrat', // Custom font
              ),
            ),
            SizedBox(height: 20.0),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                  Colors.blue), // Customize the color
            ),
          ],
        ),
      ),
    );
  }
}
