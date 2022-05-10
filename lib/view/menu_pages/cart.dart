import 'package:envisage_app/controller/cart/cart_controller.dart';
import 'package:envisage_app/view/notification.dart';
import 'package:flutter/material.dart';
import 'package:envisage_app/utils/colors.dart';
import 'package:iconly/iconly.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';

List<Map> cart1 = [
  {
    'name': 'Hackofy',
    'price': "100",
  },
  {
    'name': 'Stickify',
    'price': "150",
  },
  {
    'name': 'Hello Hello',
    'price': "80",
  },
  {
    'name': 'Hehehehe',
    'price': "120",
  },
];

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  double subTotal = 0;
  double transactionCharge = 0;
  double total = 0;

  @override
  void initState() {
    setCart();
    super.initState();
  }

  void setCart() async {
    var cart = await CartController().getCart();
    setState(() {
      // cart1 = cart;
    });
  }

  void delete(int index) {
    double price = double.parse(cart1[index]["price"]);
    setState(() {
      // subTotal = subTotal - price;
      // transactionCharge = 0.02 * subTotal;
      // total = subTotal + transactionCharge;
      subTotal = 0;
      transactionCharge = 0;
      total = 0;
      cart1.removeAt(index);
    });
  }

  void func(int index) {
    setState(() {
      subTotal = int.parse(cart1[index]["price"]) + subTotal;
      print(subTotal);
      transactionCharge = 0.02 * subTotal;
      transactionCharge =
          double.parse(transactionCharge.toStringAsExponential(1));
      total = subTotal + transactionCharge;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    for (var i = 0; i < cart1.length; i++) {
      func(i);
    }
    return Scaffold(
      backgroundColor: primaryBackgroundColor,
      appBar: PreferredSize(
        child: SafeArea(
            child: Container(
                child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: Get.width * 0.03,
                      vertical: Get.height * 0.01,
                    ),
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
                            onPressed: () {
                              Get.to(() => NotificationPage());
                            },
                            icon: Icon(
                              IconlyLight.notification,
                              color: Colors.white,
                            ),
                          ),
                          //IconButton(onPressed: (){},icon: Icon(IconlyBold.arrow_down_square,color: Colors.white,),),
                        ])))),
        preferredSize: Size.fromHeight(Get.height * 0.1),
      ),
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         leading: IconButton(
//           icon: const Icon(IconlyLight.arrow_left),
//           onPressed: () {
//             CartController();
//             Navigator.of(context).pop();
//           },
//         ),
//         title: Text(
//           "Cart",
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 20,
//           ),
//         ),
//       ),
      body: Container(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                    height: Get.height * 0.6,
                    padding:
                        EdgeInsets.symmetric(horizontal: Get.width * 0.077),
                    child: ListView.builder(
                      //padding: EdgeInsets.only(top:Get.height*0.02),

                      itemBuilder: (context, index) => CartEvents(index),
                      itemCount: cart1.length,
                    )),
                // Text(
                //   "DATA",
                //   style: TextStyle(
                //     color: Colors.white,
                //   ),
                // ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: _width,
                height: _height * 0.27,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: _width * 0.077,
                        vertical: _width * 0.02,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Subtotal",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          Expanded(child: Container()),
                          Text(
                            "₹ $subTotal",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: _width * 0.077,
                        vertical: _width * 0.02,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Transaction Charge",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          Expanded(child: Container()),
                          Text(
                            "₹ $transactionCharge",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: _width * 0.077,
                        vertical: _width * 0.02,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Total",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          Expanded(child: Container()),
                          Text(
                            " ₹ $total",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "By clicking “Purchase”, you accept the terms & conditions.",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: _width * 0.077,
                        ),
                        child: ATCButton(
                          _height,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget CartEvents(index) {
    return Card(
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: Get.width * 0.08),
            height: Get.height * 0.09,
            color: menu,
            child: Row(
              children: [
                Container(
                    width: Get.width * 0.5,
                    alignment: Alignment.centerLeft,
                    child: ListTile(
                      title: Text(
                        cart1[index]["name"],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      subtitle: Text(
                        "₹ " + cart1[index]["price"],
                        style: TextStyle(
                          color: Colors.white54,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )),
                Expanded(
                    flex: 5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                            onPressed: () {
                              delete(index);
                            },
                            icon: Icon(
                              Icons.cancel_outlined,
                              color: primaryHighlightColor,
                              size: Get.width * 0.07,
                            )),
                      ],
                    ))
              ],
            )));
  }

  Material ATCButton(double _height) {
    return Material(
      color: primaryHighlightColor,
      borderRadius: BorderRadius.all(Radius.circular(8)),
      child: InkWell(
        splashColor: primaryHighlightColor,
        onTap: () {
          print(" Purchased!! ");
        },
        child: Container(
          height: _height * 0.0738,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                " PURCHASE ",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Image.asset(
                  "assets/icons/forward_arrow_circle.png",
                  height: 30,
                  width: 30,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container EmptyCart() {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.network(
                "https://assets8.lottiefiles.com/packages/lf20_jmejybvu.json"),
            const Text(
              " No Items in Cart ! ",
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}

// class cart extends StatefulWidget {
//   const cart({Key? key}) : super(key: key);

//   @override
//   State<cart> createState() => _cartState();
// }

// class _cartState extends State<cart> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: primaryBackgroundColor,
//       extendBodyBehindAppBar: true,
//       appBar: PreferredSize(child:SafeArea(
//           child: Container(
//               child: Padding(
//                   padding: const EdgeInsets.all(20),
//                   child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: <Widget>[
//                         IconButton(icon: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
//                           onPressed: (){
//                             setState(() {
//                               //print("Hello World");
//                               Get.back();
//                             });
//                           },),
//                         Text("Cart", style: TextStyle(
//                           color: Colors.white,
//                           letterSpacing: 3,
//                           fontSize: 24,
//                           fontWeight: FontWeight.w600,
//                         ),),
//                         IconButton(onPressed: (){},icon: Icon(IconlyBold.notification,color: Colors.white,),),
//                         //IconButton(onPressed: (){},icon: Icon(IconlyBold.arrow_down_square,color: Colors.white,),),
//                       ]
//                   )
//               )
//           )
//       ),preferredSize: Size.fromHeight(Get.height*0.1),),

//       // body: Column(
//       //   children:[
//       //     SizedBox(height: Get.height*0.15),
//       //     Container(
//       //       child: Padding(
//       //         padding: EdgeInsets.all(0),
//       //         //padding: EdgeInsets.symmetric(horizontal: Get.width*0.02),
//       //         child: Column(
//       //           children: [
//       //             Container(
//       //               padding: EdgeInsets.symmetric(horizontal: Get.width*0.1 ),
//       //               // decoration: BoxDecoration(
//       //               //   color: menu,
//       //               //   //borderRadius: BorderRadius.circular(10),
//       //               // ),
//       //               color: menu,
//       //               height: Get.height*0.09,
//       //               child: Column(
//       //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       //                 children: [
//       //                   // Column(
//       //                   //   children: [
//       //                   //     IconButton(onPressed: (){}, icon: Icon(Icons.cancel_rounded, color: primaryHighlightColor)),
//       //                   //   ]
//       //                   // ),
//       //
//       //                   Row(
//       //                     children: [
//       //                       Text("Hackathon", style: TextStyle(
//       //                         color: Colors.white,
//       //                         fontSize: 17,
//       //                         fontWeight: FontWeight.w500,
//       //                       ),),],),
//       //                   Row(
//       //                     children: [
//       //                       //Icon(Icons.)
//       //                       Text("\u{20B9} 100", style: TextStyle(
//       //                         color: Colors.white54,
//       //                         fontSize: 15,
//       //                         fontWeight: FontWeight.w500,
//       //                       ),),
//       //                     ],
//       //                   )
//       //
//       //                 ]
//       //               ),
//       //             )
//       //           ]
//       //         )
//       //       )
//       //     )
//       //   ]
//       // )

//       body: Column(
//         children: [
//           SizedBox(height: Get.height*0.15),
//           Card(
//             child: Container(
//               padding: EdgeInsets.symmetric(horizontal: Get.width*0.08 ),
//               height: Get.height*0.09,
//               color: menu,
//               child: Row(
//                 children: [
//                   Container(
//                     width: Get.width*0.5,
//                     alignment: Alignment.centerLeft,
//                     child: ListTile(
//                               title: Text("Hackathon", style: TextStyle(
//                                         color: Colors.white,
//                                         fontSize: 17,
//                                         fontWeight: FontWeight.w500,
//                                       ),),
//                               subtitle: Text("\u{20B9} 100", style: TextStyle(
//                                         color: Colors.white54,
//                                         fontSize: 15,
//                                         fontWeight: FontWeight.w500,
//                                       ),),
//                             )
//                   ),
//                   Expanded(
//                     flex: 5,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         IconButton(onPressed: (){}, icon: Icon(Icons.cancel_outlined, color:primaryHighlightColor, size: Get.width*0.07,)),
//                       ],
//                     )
//                   )
//                       ],
//                     )
//                   )
//               ),
//
//           //Checking options
//           SizedBox(height: Get.height*0.01),
//           //Sub Total
//           Container(
//               padding: EdgeInsets.symmetric(horizontal: Get.width*0.125, vertical: Get.height*0.01 ),
//             child: Row(
//               children: [
//                 Container(
//                   child: Text("Sub Total", style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 18,
//                     fontWeight: FontWeight.w500,
//                   ),),
//                 ),
//                 Expanded(
//                   flex:5,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children:[Text("\u{20B9} 100.00", style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 18,
//                       fontWeight: FontWeight.w500,
//                     ),),],),
//                 )
//               ],
//             )
//           ),
//           //Transaction Charge
//           Container(
//               padding: EdgeInsets.symmetric(horizontal: Get.width*0.125,vertical: Get.height*0.01 ),
//               child: Row(
//                 children: [
//                   Container(
//                     child: Text("Transaction Charge", style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 18,
//                       fontWeight: FontWeight.w500,
//                     ),),
//                   ),
//                   Expanded(
//                     flex:5,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children:[Text("\u{20B9} 2.00", style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 18,
//                         fontWeight: FontWeight.w500,
//                       ),),],),
//                   )
//                 ],
//               )
//           ),
//
//           //Total
//           Container(
//               padding: EdgeInsets.symmetric(horizontal: Get.width*0.125,vertical: Get.height*0.01 ),
//               child: Row(
//                 children: [
//                   Container(
//                     child: Text("Total", style: TextStyle(
//                       color: Colors.white,
//                       letterSpacing: 2,
//                       fontSize: 20,
//                       fontWeight: FontWeight.w800,
//                     ),),
//                   ),
//                   Expanded(
//                     flex:5,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children:[Text("\u{20B9} 102.00", style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 20,
//                         fontWeight: FontWeight.w800,
//                       ),),],),
//                   )
//                 ],
//               )
//           ),
//
//           SizedBox(height: Get.height*0.15),
//           //Checkout Button
//           Column(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text("By clicking “Purchase”, you accept the terms.", style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 12,
//                   fontWeight: FontWeight.w400,
//                 ),),
//               SizedBox(height: 6),
//               SizedBox(width: Get.width*0.5, height: 50, child:
//               MaterialButton(
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   minWidth: 60,
//                   color: primaryHighlightColor,
//                   onPressed: (){},
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text("Purchase",style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 18,
//                         fontWeight: FontWeight.w400,
//                       ),),
//                       SizedBox(width: 6),
//                       Icon(IconlyLight.arrow_right, color: Colors.white),
//                     ],
//                   )
//               ),),
//             ],
//           )
//
//
//           ],
//       ),);
//   }
// }
