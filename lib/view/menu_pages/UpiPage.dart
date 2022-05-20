
// import 'dart:io';

// import 'package:envisage_app/view/notification.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:envisage_app/utils/colors.dart';
// import 'package:iconly/iconly.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:permission_handler/permission_handler.dart';

// class UpiPay extends StatefulWidget {

//   const UpiPay({Key? key, required this.amount, required this.ID} ) : super(key: key);
//   final double amount;
//   final List ID;
//   //const UpiPay(this.total,this.eventid);


//   @override
//   State<UpiPay> createState() => _UpiPayState();
// }

// class _UpiPayState extends State<UpiPay> {
//   var imageUrl;
//   uploadImage() async {
//     final _firebaseStorage = FirebaseStorage.instance;
//     final _imagePicker = ImagePicker();
//     XFile? image;
//     //Check Permissions
//     await Permission.photos.request();

//     var permissionStatus = await Permission.photos.status;

//     if (permissionStatus.isGranted){
//       //Select Image
//       image = await _imagePicker.pickImage(source: ImageSource.gallery);
//       var file = File(image!.path);

//       if (image != null){
//         //Upload to Firebase
//         var snapshot = await _firebaseStorage.ref()
//             .child('images/imageName')
//             .putFile(file);
//         var downloadUrl = await snapshot.ref.getDownloadURL();
//         setState(() {
//           print(downloadUrl);
//           imageUrl = Uri.parse(downloadUrl);
//         });
//       } else {
//         print('No Image Path Received');
//       }
//     } else {
//       print('Permission not granted. Try Again with permission access');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     print(widget.amount);
//     return Scaffold(
//       backgroundColor: primaryBackgroundColor,
//       appBar: PreferredSize(
//         child: SafeArea(
//             child: Container(
//                 child: Padding(
//                     padding: EdgeInsets.symmetric(
//                       horizontal: Get.width * 0.03,
//                       vertical: Get.height * 0.01,
//                     ),
//                     child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: <Widget>[
//                           IconButton(
//                             icon: Icon(IconlyLight.arrow_left,
//                                 color: Colors.white),
//                             onPressed: () {
//                               setState(() {
//                                 //print("Hello World");
//                                 Get.back();
//                               });
//                             },
//                           ),
//                           Text(
//                             "Payment Details",
//                             style: TextStyle(
//                               color: Colors.white,
//                               letterSpacing: 3,
//                               fontSize: 20,
//                               fontWeight: FontWeight.w400,
//                             ),
//                           ),

//                           IconButton(
//                             onPressed: () {
//                               Get.to(() => NotificationPage());
//                             },
//                             icon: Icon(
//                               IconlyLight.notification,
//                               color: Colors.white,
//                             ),
//                           ),
//                           //IconButton(onPressed: (){},icon: Icon(IconlyBold.arrow_down_square,color: Colors.white,),),
//                         ])))),
//         preferredSize: Size.fromHeight(Get.height * 0.1),
//       ),
//       body: Container(
//           padding: EdgeInsets.all(10),
//           width: Get.width * 1,
//           child: SingleChildScrollView(child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 "Total : ₹ " + widget.amount.round().toString(),
//                 style: TextStyle(
//                   color: Colors.white,
//                   letterSpacing: 2,
//                   fontSize: 22,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//               SizedBox(
//                 height: Get.height * 0.05,
//               ),
//               Text(
//                 "UPI QR Code",
//                 style: TextStyle(
//                   color: Colors.white,
//                   letterSpacing: 3,
//                   fontSize: 15,
//                   fontWeight: FontWeight.w400,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//               Padding(
//                   padding: EdgeInsets.all(20),
//                   child: Image.asset(
//                     "assets/PaymentQR.png",
//                     width: Get.width * 0.6,
//                   )),
//               Text(
//                 "UPI ID - abc@oksbi",
//                 style: TextStyle(
//                   color: primaryHighlightColor,
//                   letterSpacing: 3,
//                   fontSize: 15,
//                   fontWeight: FontWeight.w400,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//               SizedBox(
//                 height: Get.height * 0.05,
//               ),
//               Container(
//                 child: Column(
//                   children: <Widget>[
//                     GestureDetector(onTap: (){uploadImage();},
//                       child: Container(
//                       margin: EdgeInsets.symmetric(horizontal: Get.height*0.1),
//                       padding: EdgeInsets.symmetric(horizontal: 20),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.all(
//                           Radius.circular(15),
//                         ),
//                         border: Border.all(color: Colors.white),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.black12,
//                             offset: Offset(2, 2),
//                             spreadRadius: 2,
//                             blurRadius: 1,
//                           ),
//                         ],
//                       ),
//                       //child: Image.network('https://getstamped.co.uk/wp-content/uploads/WebsiteAssets/Placeholder.jpg',),
//                       child: (imageUrl.toString() != null)
//                           ? Image.network(imageUrl.toString())
//                           : Image.network('https://getstamped.co.uk/wp-content/uploads/WebsiteAssets/Placeholder.jpg')
//                     ),),
//                     SizedBox(
//                       height: 20.0,
//                     ),
//                     MaterialButton(
//                       child: Text("Confirm Registration",
//                           style: TextStyle(
//                               color: Colors.white,
//                               fontWeight: FontWeight.w500,
//                               fontSize: 20)),
//                       onPressed: () {},
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(18.0),
//                           side: BorderSide(color: primaryHighlightColor)),
//                       elevation: 5.0,
//                       color: primaryHighlightColor,
//                       textColor: Colors.white,
//                       padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
//                       splashColor: Colors.grey,
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ))),
//     );
//   }
// }
