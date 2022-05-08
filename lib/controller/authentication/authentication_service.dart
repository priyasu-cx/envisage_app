import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:envisage_app/model/events_details.dart';
import 'package:envisage_app/model/user_details.dart';
import 'package:envisage_app/utils/colors.dart';
import 'package:envisage_app/view/onboarding/onboarding_screen1.dart';
import 'package:envisage_app/view/screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ScreenLoader extends StatelessWidget {
  const ScreenLoader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.userChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          if (snapshot.hasData) {
            //
            // Change with HomePage

            return style();
          } else if (snapshot.hasError) {
            Fluttertoast.showToast(msg: " Some Internal Error Occured :( ");
          }
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              color: primaryHighlightColor,
            ),
          );
        }
        return OnboardingScreen1();
      },
    );
  }
}

class AuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FacebookAuth _facebookAuth = FacebookAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<EventDetails>> fetchEventDetails(bool upcoming) async {
    var readEvents = upcoming
        ? await _firestore.collection("events").get()
        : await _firestore.collection("pastEvents").get();

    List<EventDetails> eventsData =
        List.from(readEvents.docs.map((doc) => EventDetails.fromJson(doc)));

    return eventsData;
  }

  //
  // -------------------- All User Functions ---------------------
  //

  Future<String> fetchUid() async {
    return _firebaseAuth.currentUser!.uid.toString();
  }

  Future<String> fetchEmail() async {
    return _firebaseAuth.currentUser!.email.toString();
  }

  Future<UserDetails> fetchUserDetails() async {
    User currentUser = _firebaseAuth.currentUser!;

    DocumentSnapshot snap =
        await _firestore.collection("users").doc(currentUser.uid).get();

    return UserDetails.fromSnap(snap);
  }

  Future<String?> addDetailsSignUp(UserDetails userDetails) async {
    try {
      User currentUser = _firebaseAuth.currentUser!;

      await _firestore
          .collection("users")
          .doc(currentUser.uid)
          .set(userDetails.toJson());
    } catch (error) {
      return error.toString();
    }
    return "success";
  }

  Future<String> signOut() async {
    try {
      _firebaseAuth.signOut();
    } on FirebaseAuthException catch (error) {
      return (error.message.toString());
    }
    return "success";
  }

  Future<String?> signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      if (googleAuth?.accessToken != null && googleAuth?.idToken != null) {
        // create a new credential
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken,
        );

        UserCredential userCreds =
            await _firebaseAuth.signInWithCredential(credential);

        if (userCreds.user != null) {
          if (userCreds.additionalUserInfo!.isNewUser) {
            Fluttertoast.showToast(msg: " Sign Up Successful ");
            return ("signup");
          } else {
            Fluttertoast.showToast(msg: " Login Successful ");
            return ("login");
          }
        }
      }
    } on FirebaseAuthException catch (error) {
      return (error.message.toString());
    }
  }

  // Facebook login
  Future<String?> signInWithFacebook(BuildContext context) async {
    try {
      final LoginResult loginResult = await _facebookAuth.login();

      if (loginResult.status == LoginStatus.success) {
        final AccessToken? _accessToken = loginResult.accessToken;
        final OAuthCredential facebookAuthCredential =
            FacebookAuthProvider.credential(_accessToken!.token);

        UserCredential userCreds =
            await _firebaseAuth.signInWithCredential(facebookAuthCredential);

        if (userCreds.user != null) {
          if (userCreds.additionalUserInfo!.isNewUser) {
            Fluttertoast.showToast(msg: " Sign Up Successful ");
            return ("signup");
          } else {
            Fluttertoast.showToast(msg: " Login Successful ");
            return ("login");
          }
        }
      }
    } on FirebaseAuthException catch (error) {
      return (error.message.toString());
    }
  }

  Future<String> signInFirebase({
    required TextEditingController email,
    required TextEditingController password,
  }) async {
    await _firebaseAuth
        .signInWithEmailAndPassword(email: email.text, password: password.text)
        .then((_) {
      Fluttertoast.showToast(msg: " Login Successful ");
    }).catchError((error) {
      return (error.message);
    });
    return ("success");
  }

  Future<String> signUpFirebase({
    required TextEditingController emailController,
    required TextEditingController passwordController,
  }) async {
    await _firebaseAuth
        .createUserWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.trim())
        .then((_) {
      _firebaseAuth.currentUser!.sendEmailVerification().then((_) {
        Fluttertoast.showToast(msg: " Email Verification sent! ");
      }).catchError((error) {
        return (error.message);
      });
      Fluttertoast.showToast(msg: " Sign Up Successful ");
    }).catchError((error) {
      return (error.message);
    });
    return ("success");
  }

  Future<String> resetPassword(TextEditingController emailController) async {
    await _firebaseAuth
        .sendPasswordResetEmail(email: emailController.text)
        .then((_) {
      Fluttertoast.showToast(msg: " Reset Password link sent! ");
    }).catchError((error) {
      return (error.message);
    });
    return ("success");
  }
}
