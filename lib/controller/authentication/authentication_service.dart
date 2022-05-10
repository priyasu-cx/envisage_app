import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:envisage_app/model/events_details.dart';
import 'package:envisage_app/model/team_details.dart';
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

  Future<List<EventDetails>> fetchEventDetails(bool isUpcoming) async {
    var readEvents = isUpcoming
        ? await _firestore.collection("events").get()
        : await _firestore.collection("pastEvents").get();

    List<EventDetails> eventsData =
        List.from(readEvents.docs.map((doc) => EventDetails.fromJson(doc)));

    return eventsData;
  }

  //
  // -------------------- All User Functions ---------------------
  //

  Future<bool> isAnyMemberRegistered(
      EventDetails _event, TeamDetails teamData) async {
    bool check1 = await isRegistered(_event, teamData.teamLead);
    if (teamData.teamMember1 != null && teamData.teamMember1 != "") {
      bool check2 = await isRegistered(_event, teamData.teamMember1!);
      if (check2) {
        return true;
      }
    }
    if (teamData.teamMember2 != null && teamData.teamMember2 != "") {
      bool check3 = await isRegistered(_event, teamData.teamMember2!);
      if (check3) {
        return true;
      }
    }
    if (teamData.teamMember3 != null && teamData.teamMember3 != "") {
      bool check4 = await isRegistered(_event, teamData.teamMember3!);
      if (check4) {
        return true;
      }
    }

    if (check1 == true) {
      return true;
    }
    return false;
  }

  Future<bool> isRegistered(EventDetails _event, String? userId) async {
    if (userId == null) {
      User currentUser = _firebaseAuth.currentUser!;
      userId = currentUser.uid;
    } else {
      QuerySnapshot<Map<String, dynamic>> object = await _firestore
          .collection("users")
          .where("evgId", isEqualTo: userId)
          .get();
      Map<String, dynamic> data;
      object.docs.forEach((element) {
        Map<String, dynamic> data = element.data();
        userId = data["uid"];
      });
      // Map<String, dynamic> data = object.docs[0].data();
    }

    DocumentSnapshot<Map<String, dynamic>> snap = await _firestore
        .collection("users")
        .doc(userId)
        .collection("registered")
        .doc(_event.id!)
        .get();

    var snapshot = snap.data() as Map<String, dynamic>;

    // return snapshot["isRegistered"];
    return false;
  }

  Future<String> registerSoloEvent(EventDetails _event) async {
    User currentUser = _firebaseAuth.currentUser!;

    try {
      Map<String, dynamic> data = {"isRegistered": true};
      await _firestore
          .collection("users")
          .doc(currentUser.uid)
          .collection("registered")
          .doc(_event.id!)
          .set(data);
    } catch (error) {
      return error.toString();
    }
    try {
      await _firestore
          .collection("events")
          .doc(_event.id)
          .collection("registered")
          .doc(currentUser.uid)
          .set({});
    } catch (error) {
      return error.toString();
    }
    return "success";
  }

  Future<String> registerTeamEvent(
      EventDetails _event, TeamDetails _teamDetails) async {
    User currentUser = _firebaseAuth.currentUser!;

    try {
      Map<String, dynamic> data = {
        "isRegistered": true,
        "teamId": _teamDetails.teamId.toString(),
      };

      print(_event.id);
      print(_teamDetails.teamId);

      await _firestore
          .collection("events")
          .doc(_event.id.toString())
          .collection("teams")
          .doc(_teamDetails.teamId.toString())
          .set({});
      print("check");

      await _firestore
          .collection("users")
          .doc(currentUser.uid)
          .collection("registered")
          .doc(_event.id!)
          .set(data);

      if (_teamDetails.teamMember1 != null) {
        await _firestore
            .collection("events")
            .doc(_event.id)
            .collection("registered")
            .doc(_teamDetails.teamMember1)
            .set({});

        await _firestore
            .collection("users")
            .doc(_teamDetails.teamMember1)
            .collection("registered")
            .doc(_event.id!)
            .set(data);
      }
      if (_teamDetails.teamMember2 != null) {
        await _firestore
            .collection("events")
            .doc(_event.id)
            .collection("registered")
            .doc(_teamDetails.teamMember2)
            .set({});

        await _firestore
            .collection("users")
            .doc(_teamDetails.teamMember2)
            .collection("registered")
            .doc(_event.id!)
            .set(data);
      }
      if (_teamDetails.teamMember3 != null) {
        await _firestore
            .collection("events")
            .doc(_event.id)
            .collection("registered")
            .doc(_teamDetails.teamMember3)
            .set({});

        await _firestore
            .collection("users")
            .doc(_teamDetails.teamMember3)
            .collection("registered")
            .doc(_event.id!)
            .set(data);
      }

      await _firestore
          .collection("teams")
          .doc(_teamDetails.teamId)
          .set(_teamDetails.toJson());
    } catch (error) {
      print(error.toString());
      return error.toString();
    }
    return "success";
  }

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

      // Build collections to store registered data
      List<EventDetails> events = await fetchEventDetails(true);
      events.forEach((element) async {
        if (element.isTeamEvent) {
          Map<String, dynamic> data = {"isRegistered": false, "teamId": null};
          await _firestore
              .collection("users")
              .doc(currentUser.uid)
              .collection("registered")
              .doc(element.id!)
              .set(data);
        } else {
          Map<String, dynamic> data = {"isRegistered": false};
          await _firestore
              .collection("users")
              .doc(currentUser.uid)
              .collection("registered")
              .doc(element.id!)
              .set(data);
        }
      });
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
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email.text, password: password.text);
    } on FirebaseAuthException catch (error) {
      return (error.message.toString());
    }

    Fluttertoast.showToast(msg: " Login Successful ");
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
