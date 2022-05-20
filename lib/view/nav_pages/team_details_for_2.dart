import 'package:envisage_app/controller/authentication/authentication_service.dart';
import 'package:envisage_app/controller/cart/Temp_List.dart';
import 'package:envisage_app/controller/cart/cart_controller1.dart';
import 'package:envisage_app/model/events_details.dart';
import 'package:envisage_app/model/team_details.dart';
import 'package:envisage_app/utils/colors.dart';
import 'package:envisage_app/utils/event_model.dart';
import 'package:envisage_app/utils/helper.dart';
import 'package:envisage_app/view/menu_pages/registered_events.dart';
import 'package:envisage_app/view/screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class TeamDetailsPage2 extends StatefulWidget {
  EventDetails event;
  TeamDetailsPage2({Key? key, required this.event}) : super(key: key);

  @override
  State<TeamDetailsPage2> createState() => _TeamDetailsPage2State(event: event);
}

class _TeamDetailsPage2State extends State<TeamDetailsPage2> {
  EventDetails event;
  _TeamDetailsPage2State({required this.event});

  double subTotal = 0;
  double transactionCharge = 0;
  double total = 0;

  // form key
  final _formKey = GlobalKey<FormState>();

  // editing controller
  final TextEditingController teamNameController = TextEditingController();
  final TextEditingController teamLeadController = TextEditingController();
  final TextEditingController teamMember1Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    subTotal = double.parse(event.price.toString());
    transactionCharge = 0.02 * subTotal;
    total = subTotal + transactionCharge;

    // Full Name Field
    final teamNameField = TextFormField(
      autofocus: false,
      keyboardType: TextInputType.name,
      controller: teamNameController,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please enter your Team Name");
        }
        return null;
      },
      onSaved: (value) {
        teamNameController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(
          IconlyLight.add_user,
          color: Colors.white30,
        ),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 0, 15),
        hintText: " Team Name ",
        hintStyle: TextStyle(
          color: Colors.white30,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.white,
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.white,
            width: 1,
          ),
        ),
      ),
      style: TextStyle(
        color: Colors.white,
      ),
    );

    // Team lead Id
    final teamLeadField = TextFormField(
      autofocus: false,
      controller: teamLeadController,
      keyboardType: TextInputType.name,
      validator: (value) {
        if (value == "") {
          return ("Please enter Team Lead EVG-ID");
        }
        return null;
      },
      onSaved: (value) {
        teamLeadController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(
          IconlyLight.user_1,
          color: Colors.white30,
        ),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 0, 15),
        hintText: "Team Lead EVG-ID",
        hintStyle: TextStyle(
          color: Colors.white30,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.white,
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.white,
            width: 1,
          ),
        ),
      ),
      style: TextStyle(
        color: Colors.white,
      ),
    );

    // Team member1 Id
    final teamMember1Field = TextFormField(
      autofocus: false,
      controller: teamMember1Controller,
      keyboardType: TextInputType.name,
      validator: (value) {
        if (value == "") {
          return null;
        }
        return null;
      },
      onSaved: (value) {
        teamLeadController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(
          IconlyLight.user_1,
          color: Colors.white30,
        ),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 0, 15),
        hintText: "Team Member EVG-ID",
        hintStyle: TextStyle(
          color: Colors.white30,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.white,
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.white,
            width: 1,
          ),
        ),
      ),
      style: TextStyle(
        color: Colors.white,
      ),
    );

    //
    //
    //
    return Scaffold(
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
      ),
      body: SingleChildScrollView(child: Container(
        padding: EdgeInsets.symmetric(horizontal: _width * 0.077),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: _height * 0.12,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    " Add Team Details ",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  height: _height * 0.04,
                ),
                teamNameField,
                Container(
                  height: _height * 0.02,
                ),
                teamLeadField,
                Container(
                  height: _height * 0.02,
                ),
                teamMember1Field,
                SizedBox(
                  height: _height * 0.14,
                ),
                Container(
                  width: _width,
                  height: _height * 0.3,
                  child: Column(
                    children: [
                      // Padding(
                      //   padding: EdgeInsets.symmetric(
                      //     // horizontal: _width * 0.077,
                      //     vertical: _width * 0.02,
                      //   ),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.center,
                      //     children: [
                      //       Text(
                      //         "Subtotal",
                      //         style: TextStyle(
                      //           color: Colors.white,
                      //           fontSize: 16,
                      //         ),
                      //       ),
                      //       Expanded(child: Container()),
                      //       Text(
                      //         "₹ $subTotal",
                      //         style: TextStyle(
                      //           color: Colors.white,
                      //           fontSize: 16,
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // Padding(
                      //   padding: EdgeInsets.symmetric(
                      //     // horizontal: _width * 0.077,
                      //     vertical: _width * 0.02,
                      //   ),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.center,
                      //     children: [
                      //       Text(
                      //         "Transaction Charge",
                      //         style: TextStyle(
                      //           color: Colors.white,
                      //           fontSize: 16,
                      //         ),
                      //       ),
                      //       Expanded(child: Container()),
                      //       Text(
                      //         "₹ $transactionCharge",
                      //         style: TextStyle(
                      //           color: Colors.white,
                      //           fontSize: 16,
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // Padding(
                      //   padding: EdgeInsets.symmetric(
                      //     // horizontal: _width * 0.077,
                      //     vertical: _width * 0.02,
                      //   ),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.center,
                      //     children: [
                      //       Text(
                      //         "Total",
                      //         style: TextStyle(
                      //           color: Colors.white,
                      //           fontSize: 16,
                      //         ),
                      //       ),
                      //       Expanded(child: Container()),
                      //       Text(
                      //         " ₹ $total",
                      //         style: TextStyle(
                      //           color: Colors.white,
                      //           fontSize: 16,
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // Text(
                      //   "By clicking “Purchase”, \nyou accept the terms & conditions.",
                      //   style: TextStyle(
                      //     fontSize: 12,
                      //     color: Colors.white,
                      //   ),textAlign: TextAlign.center,
                      // ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 15,
                            // horizontal: _width * 0.077,
                          ),
                          child: ATCButton(
                            _height,
                            event,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),)
    );
  }

  Material ATCButton(double _height, EventDetails event) {
    return Material(
      color: primaryHighlightColor,
      borderRadius: BorderRadius.all(Radius.circular(8)),
      child: InkWell(
        splashColor: primaryHighlightColor,
        onTap: () {
          _handler(
            event,
            teamNameController,
            teamLeadController,
            teamMember1Controller,
          );
        },
        child: Container(
          height: _height * 0.0738,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                " REGISTER ",
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

  void _handler(
      EventDetails event,
    TextEditingController teamNameController,
    TextEditingController teamLeadController,
    TextEditingController teamMember1Controller,
  ) async {
    final cartController = Get.put(CartController());
    if (_formKey.currentState!.validate()) {
      String teamID = getId();
      TeamDetails teamData = TeamDetails(
        teamId: teamID,
        teamName: teamNameController.text,
        teamLead: teamLeadController.text,
        teamMember1: teamMember1Controller.text,
        eventId: event.id!,
      );
      bool checkRegistered =
          await AuthenticationService().isAnyMemberRegistered(event, teamData);
      if (!checkRegistered) {
        if(event.price>0){
          setState(() {
            cartController.addProduct(Events(name: event.name, price: event.price, id: event.id, event: event));
            RegTeams.add(teamData);
          });
          Navigator.of(context).pop();// Add to cart
        }else{
          String status =
          await AuthenticationService().registerTeamEvent(event, teamData);
          if (status == "success") {
            Fluttertoast.showToast(msg: "Successfully registered for event");
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => reg_events()));
          } else {
            Fluttertoast.showToast(msg: status);
          }
        }
        //
        //
        // Add Payment Gateway here !!!!!!!!
        //
        //
        // String status =
        //     await AuthenticationService().registerTeamEvent(event, teamData);
        // if (status == "success") {
        //   Fluttertoast.showToast(msg: "Successfully registered for event");
        //   Navigator.of(context).pushReplacement(
        //       MaterialPageRoute(builder: (context) => style()));
        // } else {
        //   Fluttertoast.showToast(msg: status);
        // }
      } else {
        Fluttertoast.showToast(msg: " Already registered for this event! ");
      }
    }
  }
}
