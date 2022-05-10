import 'dart:ui';
import 'package:envisage_app/view/notification.dart';
import 'package:flutter/material.dart';
import 'package:envisage_app/utils/colors.dart';
import 'package:iconly/iconly.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:scroll_loop_auto_scroll/scroll_loop_auto_scroll.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

List<Map> sponser = [
  {
    'name':'unstop | Formerly D2C',
    'type': 'Powered By',
    'logo': 'assets/Sponsors/unstop.png',
  },
  {
    'name':'Learning While Travelling',
    'type': 'Knowledge Partner',
    'logo': 'assets/Sponsors/lwt.png',
  },
  {
    'name':'Freeflow',
    'type': 'Ecosystem Partner',
    'logo': 'assets/Sponsors/freeflow.png',
  },
  {
    'name':'Solvoix',
    'type': 'Event Partner',
    'logo': 'assets/Sponsors/solvoix.png',
  },
  {
    'name': "Co Founder's Planet",
    'type': 'Event Partner \nfor Biz-Plan Event',
    'logo': 'assets/Sponsors/cofounder.png',
  },

];


class Sponser extends StatelessWidget {
  const Sponser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBackgroundColor,
      appBar: PreferredSize(
        child: SafeArea(
            child: Container(
              // child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Get.width * 0.03,vertical: Get.height*0.01,),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(IconlyLight.arrow_left,
                            color: Colors.white),
                        onPressed: () {
                          Get.back();
                        },
                      ),
                      Text(
                        "Sponsors",
                        style: TextStyle(
                          color: Colors.white,
                          letterSpacing: 3,
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      IconButton(
                        onPressed: () {Get.to(() => NotificationPage());},
                        icon: Icon(
                          IconlyLight.notification,
                          color: Colors.white,
                        ),
                      ),
                    ]))),
        preferredSize: Size.fromHeight(Get.height * 0.1),
      ),
      body: Container(
        child: ListView.builder(
            itemBuilder: (context, index) => SponsorCard(index),
          itemCount: sponser.length,
        )
      ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: grey,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            boxShadow: const [
              BoxShadow(
                  color: Colors.deepPurpleAccent,
                  blurRadius: 20,
                  spreadRadius: 10,
                  offset: Offset(0, 0)
              ),
            ],
          ),
          padding: EdgeInsets.symmetric(vertical: 10,horizontal:10),
          child: ScrollLoopAutoScroll(
            child: Row(
              children: [
                Image.asset(sponser[0]["logo"], height: Get.height*0.1,),
                SizedBox(width: 40,),
                Image.asset(sponser[1]["logo"], height: Get.height*0.1,),
                SizedBox(width: 40,),
                Image.asset(sponser[2]["logo"], height: Get.height*0.1,),
                SizedBox(width: 40,),
                Image.asset(sponser[3]["logo"], height: Get.height*0.1,),
                SizedBox(width: 40,),
                Image.asset(sponser[4]["logo"], height: Get.height*0.1,),
                SizedBox(width: 40,),
              ],
            ),
            delay: Duration(seconds: 0),
            duration: Duration(seconds: 60),
            scrollDirection: Axis.horizontal,
          ),
        )
    );
  }
  Widget SponsorCard(index){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: Get.height*0.18),
      width: Get.width*0.8,
      child:Column(
        children: [
          Text(sponser[index]["type"], style: TextStyle(
            color: Colors.white,
            letterSpacing: 2,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),textAlign: TextAlign.center,),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 30),
            child: Image.asset(sponser[index]["logo"], width: Get.width*0.5,),
          ),
          Text(sponser[index]["name"], style: TextStyle(
            color: Colors.white,
            letterSpacing: 2,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),)
        ]
      )
    );
  }
}