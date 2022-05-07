import 'package:envisage_app/controller/authentication/authentication_service.dart';
import 'package:envisage_app/model/user_details.dart';
import 'package:flutter/material.dart';
import 'package:envisage_app/utils/colors.dart';
import 'package:iconly/iconly.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var userData;
  bool isloaded = false;

  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() async {
    UserDetails user = await AuthenticationService().fetchUserDetails();
    setState(() {
      userData = user;
      isloaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    return !isloaded
        ? Scaffold(
            backgroundColor: primaryBackgroundColor,
            body: Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            ),
          )
        : Scaffold(
            // extendBodyBehindAppBar: true,
            backgroundColor: primaryBackgroundColor,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              leading: IconButton(
                icon: const Icon(
                  IconlyLight.arrow_left,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            body: Container(
              padding: EdgeInsets.symmetric(horizontal: _width * 0.077),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: _height * 0.02,
                        bottom: _height * 0.03,
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: CircleAvatar(
                          radius: _height * 0.09,
                          backgroundColor: primaryHighlightColor.withAlpha(50),
                          backgroundImage: AssetImage(
                              "assets/ic_launcher_adaptive_fore.png"),
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        userData.fullName!,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: _height * 0.02,
                        bottom: _height * 0.06,
                      ),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: _width * 0.0813,
                          vertical: 10,
                        ),
                        child: Text(
                          userData.evgId,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        decoration: const BoxDecoration(
                          color: primaryHighlightColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "  ABOUT  ",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.transparent,
                          decoration: TextDecoration.underline,
                          decorationColor: primaryHighlightColor,
                          shadows: [
                            Shadow(
                              offset: Offset(0, -15),
                              color: primaryHighlightColor,
                            )
                          ],
                          decorationThickness: 2,
                        ),
                      ),
                    ),
                    profileData(
                      _height,
                      "Email",
                      userData.email,
                      IconlyLight.message,
                    ),
                    profileData(
                      _height,
                      "Phone",
                      userData.phone,
                      IconlyLight.call,
                    ),
                    profileData(
                      _height,
                      "Gender",
                      userData.gender,
                      IconlyLight.user,
                    ),
                    profileData(
                      _height,
                      "College",
                      userData.college,
                      IconlyLight.work,
                    ),
                    profileData(
                      _height,
                      "City",
                      userData.city,
                      IconlyLight.location,
                    ),
                    profileData(
                      _height,
                      "State",
                      userData.state,
                      IconlyLight.discovery,
                    ),
                    SizedBox(
                      height: _height * 0.03,
                    ),
                  ],
                ),
              ),
            ),
          );
  }

  Container profileData(
      double _height, String title, String value, IconData image) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: _height * 0.02,
              bottom: _height * 0.005,
            ),
            child: Row(
              children: [
                Icon(
                  image,
                  color: Colors.white30,
                  size: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                  ),
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white30,
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          )
        ],
      ),
    );
  }
}






// class profile extends StatefulWidget {
//   const profile({Key? key}) : super(key: key);

//   @override
//   State<profile> createState() => _profileState();
// }

// class _profileState extends State<profile> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: primaryBackgroundColor,
//         extendBodyBehindAppBar: true,
//         appBar: PreferredSize(child:SafeArea(
//             child: Container(
//                 child: Padding(
//                     padding: const EdgeInsets.all(20),
//                     child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: <Widget>[
//                           IconButton(icon: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
//                             onPressed: (){
//                               setState(() {
//                                 //print("Hello World");
//                                 Get.back();
//                               });
//                             },),

//                           IconButton(onPressed: (){},icon: Icon(IconlyBold.arrow_down_square,color: Colors.white,),),
//                         ]
//                     )
//                 )
//             )
//         ),preferredSize: Size.fromHeight(Get.height*0.1),),


//       body: Column(
//         children: [
//           Container(
//           padding: EdgeInsets.only(top: Get.height*0.13, left: Get.width*0.02,right: Get.width*0.02),
//           //alignment: Alignment.topCenter,
//           child: Column(
//           //mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             CircleAvatar(
//               radius: Get.width*0.12,
//               backgroundColor: Colors.black,
//               backgroundImage: AssetImage("assets/envisage_logo.png"),
//               onBackgroundImageError: null,
//             ),
//             SizedBox(height: Get.height*0.02),
//             Text("Name Name", style: TextStyle(
//               color: Colors.white,
//               letterSpacing: 3,
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//             )),
//             SizedBox(height: Get.height*0.02),
//             SizedBox(width: Get.width*0.5, height: 50, child:
//             MaterialButton(
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               minWidth: 60,
//               color: primaryHighlightColor,
//               onPressed: (){},
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   //Icon(IconlyLight.ticket_star, color: Colors.white,),
//                   SizedBox(width: Get.width*0.01),
//                   Text("EVG22iufrgiku",style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 18,
//                     fontWeight: FontWeight.w400,
//                   ),),
//                 ],
//               )
//             ),),
//           ],
//           )
//           ),
//           Container(
//             alignment: Alignment.topLeft,
//               padding: EdgeInsets.only(left: Get.width*0.1,right: Get.width*0.1),
//               child:Column(
//                 children: [
//                   Container(
//                     padding: EdgeInsets.only(
//                       bottom: 10,top: Get.width*0.05 // Space between underline and text
//                     ),
//                     decoration: BoxDecoration(
//                         border: Border(bottom: BorderSide(
//                           color: primaryHighlightColor,
//                           width: 3.0, // Underline thickness
//                         ))
//                     ),
//                     child: Text(
//                       "About",
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 20,
//                         fontWeight: FontWeight.w200,
//                       ),
//                     ),
//                   ),

//                 ]
//               ))

//       ],),);
//   }
// }

