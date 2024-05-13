import 'package:flutter/material.dart';
import 'package:inno_net_app/core/extensions/page_navigation_extension.dart';
import 'package:inno_net_app/features/common/root_bottom_navigation_bar.dart';
import 'package:page_transition/page_transition.dart';

/// [SplashScreen] is the first screen of the app.
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // delay for 2 seconds and then navigate to home screen
    Future.delayed(const Duration(seconds: 2), () {
      context.pushReplacementWithTransition(const RootBottomNavigationBar(),
          PageTransitionType.rightToLeftWithFade);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "InnoNet",
              style: Theme.of(context).textTheme.displayLarge,
            )
          ],
        ),
      ),
    ));
  }
}
