import 'dart:ui';
import 'package:envisage_app/view/notification.dart';
import 'package:flutter/material.dart';
import 'package:envisage_app/utils/colors.dart';
import 'package:iconly/iconly.dart';
import 'package:get/get.dart';
import 'package:animated_radial_menu/animated_radial_menu.dart';
import 'package:url_launcher/url_launcher.dart';


class ContactUs extends StatelessWidget {
  const ContactUs({Key? key}) : super(key: key);

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
                            "Contact Us",
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
        body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: Get.height*0.08),
                  //alignment: Alignment.center,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/ic_launcher_adaptive_fore.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                          blurRadius: 24,
                          spreadRadius: 16,
                          color: Colors.black.withOpacity(0.2),
                        )
                      ]),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16.0),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 10.0,
                            sigmaY: 10.0,
                          ),
                          child: Container(
                            padding: EdgeInsets.all(15),
                            alignment: Alignment.center,
                            height: 350,
                            width: 300,
                            decoration: BoxDecoration(
                                color: primaryHighlightColor.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(16.0),
                                border: Border.all(
                                  width: 1.5,
                                  color: Colors.white.withOpacity(0.2),
                                )),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Icon(IconlyBold.location, color: Colors.white),
                                      SizedBox(width: Get.width*0.02,),
                                      Text(
                                        "TECHNO INDIA : \nEM-4/1,Sector-V, Salt Lake, \nKolkata-700091,\nWest Bengal",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white),
                                        textAlign: TextAlign.justify,
                                      ),
                                    ]
                                  ),
                                  SizedBox(height: Get.height*0.02,),
                                  Row(
                                      children: [
                                        Icon(IconlyBold.call, color: Colors.white),
                                        SizedBox(width: Get.width*0.02,),
                                        Text(
                                          "+91 8271538524",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.white),
                                          textAlign: TextAlign.justify,
                                        ),
                                      ]
                                  ),
                                  SizedBox(height: Get.height*0.02,),
                                  Row(
                                      children: [
                                        Icon(IconlyBold.message, color: Colors.white),
                                        SizedBox(width: Get.width*0.02,),
                                        Text(
                                          "iic.tmsl@gmail.com",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.white),
                                          textAlign: TextAlign.justify,
                                        ),
                                      ]
                                  ),
                                  SizedBox(height: Get.height*0.02,),
                                  Text("General Queries",style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),),
                                  Row(
                                    children: [

                                      MaterialButton(

                                          onPressed: (){
                                            final Uri _url  = Uri.parse("tel://+919641099272");
                                            launchUrl(_url);
                                          },
                                          shape: BeveledRectangleBorder(
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [
                                              Icon(IconlyBold.call, color: Colors.white,),
                                              SizedBox(width: 5),
                                              Text("Ayushi Dey",style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w200,
                                                  color: Colors.white),),
                                            ]
                                        )
                                      ),
                                      MaterialButton(

                                          onPressed: (){
                                            final Uri _url  = Uri.parse("tel://+918337022539");
                                            launchUrl(_url);
                                          },
                                          shape: BeveledRectangleBorder(
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                              children: [
                                                Icon(IconlyBold.call, color: Colors.white,),
                                                SizedBox(width: 5),
                                                Text("Kushal Guha",style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w200,
                                                    color: Colors.white),),
                                              ]
                                          )
                                      )
                                    ]
                                  )

                                ]
                              ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: Get.height*0.02,),
                RadialMenu(
                  children: [
                    // RadialButton(
                    //     icon: Icon(Icons.ac_unit),
                    //     buttonColor: Colors.teal,
                    //     onPress: (){}),
                    // RadialButton(
                    //     icon: Icon(Icons.ac_unit),
                    //     buttonColor: Colors.teal,
                    //     onPress: (){}),
                    RadialButton(
                        icon: Icon(IconlyBold.location),
                        buttonColor: primaryHighlightColor,
                        onPress: ()async{
                          final Uri _url  = Uri.parse("https://goo.gl/maps/K99J65YcCLL2P7qw7");
                          if(await canLaunchUrl(_url)){
                            await launchUrl(_url);
                          } else{
                            throw 'Could not open';
                          }

                        }),

                    RadialButton(
                        icon: Icon(IconlyBold.call),
                        buttonColor: primaryHighlightColor,
                        onPress: ()async{
                          final Uri _url  = Uri.parse("tel://+918271538524");
                          launchUrl(_url);
                        }),
                    RadialButton(
                        icon: Icon(IconlyBold.message),
                        buttonColor: primaryHighlightColor,
                        onPress: ()async{
                          final Uri _url  = Uri.parse("mailto:iic.tmsl@gmail.com");
                          launchUrl(_url);
                        }),
                    RadialButton(
                        icon: Icon(IconlyBold.home),
                        buttonColor: primaryHighlightColor,
                        onPress: ()async{
                          final Uri _url  = Uri.parse("https://envisage.org.in");
                          launchUrl(_url);
                        }),
                  ],
                ),
              ],
            )
        ),
    );
  }
}
