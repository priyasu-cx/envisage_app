import 'dart:math';

import 'package:envisage_app/controller/authentication/authentication_service.dart';
import 'package:envisage_app/controller/cart/Temp_List.dart';
import 'package:envisage_app/controller/cart/cart_controller1.dart';
import 'package:envisage_app/model/events_details.dart';
import 'package:envisage_app/model/order.dart';
import 'package:envisage_app/utils/CreateTeam.dart';
import 'package:envisage_app/utils/event_model.dart';
import 'package:envisage_app/utils/services.dart';
import 'package:envisage_app/view/menu_pages/UpiPage.dart';
import 'package:envisage_app/view/menu_pages/registered_events.dart';
import 'package:envisage_app/view/notification.dart';
import 'package:envisage_app/view/screen.dart';
import 'package:flutter/material.dart';
import 'package:envisage_app/utils/colors.dart';
import 'package:iconly/iconly.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../model/user_details.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  //Razorpay ---------------------------------------------
  final _razorpay = Razorpay();
  Order? orderDetails;

  bool OrderStatus = false;

  final CartController controller = Get.find();

  int subTotal = 0;
  double transactionCharge = 0;
  double total = 0;

  void getOrderData() async {
    orderDetails = await OrderHandle().getOrder();
  }

  var userData;

  void getData() async {
    UserDetails user = await AuthenticationService().fetchUserDetails();
    setState(() {
      userData = user;
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    print('Success Response: $response');
    setState(() {
      OrderStatus = true;
    });
    RegisterCall();
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
    print('Error Response: $response');
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet is selected
    print('External SDK Response: $response');
  }

  Future<bool> openCheckout(double amount, List eventid) async {
    getOrderData();
    int value = (amount * 100).toInt();
    var options = {
      'key': 'rzp_test_mWdZk20UX7IlbJ',
      'amount': value, //in the smallest currency sub-unit.
      'name': 'IIC TMSL',
      'order_id': orderDetails?.id, // Generate order_id using Orders API
      'description': "Registering in " + eventid.length.toString() + " events ",
      'timeout': 600, // in seconds
      'prefill': {
        'email': await AuthenticationService().fetchEmail(),
      },
    };

    try {
      _razorpay.open(options);
    } catch (err) {
      debugPrint('Error: $err');
    }
    return true;
  }

  List<dynamic> GlobalCart = [];
  void RegisterCall() {
    // print("-----------------------------------------------------------");
    // print(GlobalCart);
    register(GlobalCart, RegTeams);
    RegTeams = [];
  }

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

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
                              "Cart",
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
//
        body: Obx(
          () => controller.events.length == 0
              ? EmptyCart()
              : Container(
                  child: Stack(
                    children: [
                      Obx(
                        () => Column(
                          children: [
                            Container(
                                height: Get.height * 0.6,
                                padding: EdgeInsets.symmetric(
                                    horizontal: Get.width * 0.077),
                                child: ListView.builder(
                                  //padding: EdgeInsets.only(top:Get.height*0.02),
                                  itemCount: controller.events.length,
                                  //itemBuilder: (context, index) => CartEvents(index),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return CartEventCard(
                                      controller: controller,
                                      events: controller.events.keys
                                          .toList()[index],
                                      index: index,
                                    );
                                  },
                                )),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          width: _width,
                          height: _height * 0.3,
                          child: SingleChildScrollView(
                              child: Obx(
                            () => Column(
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
                                      controller.events.length > 0
                                          ? Text(
                                              "₹ ${controller.total}",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                              ),
                                            )
                                          : Text(
                                              "₹ 0",
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
                                        "₹ ${controller.total * 0.02}",
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
                                        " ₹ ${controller.total + controller.total * 0.02}",
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
                                    // child: UPIButton(
                                    //   _height,
                                    //   (controller.total + controller.total*0.02),
                                    //   Cart,

                                    child: ATCButton(
                                      _height,
                                      (controller.total +
                                          controller.total * 0.02),
                                      Cart,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )),
                        ),
                      ),
                    ],
                  ),
                ),
        ));
  }

  Material UPIButton(double _height, double total, List eventid) {
    return Material(
      color: primaryHighlightColor,
      borderRadius: BorderRadius.all(Radius.circular(8)),
      child: InkWell(
        splashColor: primaryHighlightColor,
        onTap: () {
          // Get.to(()=>UpiPay(amount: total,ID: eventid));
        },
        child: Container(
          height: 50,
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

  Material ATCButton(double _height, double total, List eventid) {
    return Material(
      color: primaryHighlightColor,
      borderRadius: BorderRadius.all(Radius.circular(8)),
      child: InkWell(
        splashColor: primaryHighlightColor,
        onTap: () {
          setState(() {
            GlobalCart = eventid;
          });
          // print("*********************************************************");
          // print(GlobalCart);
          openCheckout(total, eventid);
          // print(OrderStatus);
          //register(eventid);
          Cart = [];
          controller.clearall();
          // Get.to(()=>reg_events);
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

  void register(List eventid, List regteam) {
    int i = 0;
    eventid.forEach((element) async {
      print(element);
      EventDetails _event =
          await AuthenticationService().fetchEventbyID(element);
      String currentUser = userData.evgId;
      if (_event.isTeamEvent) {
        CreateTeam(currentUser, _event, regteam[i]);
        i++;
      } else {
        String status = await AuthenticationService().registerSoloEvent(_event);
        if (status == "success") {
          Fluttertoast.showToast(msg: "Successfully registered for event");
          //Navigator.of(context).pop();
          Get.to(() => reg_events);
          // Navigator.of(context).pushReplacement(
          //     MaterialPageRoute(builder: (context) => style()));
        } else {
          Fluttertoast.showToast(msg: status);
        }
      }
    });
  }

  Container EmptyCart() {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Lottie.network("https://assets8.lottiefiles.com/packages/lf20_jmejybvu.json"),
            Image.asset("assets/cart/emptycart.png"),
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

class CartEventCard extends StatelessWidget {
  final CartController controller;
  final Events events;
  final int index;

  const CartEventCard({
    Key? key,
    required this.controller,
    required this.events,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String price = events.price.toString();
    if (!Cart.contains(events.id)) {
      Cart.add(events.id);
    }
    print(Cart);
    //print(RegTeams);

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
                        events.name,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      subtitle: Text(
                        "₹ " + price,
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
                              controller.removeProduct(events);
                              Cart.remove(events.id);
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
}
