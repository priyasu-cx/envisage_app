import 'package:envisage_app/utils/colors.dart';
import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: primaryBackgroundColor,
          child: Center(
            child: Text(
              " Sign IN Page ",
              style: TextStyle(color: Colors.white),
            ),
          )),
    );
  }
}
