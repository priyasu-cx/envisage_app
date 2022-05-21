import 'package:envisage_app/controller/authentication/authentication_service.dart';
import 'package:envisage_app/model/events_details.dart';
import 'package:envisage_app/model/order.dart';
import 'package:envisage_app/utils/colors.dart';
import 'package:envisage_app/utils/services.dart';
import 'package:envisage_app/view/nav_pages/events.dart';
import 'package:envisage_app/view/nav_pages/team_details_for_2.dart';
import 'package:envisage_app/view/nav_pages/team_details_for_4.dart';
import 'package:envisage_app/view/screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:iconly/iconly.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher.dart';

class EventDetailsPage extends StatefulWidget {
  final bool isUpcoming;
  final int eventIndex;

  const EventDetailsPage({
    Key? key,
    required this.isUpcoming,
    required this.eventIndex,
  }) : super(key: key);

  @override
  State<EventDetailsPage> createState() =>
      _EventDetailsPageState(isUpcoming, eventIndex);
}

class _EventDetailsPageState extends State<EventDetailsPage> {
  final _razorpay = Razorpay();
  Order? orderDetails;

  bool OrderStatus = false;

  final bool isUpcoming;
  final int eventIndex;

  _EventDetailsPageState(
    this.isUpcoming,
    this.eventIndex,
  );

  EventDetails? event;
  bool isLoading = false;

  void getData() async {
    List<EventDetails> upcoming =
        await AuthenticationService().fetchEventDetails(isUpcoming);

    setState(() {
      event = upcoming[eventIndex];
      isLoading = true;
    });
  }

  void getOrderData() async {
    orderDetails = await OrderHandle().getOrder();
  }

  void launchWhatsapp({@required number, @required message}) async {
    final Uri _url = Uri.parse("whatsapp://send?phone=$number&text=$message");

    if (!await launchUrl(_url)) throw 'Could not launch $_url';
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
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
    print('Error Response: $response');
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet is selected
    print('External SDK Response: $response');
  }
// MIr4H6uK6tebUGCpIYMGIHdp

  void openCheckout(double amount, String eventName) async {
    getOrderData();
    int value = (amount * 100).toInt();
    var options = {
      'key': 'rzp_test_mWdZk20UX7IlbJ',
      'amount': value, //in the smallest currency sub-unit.
      'name': 'IIC TMSL',
      'order_id': orderDetails?.id, // Generate order_id using Orders API
      'description': eventName,
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
  }

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    return !isLoading
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
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              leading: IconButton(
                icon: Icon(
                  IconlyLight.arrow_left,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              title: Text(
                "Event Details",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            body: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset("assets/Events/event_details_page.png"),
                      Padding(
                        padding: EdgeInsets.only(
                          top: _height * 0.0246,
                          left: _width * 0.077,
                          bottom: _height * 0.05,
                        ),
                        child: Text(
                          event!.name,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 30,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: _height * 0.03,
                        ),
                        child: EventDetailsWidget(
                          _width,
                          IconlyBold.calendar,
                          event!.date,
                          "Date",
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: _height * 0.03,
                        ),
                        child: EventDetailsWidget(
                          _width,
                          IconlyBold.location,
                          event!.location,
                          "Location",
                        ),
                      ),
                      event!.maxTeamSize == null
                          ? Padding(
                              padding: EdgeInsets.only(
                                bottom: _height * 0.03,
                              ),
                              child: EventDetailsWidget(
                                _width,
                                IconlyBold.profile,
                                "Solo Event",
                                "Team Size",
                              ),
                            )
                          : Padding(
                              padding: EdgeInsets.only(
                                bottom: _height * 0.03,
                              ),
                              child: EventDetailsWidget(
                                _width,
                                IconlyBold.user_3,
                                event!.maxTeamSize.toString() + " Members",
                                "Team Size",
                              ),
                            ),
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: _height * 0.08,
                        ),
                        child: OrganizerDetailWidget(
                          _width,
                          "assets/Events/organizer.png",
                          event!.lead,
                          event!.leadContact,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: _width * 0.077,
                          bottom: _height * 0.03,
                        ),
                        child: Text(
                          "About Event",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: _width * 0.077,
                          right: _width * 0.077,
                          bottom: _height * 0.13,
                        ),
                        child: Text(
                          event!.about,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: _width,
                    height: _height * 0.3,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.white, Colors.transparent],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
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
                      event!.price,
                      event!,
                    ),
                  ),
                ),
              ],
            ),
          );
  }

  Future<dynamic> bottomSheet(BuildContext context, EventDetails _event) {
    double subTotal = 0;
    double transactionCharge = 0;
    double total = 0;

    subTotal = double.parse(_event.price.toString());
    transactionCharge = 0.02 * subTotal;
    total = subTotal + transactionCharge;

    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    return showModalBottomSheet(
        backgroundColor: primaryBackgroundColor,
        context: context,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
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
                  child: CheckoutButton(
                    _height,
                    total,
                    _event.name,
                  ),
                ),
              ),
            ],
          );
        });
  }

  Material CheckoutButton(double _height, double amount, String eventName) {
    return Material(
      color: primaryHighlightColor,
      borderRadius: BorderRadius.all(Radius.circular(8)),
      child: InkWell(
        splashColor: Colors.white30,
        onTap: () async {
          openCheckout(amount, eventName);
          setState(() {
            // OrderStatus = true;
          });
          Navigator.of(context).pop();
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

  Material ATCButton(double _height, int _price, EventDetails _event) {
    return Material(
      color: primaryHighlightColor,
      borderRadius: BorderRadius.all(Radius.circular(8)),
      child: InkWell(
        splashColor: primaryHighlightColor,
        onTap: () async {
          //ATC(_event);
          if (_event.id == "biz_debate") {
            final Uri _url = Uri.parse("https://bit.ly/evg22_tweeters");
            launchUrl(_url, mode: LaunchMode.externalApplication);
          }
          if (_event.id == "biz_plan") {
            final Uri _url = Uri.parse("https://bit.ly/evg22_bizplan");
            launchUrl(_url, mode: LaunchMode.externalApplication);
          }
          if (_event.id == "brain") {
            final Uri _url = Uri.parse("https://bit.ly/evg22_brainitout");
            launchUrl(_url, mode: LaunchMode.externalApplication);
          }
          if (_event.id == "case_study") {
            final Uri _url = Uri.parse("https://bit.ly/evg22_casestudy");
            launchUrl(_url, mode: LaunchMode.externalApplication);
          }
          if (_event.id == "hackathon") {
            final Uri _url = Uri.parse("https://bit.ly/evg22_hackurway");
            launchUrl(_url, mode: LaunchMode.externalApplication);
          }
          if (_event.id == "mock_ipl") {
            final Uri _url = Uri.parse("https://bit.ly/evg22_mockipl");
            launchUrl(_url, mode: LaunchMode.externalApplication);
          }
          if (_event.id == "reels") {
            final Uri _url = Uri.parse("https://bit.ly/evg22_reelomania");
            launchUrl(_url, mode: LaunchMode.externalApplication);
          }
          if (_event.id == "stockify") {
            final Uri _url = Uri.parse("https://bit.ly/evg22_stockify");
            launchUrl(_url, mode: LaunchMode.externalApplication);
          }
        },
        child: Container(
          height: _height * 0.0738,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                // _price == 0 ? "ADD TO CART - FREE" : "ADD TO CART - ₹$_price",
                _price == 0 ? "PURCHASE - FREE" : "PURCHASE - ₹$_price",
                style: const TextStyle(
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

  void ATC(EventDetails _event) async {
    bool check = await AuthenticationService().isRegistered(_event, null);
    if (!check) {
      if (_event.isTeamEvent) {
        if (_event.maxTeamSize == 2) {
          Navigator.of(context).push(MaterialPageRoute(
              builder: ((context) => TeamDetailsPage2(event: _event))));
        } else if (_event.maxTeamSize == 4) {
          Navigator.of(context).push(MaterialPageRoute(
              builder: ((context) => TeamDetailsPage4(event: _event))));
        }
      } else {
        //
        //
        // Add Payment gateway here !!!!!!
        //
        await bottomSheet(context, _event);
        print(OrderStatus);
        // Navigator.of(context).pop();
        //
        //
        //
        if (OrderStatus == true) {
          String status =
              await AuthenticationService().registerSoloEvent(_event);
          if (status == "success") {
            Fluttertoast.showToast(msg: "Successfully registered for event");
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => style()));
          } else {
            Fluttertoast.showToast(msg: status);
          }
        } else {
          Fluttertoast.showToast(msg: "Payment Failed");
          // Navigator.of(context).pushReplacement(
          //     MaterialPageRoute(builder: (context) => style()));
        }
      }
    } else {
      Fluttertoast.showToast(msg: " Already registered for this event! ");
    }
  }

  Container OrganizerDetailWidget(
      double _width, String _image, String _name, String _number) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: _width * 0.077,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              Image.asset(
                _image,
                height: 48,
                width: 48,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: _width * 0.05,
                  right: _width * 0.06,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4),
                      child: Text(
                        _name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    const Text(
                      "Organizer",
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xff747688),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(child: Container()),
              Material(
                color: Color(0xff5669FF).withAlpha(50),
                borderRadius: BorderRadius.all(Radius.circular(8)),
                child: InkWell(
                  onTap: () {},
                  splashColor: Color(0xff5669FF).withAlpha(50),
                  child: Container(
                    width: 48,
                    height: 48,
                    child: IconButton(
                      onPressed: () {
                        print(_number);
                        launchWhatsapp(
                            number: _number,
                            message:
                                "Hey there, I need some help in your event.");
                      },
                      icon: const Icon(FontAwesomeIcons.whatsapp,
                          color: Color(0xff5669FF), size: 30),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container EventDetailsWidget(
      double _width, IconData _iconData, String _body, String _footer) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: _width * 0.077,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: Color(0xff5669FF).withAlpha(50),
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                child: Icon(
                  _iconData,
                  color: Color(0xff5669FF),
                  size: 30,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: _width * 0.05,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4),
                      child: Text(
                        _body,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Text(
                      _footer,
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xff747688),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
