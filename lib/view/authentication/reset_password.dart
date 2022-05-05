import 'package:envisage_app/controller/authentication/authentication_service.dart';
import 'package:envisage_app/utils/colors.dart';
import 'package:envisage_app/view/authentication/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:iconly/iconly.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  // form key
  final _formKey = GlobalKey<FormState>();

  // editing controller
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    // email field
    final emailField = TextFormField(
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please enter your Email");
        }
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return ("Please enter a valid Email");
        }
        return null;
      },
      onSaved: (value) {
        emailController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon: Icon(
          IconlyLight.message,
          color: Colors.white30,
        ),
        contentPadding: EdgeInsets.fromLTRB(20, 20, 20, 20),
        hintText: "abc@gmail.com",
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

    // Send Button
    final SendButton = Material(
      color: primaryHighlightColor,
      borderRadius: BorderRadius.circular(8),
      child: MaterialButton(
        onPressed: () {
          _resetPassword(emailController);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              " SEND ",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            Container(
              // Creates the gap between text and icon
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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(IconlyLight.arrow_left),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: _width * 0.077),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: _height * 0.025),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      " Reset Password ",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    " Please enter your email address to\n request a password reset ",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: _height * 0.032),
                  child: emailField,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: _width * 0.061,
                    vertical: _height * 0.0172,
                  ),
                  child: SendButton,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _resetPassword(
    TextEditingController emailController,
  ) async {
    if (_formKey.currentState!.validate()) {
      AuthenticationService _authController = AuthenticationService();
      String status = await _authController.resetPassword(emailController);

      if (status == "success") {
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (context) => SignIn()));
      } else {
        Fluttertoast.showToast(msg: status);
      }
    }
  }
}
