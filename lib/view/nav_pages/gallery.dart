import 'package:envisage_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class Gallery extends StatelessWidget {
  final List<String> images = [
    "https://firebasestorage.googleapis.com/v0/b/envisage-22.appspot.com/o/Gallery%2Fpic5.jpg?alt=media&token=55837038-94d0-4761-8c5c-f345e11cee01",
    "https://firebasestorage.googleapis.com/v0/b/envisage-22.appspot.com/o/Gallery%2Fpic4.jpg?alt=media&token=f7f87aa5-5279-45f1-bab9-f2f40de318f1",
    "https://envisage21.netlify.app/images/gallery/img7.jpg",
    "https://envisage21.netlify.app/images/gallery/img11.jpg",
    "https://envisage21.netlify.app/images/gallery/img8.jpg",
    "https://envisage21.netlify.app/images/gallery/img15.jpg",
    "https://envisage21.netlify.app/images/gallery/img20.jpg",
    "https://envisage21.netlify.app/images/gallery/img23.jpeg",
    "https://envisage21.netlify.app/images/gallery/img3.jpg",
    "https://envisage21.netlify.app/images/gallery/img5.jpg",
    "https://envisage21.netlify.app/images/gallery/img25.jpeg",
    "https://firebasestorage.googleapis.com/v0/b/envisage-22.appspot.com/o/Gallery%2Fpic2.jpg?alt=media&token=d34b71de-64e6-4240-ba71-96ed416c479e",
    "https://firebasestorage.googleapis.com/v0/b/envisage-22.appspot.com/o/Gallery%2Fpic1.jpg?alt=media&token=9d27d243-1530-4291-853b-cc4ae8ea9eb0",
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
            // constraints: BoxConstraints(
            //   maxHeight: Get.height*0.62,
            // ),

            child:
            StaggeredGridView.countBuilder(
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
      // bottomNavigationBar: BottomNavigationBar(
      //   child:SizedBox(height: 0.01,),
      // ),
    );
  }
}
