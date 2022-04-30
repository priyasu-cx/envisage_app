import 'package:envisage_app/utils/colors.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
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
