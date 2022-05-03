import 'package:envisage_app/utils/colors.dart';
import 'package:envisage_app/view/footer.dart';
//import 'package:envisage_app/view/homepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: primaryBackgroundColor,
          child: Center(
            child: TextButton(
              child: Text('Homepage', style: TextStyle(fontSize: 20.0),),
              onPressed: (){
                Get.to(()=>footer());
                //Get.to(()=>LoginView());
              },
            ),
            // child: Text(
            //   " Sign IN Page ",
            //   style: TextStyle(color: Colors.white),
            // ),
          ),
    ),);
  }
}


