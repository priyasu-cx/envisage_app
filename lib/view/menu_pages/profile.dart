import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:envisage_app/utils/colors.dart';
import 'package:iconly/iconly.dart';

class profile extends StatefulWidget {
  const profile({Key? key}) : super(key: key);

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBackgroundColor,
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(child:SafeArea(
            child: Container(
                child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          IconButton(icon: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
                            onPressed: (){
                              setState(() {
                                //print("Hello World");
                                Get.back();
                              });
                            },),

                          IconButton(onPressed: (){},icon: Icon(IconlyBold.arrow_down_square,color: Colors.white,),),
                        ]
                    )
                )
            )
        ),preferredSize: Size.fromHeight(Get.height*0.1),),


      body: Column(
        children: [
          Container(
          padding: EdgeInsets.only(top: Get.height*0.13, left: Get.width*0.02,right: Get.width*0.02),
          //alignment: Alignment.topCenter,
          child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CircleAvatar(
              radius: Get.width*0.12,
              backgroundColor: Colors.black,
              backgroundImage: AssetImage("assets/envisage_logo.png"),
              onBackgroundImageError: null,
            ),
            SizedBox(height: Get.height*0.02),
            Text("Name Name", style: TextStyle(
              color: Colors.white,
              letterSpacing: 3,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )),
            SizedBox(height: Get.height*0.02),
            SizedBox(width: Get.width*0.5, height: 50, child:
            MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              minWidth: 60,
              color: primaryHighlightColor,
              onPressed: (){},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Icon(IconlyLight.ticket_star, color: Colors.white,),
                  SizedBox(width: Get.width*0.01),
                  Text("EVG22iufrgiku",style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),),
                ],
              )
            ),),
          ],
          )
          ),
          Container(
            alignment: Alignment.topLeft,
              padding: EdgeInsets.only(left: Get.width*0.1,right: Get.width*0.1),
              child:Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      bottom: 10,top: Get.width*0.05 // Space between underline and text
                    ),
                    decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(
                          color: primaryHighlightColor,
                          width: 3.0, // Underline thickness
                        ))
                    ),
                    child: Text(
                      "About",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ),

                ]
              ))

      ],),);
  }
}

