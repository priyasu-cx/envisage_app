import 'package:envisage_app/utils/colors.dart';
import 'package:envisage_app/view/footer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text('Home'),
        // ),
      backgroundColor: primaryBackgroundColor,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(padding: EdgeInsets.fromLTRB(Get.width*0.20, Get.width*0.23, Get.width*0.20,Get.width*0.02),
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
                height: Get.height*0.12,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(Get.width*0.18, 5, Get.width*0.10, 5),
                child: Image.asset("assets/home1.png"),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(Get.width*0.1, Get.width*0.35, Get.width*0.1, Get.width*0.04),
                alignment: Alignment.centerLeft,
                child:
                  Text(
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
                margin: EdgeInsets.fromLTRB(Get.width*0.1, Get.width*0.01, Get.width*0.1, 10),
                //alignment: Alignment.,
                  child:
                  Text(
                    "Envisage is the official E-Summit of Techno Main Salt Lake. It is born out of the dreams and aspirations of the youth who have the zest and the zeal to take their future into their own hands. Supporting the growing startup culture in the country, we are promised to inculcate and identify the best ideas and b-plans. Envisage is the platform for budding entrepreneurs to showcase the power of their ",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontWeight: FontWeight.w200,
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(Get.width*0.1, Get.width*0.1, Get.width*0.1, 10),
                alignment: Alignment.centerLeft,
                child:
                Text(
                  "Events",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ]
          ),
        ),
      )
    );
  }
}
