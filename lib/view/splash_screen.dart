import 'package:envisage_app/controller/authentication/authentication_service.dart';
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
        builder: (_) => ScreenLoader(),
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
              padding:
                  EdgeInsets.all((MediaQuery.of(context).size.width * 0.23)),
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
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  " Designed and Developed by \nIIC Tech Wing ",
                  style: TextStyle(
                    color: Colors.white70,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
