import 'package:envisage_app/utils/etalk_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:envisage_app/utils/colors.dart';
import 'package:iconly/iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

List<String> imageList = [
  'https://envisage21.netlify.app/images/gallery/img7.jpg',
  'https://envisage21.netlify.app/images/gallery/img3.jpg',
  'https://envisage21.netlify.app/images/gallery/img15.jpg',
  'https://envisage21.netlify.app/images/gallery/img5.jpg',
  'https://envisage21.netlify.app/images/gallery/img23.jpeg',
];


class Gallery extends StatelessWidget {
  const Gallery({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBackgroundColor,
      body: SingleChildScrollView(
        child: Container(

          )
        )
      );
  }
}
