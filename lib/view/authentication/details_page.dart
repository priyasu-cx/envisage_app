import 'package:envisage_app/controller/authentication/authentication_service.dart';
import 'package:envisage_app/model/user_details.dart';
import 'package:envisage_app/utils/colors.dart';
import 'package:envisage_app/utils/helper.dart';
import 'package:envisage_app/view/homepage.dart';
import 'package:envisage_app/view/screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:iconly/iconly.dart';

import '../screen.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  // form key
  final _formKey = GlobalKey<FormState>();

  // editing controller
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController collegeController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController refferalController = TextEditingController();
  String? gender;
  String? state;

  // Gender List Items
  final List<String> genders = ["Male", "Female", "Prefer not to say"];

  // State List Items
  final List<String> states = [
    "Andaman and Nicobar",
    "Andhra Pradesh",
    "Arunachal Pradesh",
    "Assam",
    "Bihar",
    "Chandigarh",
    "Chhattisgarh",
    "Dadra and Nagar Haveli",
    "Daman and Diu",
    "Delhi",
    "Goa",
    "Gujarat",
    "Haryana",
    "Himachal Pradesh",
    "Jammu and Kashmir",
    "Jharkhand",
    "Karnataka",
    "Kerala",
    "Ladakh",
    "Lakshadweep",
    "Madhya Pradesh",
    "Maharashtra",
    "Manipur",
    "Meghalaya",
    "Mizoram",
    "Nagaland",
    "Orissa",
    "Puducherry",
    "Punjab",
    "Rajasthan",
    "Sikkim",
    "Tamil Nadu",
    "Telangana",
    "Tripura",
    "Uttar Pradesh",
    "Uttarakhand",
    "West Bengal",
  ];

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    // Full Name Field
    final fullNameField = TextFormField(
      autofocus: false,
      keyboardType: TextInputType.name,
      controller: fullNameController,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please enter your Name");
        }
        return null;
      },
      onSaved: (value) {
        fullNameController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(
          IconlyLight.profile,
          color: Colors.white30,
        ),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 0, 15),
        hintText: " Full Name ",
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

    // Phone Field
    final phoneField = TextFormField(
      autofocus: false,
      keyboardType: TextInputType.phone,
      controller: phoneController,
      validator: (value) {
        RegExp regex = new RegExp(r'^(\+\d{1,3}[- ]?)?\d{10}$');
        if (value!.isEmpty) {
          return ("Please enter your Phone");
        }
        if (!regex.hasMatch(value)) {
          return ("Please enter valid Phone Number");
        }
        return null;
      },
      onSaved: (value) {
        phoneController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(
          IconlyLight.call,
          color: Colors.white30,
        ),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 0, 15),
        hintText: " Phone Number ",
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

    // Gender Form Field
    final genderField = DropdownButtonFormField(
      dropdownColor: primaryBackgroundColor,
      autofocus: false,
      elevation: 0,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      menuMaxHeight: _height * 0.4,
      icon: Icon(
        IconlyLight.arrow_down_2,
        color: Colors.white30,
      ),
      validator: (value) {
        if (value == null) {
          return ("Please select your Gender");
        }
        return null;
      },
      decoration: InputDecoration(
        prefixIcon: Icon(
          IconlyLight.user,
          color: Colors.white30,
        ),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 0, 15),
        hintText: " Phone Number ",
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
      onChanged: (genderValue) {
        setState(() {
          gender = genderValue.toString();
        });
      },
      hint: Text(
        "Gender",
        style: TextStyle(
          color: Colors.white30,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ),
      value: gender,
      items: genders
          .map((item) => DropdownMenuItem<String>(
                child: Text(
                  item,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white70,
                  ),
                ),
                value: item,
              ))
          .toList(),
    );

    // College Name Field
    final collegeField = TextFormField(
      autofocus: false,
      keyboardType: TextInputType.text,
      controller: collegeController,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please enter your College Name");
        }
        return null;
      },
      onSaved: (value) {
        collegeController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(
          IconlyLight.work,
          color: Colors.white30,
        ),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 0, 15),
        hintText: " College ",
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

    // City Name Field
    final cityField = TextFormField(
      autofocus: false,
      keyboardType: TextInputType.text,
      controller: cityController,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please enter your City");
        }
        return null;
      },
      onSaved: (value) {
        cityController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(
          IconlyLight.location,
          color: Colors.white30,
        ),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 0, 15),
        hintText: " City ",
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

    // State Form Field
    final stateField = DropdownButtonFormField(
      dropdownColor: primaryBackgroundColor,
      autofocus: false,
      elevation: 0,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      menuMaxHeight: _height * 0.4,
      icon: Icon(
        IconlyLight.arrow_down_2,
        color: Colors.white30,
      ),
      validator: (value) {
        if (value == null) {
          return ("Please select your State");
        }
        return null;
      },
      decoration: InputDecoration(
        prefixIcon: Icon(
          IconlyLight.discovery,
          color: Colors.white30,
        ),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 0, 15),
        hintText: " State ",
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
      onChanged: (stateValue) {
        setState(() {
          state = stateValue.toString();
        });
      },
      hint: Text(
        "State ",
        style: TextStyle(
          color: Colors.white30,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ),
      value: state,
      items: states
          .map((item) => DropdownMenuItem<String>(
                child: Text(
                  item,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white70,
                  ),
                ),
                value: item,
              ))
          .toList(),
    );

    // Refferal Field
    final refferalField = TextFormField(
      autofocus: false,
      controller: refferalController,
      keyboardType: TextInputType.name,
      validator: (value) {
        if (value == "") {
          return null;
        } else if (!RegExp(
                "/^22EVG+[A-Z]+[A-Z]+[A-Z]+[0-9]+[0-9]+[0-9]+[0-9]+[0-9]+[0-9]\$")
            .hasMatch(value!)) {
          return ("Please enter a valid Refferal Code");
        }
        return null;
      },
      onSaved: (value) {
        refferalController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon: Icon(
          IconlyLight.ticket,
          color: Colors.white30,
        ),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 0, 15),
        hintText: "Refferal Code",
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

    // Continue button
    final continueButton = Material(
      color: primaryHighlightColor,
      borderRadius: BorderRadius.circular(8),
      child: MaterialButton(
        onPressed: () {
          _details(fullNameController, phoneController, collegeController,
              cityController, refferalController);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Text(
              " CONTINUE ",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            Container(
              width: _width * 0.2,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Image.asset(
                "assets/icons/forward_arrow_circle.png",
                height: 30,
                width: 30,
              ),
            ),
          ],
        ),
      ),
    );

    return Scaffold(
      backgroundColor: primaryBackgroundColor,
      body: Container(
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
                    " Add Details ",
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
                fullNameField,
                Container(
                  height: _height * 0.02,
                ),
                phoneField,
                Container(
                  height: _height * 0.02,
                ),
                genderField,
                Container(
                  height: _height * 0.02,
                ),
                collegeField,
                Container(
                  height: _height * 0.02,
                ),
                cityField,
                Container(
                  height: _height * 0.02,
                ),
                stateField,
                Container(
                  height: _height * 0.02,
                ),
                refferalField,
                Container(
                  height: _height * 0.06,
                ),
                continueButton,
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _details(
    TextEditingController fullNameController,
    TextEditingController phoneController,
    TextEditingController collegeController,
    TextEditingController cityController,
    TextEditingController refferalController,
  ) async {
    if (_formKey.currentState!.validate()) {
      String _uid = await AuthenticationService().fetchUid();
      String _email = await AuthenticationService().fetchEmail();
      UserDetails _userDetails = UserDetails(
        uid: _uid,
        email: _email,
        fullName: fullNameController.text,
        phone: phoneController.text,
        gender: gender!,
        college: collegeController.text,
        city: cityController.text,
        state: state!,
        refferalCode: refferalController.text,
        evgId: getId(),
        photoUrl: null,
      );

      String? status =
          await AuthenticationService().addDetailsSignUp(_userDetails);

      if (status == "success") {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => style()));

      } else {
        Fluttertoast.showToast(msg: status!);
      }
    }
  }
}
