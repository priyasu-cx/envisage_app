import 'package:envisage_app/utils/config.dart';
import 'package:envisage_app/view/Profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:envisage_app/utils/colors.dart';
//import 'package:pet_ui/configuration.dart';
import 'package:get/get.dart';

class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      color: menu,
      padding: EdgeInsets.fromLTRB(Get.width*0.08, Get.height*0.10, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: Get.width*0.1,
            backgroundColor: Colors.black,
            backgroundImage: AssetImage("assets/envisage_logo.png"),
            onBackgroundImageError: null,
          ),
          SizedBox(height: Get.height*0.03,),
          Text(
            'Name Name',
            style: TextStyle(
              letterSpacing: 3,
              fontSize: 19,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          SizedBox(height: Get.height*0.06,),
          // Row(
          //   children: [
          //   Text(
          //     'My Profile',
          //     style: TextStyle(
          //       letterSpacing: 3,
          //       fontSize: 19,
          //       fontWeight: FontWeight.w500,
          //       color: Colors.white,
          //     ),
          //   ),
          //   ],),
          Column(
            children: drawerItems.map((element)=>Padding(
              padding: EdgeInsets.only(left: Get.width*0.015, bottom: Get.width*0.01),
              child: Row(
                children:[
                  Icon(element['icon'],color: Colors.white, size:30),
                  SizedBox(width: 10,),
                  MaterialButton(
                    child:
                  Text(element['title'],style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  )),onPressed: (){Get.to(()=>profile());}),
                ],
              ),
            )).toList(),
          ),


        ],
      ),


    );
  }
}