import 'package:envisage_app/utils/colors.dart';
import 'package:flutter/material.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBackgroundColor,
      body: Center(
        child: TextButton(
          child: Text("Press"),
          onPressed: () {
            bottomSheet(context);
          },
        ),
      ),
    );
    // bottomSheet(context);
  }

  Future<dynamic> bottomSheet(BuildContext context) {
    double subTotal = 0;
    double transactionCharge = 0;
    double total = 0;

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
                  child: ATCButton(
                    _height,
                  ),
                ),
              ),
            ],
          );
        });
  }

  Material ATCButton(double _height) {
    return Material(
      color: primaryHighlightColor,
      borderRadius: BorderRadius.all(Radius.circular(8)),
      child: InkWell(
        splashColor: Colors.white30,
        onTap: () {},
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
}
