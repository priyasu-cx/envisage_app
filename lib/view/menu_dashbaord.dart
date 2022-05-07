import 'package:flutter/material.dart';

class MenuDashboardPage extends StatelessWidget {
  const MenuDashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2C2C49).withAlpha(206),
      body: Stack(
        children: <Widget>[
          menu(context),
          // dashboard(context),
        ],
      ),
    );
  }

  Widget menu(context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              " Dashboard ",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Colors.white),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              " Cart ",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Colors.white),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              " Registered Events ",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Colors.white),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              " Sponsors ",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Colors.white),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              " Contact Us ",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Colors.white),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              " Help & FAQ ",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
