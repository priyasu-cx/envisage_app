import 'package:envisage_app/view/homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:envisage_app/utils/colors.dart';
import 'package:iconly/iconly.dart';
import 'package:get/get.dart';

class footer extends StatefulWidget {
  const footer({Key? key}) : super(key: key);

  @override
  State<footer> createState() => _footerState();
}

class _footerState extends State<footer> {

  int currentTab = 0;
  final List<Widget> screens = [
    homepage(),
    homepage(),
    homepage(),
    homepage(),
  ];
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = homepage();
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;

  bool isDrawerOpen = false;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      transform: Matrix4.translationValues(xOffset, yOffset, 0)..scale(scaleFactor),
      duration: Duration(milliseconds: 250),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(isDrawerOpen?40:0.0),
      ),
      child: Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(child:SafeArea(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  isDrawerOpen? IconButton(icon: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
                    onPressed: (){
                      setState(() {
                        //print("Hello World");
                        xOffset = 0;
                        yOffset = 0;
                        scaleFactor = 1;
                        isDrawerOpen = false;
                      });
                    },):
                  IconButton(icon: Icon(Icons.menu, color: Colors.white),
                    onPressed: (){
                      setState(() {
                        //print("Hello World");
                        xOffset = Get.width*0.65;
                        yOffset = Get.height*0.1;
                        scaleFactor = 0.8;
                        isDrawerOpen = true;
                      });
                    },
                  ),
                  Icon(IconlyBold.notification,color: Colors.white,),
                ]
              )
            )
          )
        ),preferredSize: Size.fromHeight(Get.height*0.1),),

      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryHighlightColor,
        child: Icon(IconlyLight.category,color:Colors.white,),
        onPressed: (){},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 0,
        child: Container(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  //Button 1
                  MaterialButton(
                      minWidth: 40,
                      onPressed: (){
                        setState(() {
                          currentScreen = homepage();
                          currentTab = 0;
                        });
                      },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          //Icons.home,
                          IconlyLight.home,
                          color: currentTab == 0 ? primaryHighlightColor : grey,
                        ),
                        Text(
                          'Home',
                          style: TextStyle(
                            color: currentTab == 0 ? primaryHighlightColor : grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  //Button 2
                  MaterialButton(
                    minWidth: 40,
                    onPressed: (){
                      setState(() {
                        currentScreen = homepage();
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          IconlyLight.activity,
                          color: currentTab == 1 ? primaryHighlightColor : grey,
                        ),
                        Text(
                          'E-Talk',
                          style: TextStyle(
                            color: currentTab == 1 ? primaryHighlightColor : grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  //Button 1
                  MaterialButton(
                    minWidth: 40,
                    onPressed: (){
                      setState(() {
                        currentScreen = homepage();
                        currentTab = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          IconlyLight.image,
                          color: currentTab == 2 ? primaryHighlightColor : grey,
                        ),
                        Text(
                          'Gallery',
                          style: TextStyle(
                            color: currentTab == 2 ? primaryHighlightColor : grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  //Button 2
                  MaterialButton(
                    minWidth: 40,
                    onPressed: (){
                      setState(() {
                        currentScreen = homepage();
                        currentTab = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          IconlyLight.user_1,
                          color: currentTab == 3 ? primaryHighlightColor : grey,
                        ),
                        Text(
                          'Team',
                          style: TextStyle(
                            color: currentTab == 3 ? primaryHighlightColor : grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ]
          )
        )
      ),
    ),);
  }
}


