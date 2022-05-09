import 'dart:math';

import 'package:envisage_app/controller/authentication/authentication_service.dart';
import 'package:envisage_app/model/events_details.dart';
import 'package:envisage_app/view/nav_pages/event_details_page.dart';
import 'package:envisage_app/view/notification.dart';
import 'package:envisage_app/view/screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:envisage_app/utils/colors.dart';
import 'package:iconly/iconly.dart';

class events extends StatefulWidget {
  const events({Key? key}) : super(key: key);

  @override
  State<events> createState() => _eventsState();
}

class _eventsState extends State<events> {
  int upcomingEventCount = 0;
  int pastEventCount = 0;
  List<EventDetails> upcomingEvents = [];
  List<EventDetails> pastEvents = [];
  bool isLoaded = false;

  @override
  void initState() {
    getData();
    isLoaded = true;
    super.initState();
  }

  void getData() async {
    List<EventDetails> upcoming =
        await AuthenticationService().fetchEventDetails(true);

    List<EventDetails> past =
        await AuthenticationService().fetchEventDetails(false);
    setState(() {
      upcomingEvents = upcoming;
      upcomingEventCount = upcoming.length;
      pastEvents = past;
      pastEventCount = past.length;
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
        : Scaffold(
            backgroundColor: primaryBackgroundColor,
            extendBodyBehindAppBar: true,
            appBar: PreferredSize(
              child: SafeArea(
                  child: Container(
                      child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: Get.width * 0.03,vertical: Get.height*0.01,),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                IconButton(
                                  icon: Icon(IconlyLight.arrow_left,
                                      color: Colors.white),
                                  onPressed: () {
                                    setState(() {
                                      //print("Hello World");
                                      Get.back();
                                    });
                                  },
                                ),
                                Text(
                                  "Events",
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
                                //IconButton(onPressed: (){},icon: Icon(IconlyBold.arrow_down_square,color: Colors.white,),),
                              ])))),
              preferredSize: Size.fromHeight(Get.height * 0.1),
            ),
            body: SingleChildScrollView(
              child: Padding(
                  padding: EdgeInsets.fromLTRB(
                      0, Get.height * 0.01, 0, Get.height * 0.05),
                  //padding: EdgeInsets.all(0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: Get.height * 0.13),
                        Padding(
                            child: Text(
                              "Upcoming Events",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                            padding: EdgeInsets.only(left: Get.width * 0.1)),
                        SizedBox(height: Get.height * 0.02),
                        upcomingEventCount > 0
                            ? Container(
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SizedBox(
                                        height: Get.height * 0.33,
                                        child: ListView.builder(
                                          itemCount: upcomingEventCount,
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (context, index) =>
                                              GestureDetector(
                                            onTap: () {
                                              Get.to(() => EventDetailsPage(
                                                    isUpcoming: true,
                                                    eventIndex: index,
                                                  )); // ON TAP FUNCTION !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                color: Colors.white,
                                              ),
                                              height: Get.height * 0.33,
                                              width: Get.height * 0.3,
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 10),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  //SizedBox(height: Get.height*0.01,),
                                                  Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 10),
                                                    //width:Get.height*0.28,
                                                    child: Image.asset(
                                                      "assets/Events/event.png", // IMAGE of the Event => CHANGE !!!!!!!!!!
                                                      fit: BoxFit.fitWidth,
                                                    ),
                                                  ),
                                                  //SizedBox(height: Get.height*0.0,),
                                                  Container(
                                                    child: Text(
                                                      upcomingEvents[index]
                                                          .name, // NAME of the Event  =>  CHANGE !!!!!!!!!!!
                                                      //data[0].id.toString(),
                                                      textAlign: TextAlign.left,
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 18,
                                                        color: Colors.black87,
                                                      ),
                                                    ),
                                                    padding: EdgeInsets.only(
                                                        left: Get.width * 0.05),
                                                  ),
                                                  Container(
                                                    child: Text(
                                                      upcomingEvents[index]
                                                          .date, // DATE of the Event => CHANGE !!!!!!!!!!
                                                      textAlign: TextAlign.left,
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 12,
                                                        color:
                                                            primaryHighlightColor,
                                                      ),
                                                    ),
                                                    padding: EdgeInsets.only(
                                                        left: Get.width * 0.05),
                                                  ),
                                                  //SizedBox(height: Get.height*0.02),
                                                  Row(
                                                    children: [
                                                      SizedBox(
                                                          width:
                                                              Get.width * 0.04),
                                                      Icon(
                                                        Icons
                                                            .location_on_rounded,
                                                        color: grey,
                                                      ),
                                                      Text(
                                                        upcomingEvents[index]
                                                            .location, // LOCATION of the Event => CHANGE !!!!!!!!!!!
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 12,
                                                          color: grey,
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            : Container(
                                height: Get.height * 0.33,
                                child: const Center(
                                    child: Text(
                                  " Uh oh! No Upcoming Events ",
                                  style: TextStyle(
                                      color: grey,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400),
                                ))),
                        SizedBox(height: Get.height * 0.05),
                        Padding(
                          padding: EdgeInsets.only(left: Get.width * 0.1),
                          child: Text(
                            "Past Events",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        pastEventCount > 0
                            ? Container(
                                padding:
                                    EdgeInsets.only(top: Get.height * 0.02),
                                child: SingleChildScrollView(
                                  child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        SizedBox(
                                          height: Get.height * 0.33,
                                          child: ListView.builder(
                                            itemCount: pastEventCount,
                                            scrollDirection: Axis.horizontal,
                                            itemBuilder: (context, index) =>
                                                Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                color: Colors.white,
                                              ),
                                              height: Get.height * 0.33,
                                              width: Get.height * 0.3,
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 10),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  //SizedBox(height: Get.height*0.01,),
                                                  Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 10),
                                                    //width:Get.height*0.28,
                                                    child: Image.asset(
                                                      "assets/Events/event.png", // IMAGE of the Event => CHANGE !!!!!!!!!!
                                                      fit: BoxFit.fitWidth,
                                                    ),
                                                  ),
                                                  //SizedBox(height: Get.height*0.0,),
                                                  Container(
                                                    child: Text(
                                                      pastEvents[index]
                                                          .name, // NAME of the Event  =>  CHANGE !!!!!!!!!!!
                                                      //data[0].id.toString(),
                                                      textAlign: TextAlign.left,
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 18,
                                                        color: Colors.black87,
                                                      ),
                                                    ),
                                                    padding: EdgeInsets.only(
                                                        left: Get.width * 0.05),
                                                  ),
                                                  Container(
                                                    child: Text(
                                                      pastEvents[index]
                                                          .date, // DATE of the Event => CHANGE !!!!!!!!!!
                                                      textAlign: TextAlign.left,
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 12,
                                                        color:
                                                            primaryHighlightColor,
                                                      ),
                                                    ),
                                                    padding: EdgeInsets.only(
                                                        left: Get.width * 0.05),
                                                  ),
                                                  //SizedBox(height: Get.height*0.02),
                                                  Row(
                                                    children: [
                                                      SizedBox(
                                                          width:
                                                              Get.width * 0.04),
                                                      Icon(
                                                        Icons
                                                            .location_on_rounded,
                                                        color: grey,
                                                      ),
                                                      Text(
                                                        pastEvents[index]
                                                            .location, // LOCATION of the Event => CHANGE !!!!!!!!!!!
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 12,
                                                          color: grey,
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]),
                                ),
                              )
                            : Container(
                                height: Get.height * 0.33,
                                child: Center(
                                    child: Text(
                                  " Yaay, No Past Events! ",
                                  style: TextStyle(
                                      color: grey,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400),
                                ))),
                        //SizedBox(height: Get.height*0.05),
                      ])),
            ),
          );
  }
}
