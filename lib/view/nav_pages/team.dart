import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:envisage_app/utils/colors.dart';

class Team extends StatefulWidget {
  const Team({Key? key}) : super(key: key);

  @override
  State<Team> createState() => _TeamState();
}

class _TeamState extends State<Team> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBackgroundColor,
      body: Column(
          children: [
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(
                  bottom: 10,top: Get.height*0.12,// Space between underline and text
                left: Get.width*0.4,right: Get.width*0.4,
              ),
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(
                    color: primaryHighlightColor,
                    width: 3.0, // Underline thickness
                  ))
              ),
              child: Text(
                "Team",
                style: TextStyle(
                  color: primaryHighlightColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w200,
                ),
              ),
            ),
            SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: Get.height*0.01, horizontal: Get.width*0.01),
              child: Column(
                children: [

                ]
              )
            )
          ]
      ),
    );
  }
}
