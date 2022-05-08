import 'package:envisage_app/utils/etalk_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:envisage_app/utils/colors.dart';
import 'package:iconly/iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';

class Constant{
  static double height(BuildContext context) =>
      MediaQuery.of(context).size.height;
  static double width(BuildContext context) =>
      MediaQuery.of(context).size.width;
}

class Etalk extends StatelessWidget {
  const Etalk({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBackgroundColor,
        body: SingleChildScrollView(child: Container(
            padding: EdgeInsets.fromLTRB(0, Get.height*0.14, 0, 0),
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                        bottom: 10,top: Get.width*0.01 // Space between underline and text
                      ),
                      decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(
                            color: primaryHighlightColor,
                            width: 3.0, // Underline thickness
                          ))
                      ),
                      child: Text(
                        "Previous E-Talk Guests",
                        style: TextStyle(
                          color: primaryHighlightColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ),
                  ]
                ),
                SizedBox(
                  height: Constant.height(context),
                  width: Constant.width(context),
                  child: ListView.builder(
                    padding: EdgeInsets.only(top:Get.height*0.02),
                    itemBuilder: (context, index) => buildContainer(index),
                    itemCount: names.length,
                  ),
                ),
                SizedBox(
                  height: 70,
                )
              ]),
            )
        ),);
  }


  Widget buildContainer(int index) {
    /// lets add some animation
    /// lets add tween some some
    return TweenAnimationBuilder<double>(
      duration: Duration(milliseconds: 760 + index),
      tween: Tween(begin: -1, end: 0.5),
      builder: (context, value, child) => Transform.translate(
        offset: Offset(value * 200 - 100, 0),
        child: child,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: grey,
        ),
        height: 100,
        width: Get.width*0.2,
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
        child: ClipRRect(
          // child: Image.network(
          //   images[index],
          //   fit: BoxFit.cover,
          // ),
          child: Row(
            children: [
                Container(
                  width: Get.width*0.4,
                  height: Get.height*1,
                  padding: EdgeInsets.all(10),
                  child: Image.network(images[index],
                  fit: BoxFit.fitHeight),
                ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(names[index], style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),)
                    ),
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text(designation[index], style: TextStyle(
                          color: Colors.black38,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),)
                    )
                  ],
                )
              )
            ]
          )
        ),
      ),
    );
  }
}
