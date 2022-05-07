import 'dart:ui';

import 'package:envisage_app/view/homepage.dart';
import 'package:envisage_app/view/menu_pages/profile_page.dart';
import 'package:envisage_app/view/menu_pages/cart.dart';
import 'package:flutter/material.dart';
import 'package:envisage_app/utils/colors.dart';
import 'package:get/get.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:iconly/iconly.dart';

// class DrawerScreen extends StatefulWidget {
//   const DrawerScreen({Key? key}) : super(key: key);

//   @override
//   State<DrawerScreen> createState() => _DrawerScreenState();
// }

// class _DrawerScreenState extends State<DrawerScreen> {
//   List<ScreenHiddenDrawer> _pages = [];

//   final baseTextStyle = TextStyle(
//     fontWeight: FontWeight.w600,
//     fontSize: 16,
//     color: Colors.white,
//   );

//   final selectedTextStyle = TextStyle(
//     fontWeight: FontWeight.w600,
//     fontSize: 16,
//     color: Colors.white70,
//   );

//   @override
//   void initState() {
//     super.initState();
//     _pages = [
//       ScreenHiddenDrawer(
//         ItemHiddenMenu(
//           name: " My Profile ",
//           baseStyle: baseTextStyle,
//           selectedStyle: selectedTextStyle,
//         ),
//         homepage(),
//       ),
//       ScreenHiddenDrawer(
//         ItemHiddenMenu(
//           name: " Cart ",
//           baseStyle: baseTextStyle,
//           selectedStyle: selectedTextStyle,
//         ),
//         homepage(),
//       ),
//       ScreenHiddenDrawer(
//         ItemHiddenMenu(
//           name: " Registered Events ",
//           baseStyle: baseTextStyle,
//           selectedStyle: selectedTextStyle,
//         ),
//         homepage(),
//       ),
//       ScreenHiddenDrawer(
//         ItemHiddenMenu(
//           name: " Calender ",
//           baseStyle: baseTextStyle,
//           selectedStyle: selectedTextStyle,
//         ),
//         homepage(),
//       ),
//       ScreenHiddenDrawer(
//         ItemHiddenMenu(
//           name: " Sponsors ",
//           baseStyle: baseTextStyle,
//           selectedStyle: selectedTextStyle,
//         ),
//         homepage(),
//       ),
//       ScreenHiddenDrawer(
//         ItemHiddenMenu(
//           name: " Contact Us ",
//           baseStyle: baseTextStyle,
//           selectedStyle: selectedTextStyle,
//         ),
//         homepage(),
//       ),
//       ScreenHiddenDrawer(
//         ItemHiddenMenu(
//           name: " Help & FAQ ",
//           baseStyle: baseTextStyle,
//           selectedStyle: selectedTextStyle,
//         ),
//         homepage(),
//       ),
//       ScreenHiddenDrawer(
//         ItemHiddenMenu(
//           name: " Sign Out ",
//           baseStyle: baseTextStyle,
//           selectedStyle: selectedTextStyle,
//         ),
//         homepage(),
//       ),
//     ];
//   }

//   @override
//   Widget build(BuildContext context) {
//     return HiddenDrawerMenu(
//       withAutoTittleName: false,
//       backgroundColorMenu: Color(0xff2C2C49).withAlpha(206),
//       screens: _pages,
//       initPositionSelected: 0,
//       slidePercent: 60,
//       contentCornerRadius: 40,
//     );
//   }
// }

class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Priyasu();
  }

  Container Priyasu() {
    return Container(
      alignment: Alignment.topLeft,
      color: menu,
      padding: EdgeInsets.fromLTRB(Get.width * 0.08, Get.height * 0.10, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: Get.width * 0.1,
            backgroundColor: Colors.black,
            backgroundImage: AssetImage("assets/envisage_logo.png"),
            onBackgroundImageError: null,
          ),
          SizedBox(
            height: Get.height * 0.03,
          ),
          Text(
            'Name Name',
            style: TextStyle(
              letterSpacing: 3,
              fontSize: 19,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: Get.height * 0.06,
          ),
          // Column(
          //   children: drawerItems.map((element)=>Padding(
          //     padding: EdgeInsets.only(left: Get.width*0.015, bottom: Get.width*0.01),
          //     child: Row(
          //       children:[
          //         Icon(element['icon'],color: Colors.white, size:30),
          //         SizedBox(width: 10,),
          //         MaterialButton(
          //           child:
          //         Text(element['title'],style: TextStyle(
          //           color: Colors.white,
          //           fontWeight: FontWeight.w500,
          //           fontSize: 18,
          //         )),onPressed: (){Get.to(()=>profile());}),
          //       ],
          //     ),
          //   )).toList(),
          // ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: Get.width * 0.015, bottom: Get.width * 0.01),
                child: Row(
                  children: [
                    Icon(IconlyBold.profile, color: Colors.white, size: 30),
                    SizedBox(
                      width: 10,
                    ),
                    MaterialButton(
                        child: Text("Profile",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            )),
                        onPressed: () {
                          Get.to(() => ProfilePage());
                        }),
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: Get.width * 0.015, bottom: Get.width * 0.01),
                child: Row(
                  children: [
                    Icon(IconlyBold.buy, color: Colors.white, size: 30),
                    SizedBox(
                      width: 10,
                    ),
                    MaterialButton(
                        child: Text("Cart",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            )),
                        onPressed: () {
                          Get.to(() => cart());
                        }),
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: Get.width * 0.015, bottom: Get.width * 0.01),
                child: Row(
                  children: [
                    Icon(IconlyBold.calendar, color: Colors.white, size: 30),
                    SizedBox(
                      width: 10,
                    ),
                    MaterialButton(
                        child: Text("Registered Events",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            )),
                        onPressed: () {
                          Get.to(() => ProfilePage());
                        }),
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: Get.width * 0.015, bottom: Get.width * 0.01),
                child: Row(
                  children: [
                    Icon(IconlyBold.heart, color: Colors.white, size: 30),
                    SizedBox(
                      width: 10,
                    ),
                    MaterialButton(
                        child: Text("Sponsors",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            )),
                        onPressed: () {
                          Get.to(() => ProfilePage());
                        }),
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: Get.width * 0.015, bottom: Get.width * 0.01),
                child: Row(
                  children: [
                    Icon(IconlyBold.message, color: Colors.white, size: 30),
                    SizedBox(
                      width: 10,
                    ),
                    MaterialButton(
                        child: Text("Contact Us",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            )),
                        onPressed: () {
                          Get.to(() => ProfilePage());
                        }),
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: Get.width * 0.015, bottom: Get.width * 0.01),
                child: Row(
                  children: [
                    Icon(IconlyBold.info_square, color: Colors.white, size: 30),
                    SizedBox(
                      width: 10,
                    ),
                    MaterialButton(
                        child: Text("Help & FAQ",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            )),
                        onPressed: () {
                          Get.to(() => ProfilePage());
                        }),
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: Get.width * 0.015, bottom: Get.width * 0.01),
                child: Row(
                  children: [
                    Icon(IconlyBold.logout, color: Colors.white, size: 30),
                    SizedBox(
                      width: 10,
                    ),
                    MaterialButton(
                        child: Text("Sign Out",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            )),
                        onPressed: () {
                          Get.to(() => ProfilePage());
                        }),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
