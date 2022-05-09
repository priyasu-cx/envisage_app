import 'package:envisage_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class Gallery extends StatelessWidget {
  final List<String> images = [
    "https://envisage21.netlify.app/images/gallery/img7.jpg",
    "https://envisage21.netlify.app/images/gallery/img11.jpg",
    "https://envisage21.netlify.app/images/gallery/img8.jpg",
    "https://envisage21.netlify.app/images/gallery/img15.jpg",
    "https://envisage21.netlify.app/images/gallery/img20.jpg",
    "https://envisage21.netlify.app/images/gallery/img23.jpeg",
    "https://envisage21.netlify.app/images/gallery/img3.jpg",

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBackgroundColor,
      body: Column(
        children: [
          Column(
              children: [
                Container(
                  padding: EdgeInsets.only(
                      bottom: 10,top: Get.height*0.12 // Space between underline and text
                  ),
                  decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(
                        color: primaryHighlightColor,
                        width: 3.0, // Underline thickness
                      ))
                  ),
                  child: Text(
                    "Gallery",
                    style: TextStyle(
                      color: primaryHighlightColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ),
              ]
          ),
          Expanded(
            child: StaggeredGridView.countBuilder(
              padding: EdgeInsets.only(top: Get.height*0.02),
              crossAxisCount: 2,
              itemCount: images.length,
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
              itemBuilder: (context, index) {
                return Container(
                  child: Card(
                    child: Column(
                      children: [
                        Image.network(images[index]),
                        //Text("Some Text"),
                      ],
                    ),
                  ),
                );
              },
              staggeredTileBuilder: (index) => StaggeredTile.fit(1),
            ),
          ),
        ],
      ),
    );
  }
}
