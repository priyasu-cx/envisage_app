import 'package:envisage_app/utils/TeamMembers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:ui';
import 'package:iconly/iconly.dart';
import 'package:envisage_app/utils/colors.dart';
import 'package:scroll_loop_auto_scroll/scroll_loop_auto_scroll.dart';

class Constant {
  static double height(BuildContext context) =>
      MediaQuery.of(context).size.height;
  static double width(BuildContext context) =>
      MediaQuery.of(context).size.width;
}

class Team extends StatefulWidget {
  const Team({Key? key}) : super(key: key);

  @override
  State<Team> createState() => _TeamState();
}

class _TeamState extends State<Team> {
  String listname = "Core";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBackgroundColor,
      body: SingleChildScrollView(
          child: Container(
        padding: EdgeInsets.fromLTRB(0, Get.height * 0.1, 0, 0),
        alignment: Alignment.topCenter,
        child: Column(children: [
          Container(
            padding: EdgeInsets.only(bottom: 10),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  avatar("image", "Technical\nWing"),
                  avatar("image", "Start-up\nWing"),
                  avatar("image", "Graphics\nWing"),
                  avatar("image", "Innovation\nWing"),
                  avatar("image", "PR\nWing"),
                  avatar("image", "Content\nWing"),
                  avatar("image", "Management\nWing"),
                  avatar("image", "Internship\nWing"),
                  avatar("image", "Press\nWing"),
                  avatar("image", "Social Media\nWing"),
                ],
              ),
            ),
          ),
          Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  blurRadius: 24,
                  spreadRadius: 16,
                  color: Colors.black.withOpacity(0.2),
                )
              ]),
              padding: EdgeInsets.only(top: 10),
              height: MediaQuery.of(context).size.height,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 10.0,
                      sigmaY: 10.0,
                    ),
                    child: Container(
                      padding: EdgeInsets.all(15),
                      //height: 350,
                      //width: 300,
                      decoration: BoxDecoration(
                          color: primaryHighlightColor.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(16.0),
                          border: Border.all(
                            width: 1.5,
                            color: Colors.white.withOpacity(0.2),
                          )),
                      child: WingMembers(listname),
                    ), //WingMembers(),
                  )))
        ]),
      )),
      bottomNavigationBar: Container(
        height: 5,
      ),
    );
  }

  Widget avatar(image, text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Padding(
              padding: EdgeInsets.only(
                top: Get.height * 0.03,
                bottom: Get.width * 0.03,
              ),
              child: InkWell(
                child: CircleAvatar(
                  radius: Get.width * 0.08,
                  backgroundColor: primaryHighlightColor.withAlpha(50),
                  backgroundImage:
                      AssetImage("assets/ic_launcher_adaptive_fore.png"),
                ),
                onTap: () {},
              )),
          Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }

  Widget WingMembers(listname) {
    // print(listname.length);
    return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SizedBox(
          height: Constant.height(context),
          width: Constant.width(context),
          child: ListView.builder(
            padding: EdgeInsets.only(top: 0),
            itemBuilder: (context, index) => Member(index),
            itemCount: Core.length,
            shrinkWrap: true,
          ),
        ));
  }

  Widget Member(index) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.all(10),
      //height: 250,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                decoration: BoxDecoration(
                    image: Core[index]["photoUrl"]==""?null:DecorationImage(
                        image: AssetImage("assets/loading.jpg"))),
                child: Image.network(
                  Core[index]["photoUrl"],
                  height: 120,
                  width: Get.width * 0.3,
                  fit: BoxFit.cover,
                ),
              )),
          SizedBox(
            width: 10,
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            SizedBox(
              height: Get.height * 0.05,
            ),
            Text(
              Core[index]["name"],
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.justify,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              Core[index]["designation"],
              style: TextStyle(
                color: Colors.white70,
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
          ])
        ],
      ),
    );
  }
}
