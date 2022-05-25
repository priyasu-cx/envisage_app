import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:envisage_app/utils/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

List<String> noti =[
  'Coming Soon...',
];


class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);
  @override
  State<NotificationPage> createState() => _NotificationState();
}

class _NotificationState extends State<NotificationPage> {
  int Notification_count = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBackgroundColor,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        child: SafeArea(
            child: Container(
              alignment: Alignment.topLeft,
                child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: Get.width * 0.03,
                      vertical: Get.height*0.01,
                    ),
                    child: Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            "Notification",
                            style: TextStyle(
                              color: Colors.white,
                              letterSpacing: 3,
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ])))),
        preferredSize: Size.fromHeight(Get.height * 0.1),
      ),
      body: Notification_count == 0
          ? Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: Get.height * 0.25),
              child: Column(children: [
                Image.asset(
                  "assets/Notification.png",
                  width: Get.width * 0.6,
                ),
                Text("No Notification!",
                    style: TextStyle(
                        color: Colors.white54,
                        fontSize: 15,
                        fontWeight: FontWeight.w200)),
              ]))
          : Container(
              padding: EdgeInsets.symmetric(horizontal: Get.width * 0.077),
              // child: ListView.builder(
              //   //padding: EdgeInsets.only(top:Get.height*0.02),
              //     itemBuilder: (context,index)=>Noti_items(index),
              //   itemCount: noti.length,
              // )
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection("notifications")
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('Something went wrong');
                  } else if (snapshot.hasData || snapshot.data != null) {
                    return ListView.builder(
                      reverse: true,
                      shrinkWrap: true,
                      itemBuilder: (context, index) =>
                          Noti_items(index, snapshot),
                      itemCount: snapshot.data?.docs.length,
                    );
                  } else {
                    return Text('Something went wrong');
                  }
                },
              )),
    );
  }

  Widget Noti_items(index, snapshot) {
    QueryDocumentSnapshot<Object?>? documentSnapshot =
        snapshot.data?.docs[index];
    return Padding(
      padding: EdgeInsets.only(bottom: 20),
      child: Container(
          //height: 60,
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.03),
          decoration: BoxDecoration(
            color: menu,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              (documentSnapshot != null) ? (documentSnapshot["text"]) : "",
              style: TextStyle(
                  color: Colors.white70,
                  fontSize: 15,
                  fontWeight: FontWeight.w200),
              textAlign: TextAlign.justify,
            ),
          )),
    );

  }
}

