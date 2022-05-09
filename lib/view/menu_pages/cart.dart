import 'package:envisage_app/view/notification.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:envisage_app/utils/colors.dart';
import 'package:iconly/iconly.dart';

class cart extends StatefulWidget {
  const cart({Key? key}) : super(key: key);

  @override
  State<cart> createState() => _cartState();
}

class _cartState extends State<cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBackgroundColor,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        child: SafeArea(
            child: Container(
                child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: Get.width * 0.03),
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
                            "Cart",
                            style: TextStyle(
                              color: Colors.white,
                              letterSpacing: 3,
                              fontSize: 20,
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

      // body: Column(
      //   children:[
      //     SizedBox(height: Get.height*0.15),
      //     Container(
      //       child: Padding(
      //         padding: EdgeInsets.all(0),
      //         //padding: EdgeInsets.symmetric(horizontal: Get.width*0.02),
      //         child: Column(
      //           children: [
      //             Container(
      //               padding: EdgeInsets.symmetric(horizontal: Get.width*0.1 ),
      //               // decoration: BoxDecoration(
      //               //   color: menu,
      //               //   //borderRadius: BorderRadius.circular(10),
      //               // ),
      //               color: menu,
      //               height: Get.height*0.09,
      //               child: Column(
      //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //                 children: [
      //                   // Column(
      //                   //   children: [
      //                   //     IconButton(onPressed: (){}, icon: Icon(Icons.cancel_rounded, color: primaryHighlightColor)),
      //                   //   ]
      //                   // ),
      //
      //                   Row(
      //                     children: [
      //                       Text("Hackathon", style: TextStyle(
      //                         color: Colors.white,
      //                         fontSize: 17,
      //                         fontWeight: FontWeight.w500,
      //                       ),),],),
      //                   Row(
      //                     children: [
      //                       //Icon(Icons.)
      //                       Text("\u{20B9} 100", style: TextStyle(
      //                         color: Colors.white54,
      //                         fontSize: 15,
      //                         fontWeight: FontWeight.w500,
      //                       ),),
      //                     ],
      //                   )
      //
      //                 ]
      //               ),
      //             )
      //           ]
      //         )
      //       )
      //     )
      //   ]
      // )

      body: Column(
        children: [
          SizedBox(height: Get.height*0.15),
          Card(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: Get.width*0.08 ),
              height: Get.height*0.09,
              color: menu,
              child: Row(
                children: [
                  Container(
                    width: Get.width*0.5,
                    alignment: Alignment.centerLeft,
                    child: ListTile(
                              title: Text("Hackathon", style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500,
                                      ),),
                              subtitle: Text("\u{20B9} 100", style: TextStyle(
                                        color: Colors.white54,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                      ),),
                            )
                  ),
                  Expanded(
                    flex: 5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(onPressed: (){}, icon: Icon(Icons.cancel_outlined, color:primaryHighlightColor, size: Get.width*0.07,)),
                      ],
                    )
                  )
                      ],
                    )
                  )
              ),

          //Checking options
          SizedBox(height: Get.height*0.01),
          //Sub Total
          Container(
              padding: EdgeInsets.symmetric(horizontal: Get.width*0.125, vertical: Get.height*0.01 ),
            child: Row(
              children: [
                Container(
                  child: Text("Sub Total", style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),),
                ),
                Expanded(
                  flex:5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children:[Text("\u{20B9} 100.00", style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),),],),
                )
              ],
            )
          ),
          //Transaction Charge
          Container(
              padding: EdgeInsets.symmetric(horizontal: Get.width*0.125,vertical: Get.height*0.01 ),
              child: Row(
                children: [
                  Container(
                    child: Text("Transaction Charge", style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),),
                  ),
                  Expanded(
                    flex:5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children:[Text("\u{20B9} 2.00", style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),),],),
                  )
                ],
              )
          ),

          //Total
          Container(
              padding: EdgeInsets.symmetric(horizontal: Get.width*0.125,vertical: Get.height*0.01 ),
              child: Row(
                children: [
                  Container(
                    child: Text("Total", style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 2,
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),),
                  ),
                  Expanded(
                    flex:5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children:[Text("\u{20B9} 102.00", style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),),],),
                  )
                ],
              )
          ),

          SizedBox(height: Get.height*0.15),
          //Checkout Button
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("By clicking “Purchase”, you accept the terms.", style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),),
              SizedBox(height: 6),
              SizedBox(width: Get.width*0.5, height: 50, child:
              MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  minWidth: 60,
                  color: primaryHighlightColor,
                  onPressed: (){},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Purchase",style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),),
                      SizedBox(width: 6),
                      Icon(IconlyLight.arrow_right, color: Colors.white),
                    ],
                  )
              ),),
            ],
          )


          ],
      ),);
  }
}
