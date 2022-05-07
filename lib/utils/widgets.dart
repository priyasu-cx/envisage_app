import 'package:envisage_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Navbar extends StatefulWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBackgroundColor,
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: GNav(
            backgroundColor: Colors.black,
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: primaryHighlightColor,
            padding: EdgeInsets.all(16),
            gap: 8,
            tabs: [
              GButton(
                icon: Icons.home,
                text: "Home",
              ),
              GButton(
                icon: Icons.favorite,
                text: "Likes",
              ),
              GButton(
                icon: Icons.dangerous,
                text: "Events",
              ),
              GButton(
                icon: Icons.search,
                text: "Search",
              ),
              GButton(
                icon: Icons.settings,
                text: "Settings",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
