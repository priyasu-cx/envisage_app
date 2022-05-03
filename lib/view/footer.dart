import 'package:envisage_app/view/homepage.dart';
import 'package:flutter/material.dart';
import 'package:envisage_app/utils/colors.dart';
import 'package:iconly/iconly.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(

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
    );
  }
}
