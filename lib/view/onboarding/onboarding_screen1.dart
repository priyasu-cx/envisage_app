import 'package:envisage_app/utils/colors.dart';
import 'package:envisage_app/view/authentication/sign_in.dart';
import 'package:envisage_app/view/onboarding/onboarding_screen2.dart';
import 'package:flutter/material.dart';

class OnboardingScreen1 extends StatelessWidget {
  const OnboardingScreen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _screenHeight = MediaQuery.of(context).size.height;
    final _screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        color: primaryBackgroundColor,
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(0, _screenHeight * 0.08, 0, 0),
              child: Image.asset("assets/onboarding/onboarding_screen1.png"),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                height: _screenHeight * 0.35,
                decoration: const BoxDecoration(
                  color: primaryHighlightColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(48),
                    topRight: Radius.circular(48),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                        _screenWidth * 0.06,
                        _screenWidth * 0.06,
                        _screenWidth * 0.06,
                        _screenWidth * 0.02,
                      ),
                      child: const Text(
                        " Second largest E-Summit in Kolkata ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          fontSize: 22,
                        ),
                      ),
                    ),
                    const Text(
                      " Organised by IIC TMSL, an MHRD Initiative ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignIn()));
                          },
                          child: const Text(
                            "Skip",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.white38,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        Center(
                          child: Image.asset(
                            "assets/onboarding/dots_screen1.png",
                            width: 40,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => OnboardingScreen2()));
                          },
                          child: const Text(
                            "Next",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
