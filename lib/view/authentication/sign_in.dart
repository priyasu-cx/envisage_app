import 'package:envisage_app/utils/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  // form key
  final _formKey = GlobalKey<FormState>();

  // editing controller
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Firebase Auth
  // final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    bool _isObscure = true;

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
      obscureText: _isObscure,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ("Password is required for login");
        }
        if (!regex.hasMatch(value)) {
          return ("Please enter valid password (Min. 6 character)");
        }
      },
      onSaved: (value) {
        passwordController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon: Icon(
          IconlyLight.lock,
          color: Colors.white30,
        ),
        // suffixIcon: IconButton(
        //   icon: Icon(
        //     _isObscure ? IconlyLight.hide : IconlyLight.show,
        //     // _isObscure ? Icons.visibility : Icons.visibility_off,
        //     color: Colors.white30,
        //   ),
        //   onPressed: () {
        //     setState(() {
        //       _isObscure = !_isObscure;
        //     });
        //   },
        // ),
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

    // Login Button
    final SignInButton = Material(
      color: primaryHighlightColor,
      borderRadius: BorderRadius.circular(8),
      child: MaterialButton(
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: _width * 0.168),
              child: Text(
                " SIGN IN ",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
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
        // padding: EdgeInsets.symmetric(),
        minWidth: _width * 0.72,
      ),
    );

    // Google Login button
    final GoogleSignInButton = Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      child: MaterialButton(
        onPressed: () {},
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
    // Google Login button
    final FacebookSignInButton = Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      child: MaterialButton(
        onPressed: () {},
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
        // color: primaryBackgroundColor,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(
                  _width * 0.27,
                  _height * 0.075,
                  _width * 0.27,
                  _height * 0.025,
                ),
                child: Image.asset("assets/envisage_logo.png"),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: _width * 0.077,
                  ),
                  child: const Text(
                    "Sign In",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: _height * 0.0251,
                        horizontal: _width * 0.074,
                      ),
                      child: emailField,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: _width * 0.074,
                      ),
                      child: passwordField,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: _width * 0.074,
                        vertical: _height * 0.02,
                      ),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          child: Text(
                            "Forgot Password?",
                            // textAlign: TextAlign.right,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                          onTap: () {
                            print("tapped");
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: _width * 0.138,
                        vertical: _height * 0.04,
                      ),
                      child: SignInButton,
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Text(
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
                        horizontal: _width * 0.138,
                      ),
                      child: GoogleSignInButton,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: _height * 0.0114,
                        horizontal: _width * 0.138,
                      ),
                      child: FacebookSignInButton,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: _height * 0.0217,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      " Don't have an account? ",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        print("sign up");
                      },
                      child: const Text(
                        "Sign Up",
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
    );
  }
}