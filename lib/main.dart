<<<<<<< HEAD
 //import 'package:envisage_app/view/homepage.dart';
//import 'package:envisage_app/view/onboarding/onboarding_screen1.dart';
=======
import 'package:envisage_app/controller/authentication/authentication_service.dart';
>>>>>>> ea381379d5d3d147586af824eb52b7c8da5c3a22
import 'package:envisage_app/view/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Envisage 2022',
      theme: ThemeData(
        textTheme: GoogleFonts.montserratTextTheme(
          Theme.of(context)
              .textTheme, // If this is not set, then ThemeData.light().textTheme is used.
        ),
      ),
      home: SplashScreen(),

    );
  }
}
