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
  int up_Listcount = 2;
  int past_Listcount=7;
  @override
  void initState() {
    //EventData _data = new EventData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBackgroundColor,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(child:SafeArea(
          child: Container(
              child: Padding(
                  padding: EdgeInsets.all(Get.height*0.01),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(icon: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
                          onPressed: (){
                            setState(() {
                              //print("Hello World");
                              Get.back();
                            });
                          },),
                        Text("Events", style: TextStyle(
                          color: Colors.white,
                          letterSpacing: 3,
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),),
                        IconButton(onPressed: (){},icon: Icon(IconlyBold.notification,color: Colors.white,),),
                        //IconButton(onPressed: (){},icon: Icon(IconlyBold.arrow_down_square,color: Colors.white,),),
                      ]
                  )
              )
          )
      ),preferredSize: Size.fromHeight(Get.height*0.1),),
      body:SingleChildScrollView(child: Padding(
      padding: EdgeInsets.fromLTRB(0,Get.height*0.01,0,Get.height*0.05),
      //padding: EdgeInsets.all(0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: Get.height*0.13),
          Padding(child:Text(
            "Upcoming Events",
            textAlign: TextAlign.left,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 20,
              color: Colors.white,
            ),
          ),padding: EdgeInsets.only(left: Get.width*0.1)),
          SizedBox(height: Get.height*0.02),
          up_Listcount>0?
          Container(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: Get.height*0.33,
                      child: ListView.builder(
                          itemCount:  up_Listcount,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index)=> Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                        ),
                        height:Get.height*0.33,
                        width:Get.height*0.3,
                        margin: EdgeInsets.only(right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            //SizedBox(height: Get.height*0.01,),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              //width:Get.height*0.28,
                                child: Image.asset("assets/Events/event.png",fit: BoxFit.fitWidth,),
                            ),
                            //SizedBox(height: Get.height*0.0,),
                            Container(
                              child: Text(
                                "Hackathon",
                                //data[0].id.toString(),
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                  color: Colors.black87,
                                ),
                              ),
                              padding: EdgeInsets.only(left:Get.width*0.05),
                            ),
                            Container(
                              child: Text(
                                "Wed, Apr 28 •5:30 PM",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  color: primaryHighlightColor,
                                ),
                              ),
                              padding: EdgeInsets.only(left:Get.width*0.05),
                            ),
                            //SizedBox(height: Get.height*0.02),
                            Row(
                              children: [
                                SizedBox(width: Get.width*0.04),
                                Icon(Icons.location_on_rounded, color: grey,),
                                Text(
                                  "Kolkata, West Bengal",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                    color: grey,
                                  ),
                                ),
                              ]
                            )
                          ]
                          ),
                        ),),

                      ),
                      ]),
                    ),
              ):Container(height: Get.height*0.33, child: Center(
            child: Text("No Upcoming Events", style: TextStyle(color: grey, fontSize: 15, fontWeight: FontWeight.w400),)
          )),
          SizedBox(height: Get.height*0.05),
          Padding(padding: EdgeInsets.only(left: Get.width*0.1),child:Text(
            "Past Events",
            textAlign: TextAlign.left,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 20,
              color: Colors.white,
            ),),
          ),
          past_Listcount>0?
          Container(
            padding: EdgeInsets.only(top: Get.height*0.02),
            child: SingleChildScrollView(
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: Get.height*0.33,
                      child: ListView.builder(
                        itemCount:  past_Listcount,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index)=> Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                          ),
                          height:Get.height*0.33,
                          width:Get.height*0.3,
                          margin: EdgeInsets.only(right: 20),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                //SizedBox(height: Get.height*0.01,),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  //width:Get.height*0.28,
                                  child: Image.asset("assets/Events/event.png",fit: BoxFit.fitWidth,),
                                ),
                                //SizedBox(height: Get.height*0.0,),
                                Container(
                                  child: Text(
                                    "Hackathon",
                                    //data[0].id.toString(),
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  padding: EdgeInsets.only(left:Get.width*0.05),
                                ),
                                Container(
                                  child: Text(
                                    "Wed, Apr 28 •5:30 PM",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                      color: primaryHighlightColor,
                                    ),
                                  ),
                                  padding: EdgeInsets.only(left:Get.width*0.05),
                                ),
                                //SizedBox(height: Get.height*0.02),
                                Row(
                                    children: [
                                      SizedBox(width: Get.width*0.04),
                                      Icon(Icons.location_on_rounded, color: grey,),
                                      Text(
                                        "Kolkata, West Bengal",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                          color: grey,
                                        ),
                                      ),
                                    ]
                                )
                              ]
                          ),
                        ),),

                    ),
                  ]),
            ),
          ):Container(height: Get.height*0.33, child: Center(
              child: Text("No Upcoming Events", style: TextStyle(color: grey, fontSize: 15, fontWeight: FontWeight.w400),)
          )),
          //SizedBox(height: Get.height*0.05),
        ]
      )
    ),),);
  }
}


