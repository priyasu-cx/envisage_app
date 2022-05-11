import 'package:envisage_app/controller/authentication/authentication_service.dart';
import 'package:envisage_app/model/events_details.dart';
import 'package:envisage_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  int upcomingEventCount = 0;
  List<EventDetails> upcomingEvents = [];
  bool isLoaded = false;

  @override
  void initState() {
    getData();

    super.initState();
  }

  void getData() async {
    List<EventDetails> upcoming =
        await AuthenticationService().fetchEventDetails(true);
    // if (!LocalService().isUserExist()) {
    //   LocalService().setUser(await AuthenticationService().fetchUserDetails());
    // }
    setState(() {
      upcomingEvents = upcoming;
      upcomingEventCount = upcoming.length;
      isLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return !isLoaded
        ? Scaffold(
            backgroundColor: primaryBackgroundColor,
            body: Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            ),
          )
        : Scaffold(
            // appBar: AppBar(
            //   title: Text('Home'),
            // ),
            backgroundColor: primaryBackgroundColor,
            body: Container(
              child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            Get.width * 0.20,
                            Get.height * 0.19,
                            Get.width * 0.20,
                            Get.height * 0.02),
                        child: Image.asset("assets/envisage_logo.png"),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          "May 23 - May 29",
                          //textAlign: TextAlign.cen,
                          style: TextStyle(
                            letterSpacing: 4,
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.12,
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(
                            Get.width * 0.18, 5, Get.width * 0.10, 5),
                        child: Image.asset("assets/home1.png"),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(
                            Get.width * 0.1,
                            Get.width * 0.35,
                            Get.width * 0.1,
                            Get.width * 0.04),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "About Envisage",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(Get.width * 0.1,
                            Get.width * 0.01, Get.width * 0.1, 10),
                        //alignment: Alignment.,
                        child: Text(
                          "Envisage is the official E-Summit of Techno Main Salt Lake, organized by IIC-TMSL. It is a product of creative and passionate minds that saw the need for the hour and worked hard with fervour and enthusiasm to make it a reality for all. It provides an excellent platform for promising minds to showcase their talents. The events are designed to test and encourage the participants' minds in a wide variety of fields, especially for someone curious as to how this world of Entrepreneurship works and what it takes to be an entrepreneur.",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontWeight: FontWeight.w200,
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(Get.width * 0.1,
                            Get.width * 0.1, Get.width * 0.1, 10),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Events",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(
                            0, Get.height * 0.02, 0, Get.height * 0.05),
                        child: SingleChildScrollView(
                          child:
                              Column(mainAxisSize: MainAxisSize.min, children: [
                            SizedBox(
                              height: Get.height * 0.33,
                              child: ListView.builder(
                                itemCount: upcomingEventCount,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) => Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.white,
                                  ),
                                  height: Get.height * 0.33,
                                  width: Get.height * 0.3,
                                  margin: EdgeInsets.symmetric(horizontal: 10),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        //SizedBox(height: Get.height*0.01,),
                                        Container(
                                          padding: EdgeInsets.all(10),
                                          //width:Get.height*0.28,
                                          child: Image.network(
                                            upcomingEvents[index].photoUrl!,
                                            fit: BoxFit.fitWidth,
                                          ),
                                        ),
                                        //SizedBox(height: Get.height*0.0,),
                                        Container(
                                          child: Text(
                                            upcomingEvents[index].name,
                                            //data[0].id.toString(),
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 18,
                                              color: Colors.black87,
                                            ),
                                          ),
                                          padding: EdgeInsets.only(
                                              left: Get.width * 0.05),
                                        ),
                                        Container(
                                          child: Text(
                                            upcomingEvents[index].date,
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12,
                                              color: primaryHighlightColor,
                                            ),
                                          ),
                                          padding: EdgeInsets.only(
                                              left: Get.width * 0.05),
                                        ),
                                        //SizedBox(height: Get.height*0.02),
                                        Row(children: [
                                          SizedBox(width: Get.width * 0.04),
                                          Icon(
                                            Icons.location_on_rounded,
                                            color: grey,
                                          ),
                                          Text(
                                            upcomingEvents[index].location,
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12,
                                              color: grey,
                                            ),
                                          ),
                                        ])
                                      ]),
                                ),
                              ),
                            ),
                          ]),
                        ),
                      ),
                    ]),
              ),
            ));
  }
}
