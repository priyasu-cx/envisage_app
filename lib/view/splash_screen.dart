import 'package:envisage_app/utils/colors.dart';
import 'package:envisage_app/view/onboarding/onboarding_screen1.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (_) => OnboardingScreen1(),
      ));
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: primaryBackgroundColor,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(89),
              child: Center(
                child: Image.asset("assets/envisage_logo.png"),
              ),
            ),
            Positioned(
              child: Image.asset("assets/splash_screen/ellipse_top.png"),
              right: 0,
              top: 0,
              width: MediaQuery.of(context).size.width * 0.5,
            ),
            Positioned(
              child:
                  Image.asset("assets/splash_screen/ellipse_bottom_left.png"),
              left: 0,
              bottom: 0,
              width: MediaQuery.of(context).size.width * 0.5,
            ),
            Positioned(
              child:
                  Image.asset("assets/splash_screen/ellipse_bottom_right.png"),
              right: 0,
              bottom: 0,
              width: MediaQuery.of(context).size.width * 0.5,
            ),
          ],
        ),
      ),
    );
  }
}
