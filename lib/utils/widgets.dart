// import 'package:envisage_app/utils/colors.dart';
// import 'package:flutter/material.dart';

// class ActionButton extends StatelessWidget {
//   final String text;
//   final Color textColor;
//   final String image;

//   const ActionButton({
//     Key? key,
//     required this.text,
//     required this.textColor,
//     required this.image,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       color: primaryHighlightColor,
//       borderRadius: BorderRadius.circular(8),
//       child: TextButton.icon(
//         icon: const Text(
//           " SIGN IN ",
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 16,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//         label: Image.asset(
//           "assets/icons/forward_arrow_circle.png",
//           height: 30,
//           width: 30,
//           alignment: Alignment.centerRight,
//         ),
//         // onPressed: () {
//         //   _signIn(emailController, passwordController);
//         // },
//         style: TextButton.styleFrom(
//           fixedSize: Size.fromWidth(
//             _width * 0.72,
//           ),
//         ),
//       ),
//     );
//   }
// }
