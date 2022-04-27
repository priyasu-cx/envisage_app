import 'package:envisage_app/utils/colors.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: primaryBackgroundColor,
        padding: const EdgeInsets.all(89),
        child: Center(
          child: Image.asset("assets/envisage_logo.png"),
        ),
      ),
    );
  }
}
