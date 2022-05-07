import 'package:envisage_app/view/footer.dart';
import 'package:envisage_app/view/menuscreen.dart';
import 'package:flutter/material.dart';

class style extends StatelessWidget {
  const style({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        DrawerScreen(),
        footer(),
        //DrawerScreen(),
      ],
    ));
  }
}
