import 'package:envisage_app/controller/authentication/authentication_service.dart';
import 'package:envisage_app/view/authentication/sign_in.dart';
import 'package:envisage_app/view/menu_pages/Registered_events.dart';
import 'package:envisage_app/view/menu_pages/contact_us.dart';
import 'package:envisage_app/view/menu_pages/profile_page.dart';
import 'package:envisage_app/view/menu_pages/cart.dart';
import 'package:envisage_app/view/menu_pages/rules.dart';
import 'package:flutter/material.dart';
import 'package:envisage_app/utils/colors.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  String fullName = "Envisage '22";
  bool isLoaded = false;

  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    var user = _prefs.getString("name");
    setState(() {
      // print(user);
      if (user != null) {
        fullName = user;
      }
      isLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return !isLoaded
        ? const Scaffold(
            backgroundColor: primaryBackgroundColor,
            body: Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            ),
          )
        : Container(
            alignment: Alignment.topLeft,
            color: menu,
            padding:
                EdgeInsets.fromLTRB(Get.width * 0.08, Get.height * 0.10, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // CircleAvatar(
                //   radius: Get.width * 0.1,
                //   backgroundColor: Colors.black,
                //   backgroundImage: AssetImage("assets/envisage_logo.png"),
                //   onBackgroundImageError: null,
                // ),
                CircleAvatar(
                  radius: Get.width * 0.1,
                  backgroundColor: primaryBackgroundColor,
                  backgroundImage:
                      AssetImage("assets/ic_launcher_adaptive_fore.png"),
                ),

                SizedBox(
                  height: Get.height * 0.03,
                ),
                Text(
                  fullName,
                  style: TextStyle(
                    letterSpacing: 1,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
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
                          left: Get.width * 0.01, bottom: Get.width * 0.01),
                      child: Row(
                        children: [
                          Icon(IconlyLight.profile,
                              color: Colors.white, size: 30),
                          SizedBox(
                            width: 8,
                          ),
                          MaterialButton(
                              child: Text("Profile",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300,
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
                // Column(
                //   children: [
                //     Padding(
                //       padding: EdgeInsets.only(
                //           left: Get.width * 0.01, bottom: Get.width * 0.01),
                //       child: Row(
                //         children: [
                //           Icon(IconlyLight.buy, color: Colors.white, size: 30),
                //           SizedBox(
                //             width: 0,
                //           ),
                //           MaterialButton(
                //               child: Text("Cart",
                //                   style: TextStyle(
                //                     color: Colors.white,
                //                     fontWeight: FontWeight.w500,
                //                     fontSize: 18,
                //                   )),
                //               onPressed: () {
                //                 Get.to(() => CartPage());
                //               }),
                //         ],
                //       ),
                //     ),
                //   ],
                // ),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: Get.width * 0.01, bottom: Get.width * 0.01),
                      child: Row(
                        children: [
                          Icon(IconlyLight.calendar,
                              color: Colors.white, size: 30),
                          SizedBox(
                            width: 8,
                          ),
                          MaterialButton(
                              child: Text("Registered Events",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                  )),
                              onPressed: () {
                                Get.to(() => reg_events());
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
                          left: Get.width * 0.01, bottom: Get.width * 0.01),
                      child: Row(
                        children: [
                          Icon(IconlyLight.heart,
                              color: Colors.white, size: 30),
                          SizedBox(
                            width: 8,
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
                          left: Get.width * 0.01, bottom: Get.width * 0.01),
                      child: Row(
                        children: [
                          Icon(IconlyLight.message,
                              color: Colors.white, size: 30),
                          SizedBox(
                            width: 8,
                          ),
                          MaterialButton(
                              child: Text("Contact Us",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                  )),
                              onPressed: () {
                                Get.to(() => ContactUs());
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
                          left: Get.width * 0.01, bottom: Get.width * 0.01),
                      child: Row(
                        children: [
                          Icon(IconlyLight.info_square,
                              color: Colors.white, size: 30),
                          SizedBox(
                            width: 8,
                          ),
                          MaterialButton(
                              child: Text("Rules",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                  )),
                              onPressed: () async{
                                final Uri _url  = Uri.parse("https://drive.google.com/file/d/1uThgFp2cUg-H7OM0-7rBTEZanrEdE8Ku/view?usp=sharing");
                                launchUrl(_url);
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
                          left: Get.width * 0.01, bottom: Get.width * 0.01),
                      child: Row(
                        children: [
                          Icon(IconlyLight.logout,
                              color: Colors.white, size: 30),
                          SizedBox(
                            width: 8,
                          ),
                          MaterialButton(
                            child: Text("Sign Out",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                )),
                            onPressed: () {
                              signOutHelper();
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
  }

  void signOutHelper() async {
    String status = await AuthenticationService().signOut();
    if (status == "success") {
      Fluttertoast.showToast(msg: "Signed out successfully");
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => SignIn()));
    }
  }
}
