import 'package:envisage_app/controller/authentication/authentication_service.dart';
import 'package:envisage_app/utils/colors.dart';
import 'package:envisage_app/view/authentication/details_page.dart';
import 'package:envisage_app/view/authentication/sign_in.dart';
import 'package:envisage_app/view/screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:iconly/iconly.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  // form key
  final _formKey = GlobalKey<FormState>();

  // editing controller
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  // Firebase Auth
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    // Email Field
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
      textInputAction: TextInputAction.next,
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

    // password field
    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordController,
      obscureText: true,
      validator: (passwdvalue) {
        RegExp regex = new RegExp(r'^.{6,}$');
        if (passwdvalue!.isEmpty) {
          return ("Password is required for login");
        }
        if (!regex.hasMatch(passwdvalue)) {
          return ("Please enter valid password (Min. 6 character)");
        }
      },
      onSaved: (value) {
        passwordController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(
          IconlyLight.lock,
          color: Colors.white30,
        ),
        contentPadding: EdgeInsets.fromLTRB(20, 20, 20, 20),
        hintText: "Your Password",
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

    // confirm password field
    final confirmPasswordField = TextFormField(
      autofocus: false,
      controller: confirmPasswordController,
      obscureText: true,
      validator: (confirmValue) {
        if (confirmValue == "") {
          return ("Password is required to confirm");
        }
        if (confirmPasswordController.text != passwordController.text) {
          return ("Passwords don't match");
        }
        return null;
      },
      onSaved: (value) {
        confirmPasswordController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(
          IconlyLight.lock,
          color: Colors.white30,
        ),
        contentPadding: EdgeInsets.fromLTRB(20, 20, 20, 20),
        hintText: "Confirm Password",
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

    // Sign Up button
    final SignUpButton = Material(
      color: primaryHighlightColor,
      borderRadius: BorderRadius.circular(8),
      child: MaterialButton(
        onPressed: () {
          _signUp(
              emailController, passwordController, confirmPasswordController);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              " SIGN UP ",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            Container(
              width: _width * 0.16,
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

    // Google Login button
    final GoogleSignInButton = Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      child: MaterialButton(
        onPressed: () {
          _signUpWithGoogle(context);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              "assets/icons/google_logo.png",
              height: 26,
              width: 26,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: _width * 0.0773),
              child: Text(
                "Login with Google",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );

    // Facebook Login Button
    final FacebookSignInButton = Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      child: MaterialButton(
        onPressed: () {
          _signUpWithFacebook(context);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              "assets/icons/facebook_logo.png",
              height: 26,
              width: 26,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: _width * 0.05),
              child: Text(
                "Login with Facebook",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
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
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(_width * 0.193, _height * 0.09,
                      _width * 0.193, _height * 0.01),
                  child: Image.asset("assets/envisage_logo.png"),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: _height * 0.025),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      " Sign up ",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                emailField,
                Padding(
                  padding: EdgeInsets.symmetric(vertical: _height * 0.025),
                  child: passwordField,
                ),
                confirmPasswordField,
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: _width * 0.061,
                    vertical: _height * 0.0381,
                  ),
                  child: SignUpButton,
                ),
                Column(
                  children: [
                    const Text(
                      " OR ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: _height * 0.0114,
                        // horizontal: _width * 0.138,
                      ),
                      child: GoogleSignInButton,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: _height * 0.0114,
                        // horizontal: _width * 0.138,
                      ),
                      child: FacebookSignInButton,
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: _height * 0.0217,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        " Already have an account? ",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SignIn()));
                        },
                        child: const Text(
                          "Sign In ",
                          style: TextStyle(
                            color: primaryHighlightColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _signUp(
    TextEditingController emailController,
    TextEditingController passwordController,
    TextEditingController confirmPasswordController,
  ) async {
    if (_formKey.currentState!.validate()) {
      AuthenticationService _authController = AuthenticationService();
      String status = await _authController.signUpFirebase(
          emailController: emailController,
          passwordController: passwordController);

      if (status == "success") {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => DetailsPage()));
      } else {
        Fluttertoast.showToast(msg: status);
      }
    }
  }

  void _signUpWithGoogle(BuildContext context) async {
    String? status = await AuthenticationService().signInWithGoogle(context);
    // print(status);
    if (status == null) {
      Fluttertoast.showToast(msg: " Sone Internal Error Occured :( ");
    }
    if (status == "signup") {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => DetailsPage()));
    } else if (status == "login") {
      //
      // Change for Home Page
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => style()));
    }
  }

  void _signUpWithFacebook(BuildContext context) async {
    String? status = await AuthenticationService().signInWithFacebook(context);
    print(status);
    if (status == null) {
      Fluttertoast.showToast(msg: " Sone Internal Error Occured :( ");
    }
    if (status == "signup") {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => DetailsPage()));
    } else if (status == "login") {
      //
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => style()));
    }
  }
}
