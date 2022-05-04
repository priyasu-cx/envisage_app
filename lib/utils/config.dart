import 'package:envisage_app/view/Profile/profile.dart';
import 'package:envisage_app/view/authentication/sign_in.dart';
import 'package:envisage_app/view/screen.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:get/get.dart';

List<Map> drawerItems=[
  {
    'icon': IconlyBold.profile,
    'title' : 'Profile',
    'function': profile(),
  },
  {
    'icon': IconlyBold.buy,
    'title' : 'Cart'
  },
  {
    'icon': IconlyBold.calendar,
    'title' : 'Registered Events'
  },
  {
    'icon': IconlyBold.heart,
    'title' : 'Sponsors'
  },
  {
    'icon': IconlyLight.message,
    'title' : 'Contact Us'
  },
  {
    'icon': IconlyBold.info_square,
    'title' : 'Help & FAQ'
  },
  {
    'icon': IconlyBold.login,
    'title' : 'Sign Out'
  },
];