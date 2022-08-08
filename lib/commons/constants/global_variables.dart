import 'package:flutter/material.dart';

String uri = 'http://<yourip>:3000';

class GlobalVariables {
  // COLORS
  // static const appBarGradient = LinearGradient(
  //   colors: [
  //     Color.fromARGB(255, 29, 201, 192),
  //     Color.fromARGB(255, 125, 221, 216),
  //   ],
  //   stops: [0.5, 1.0],
  // );
  static const backGroundGradient = LinearGradient(
    colors: [Color.fromARGB(255, 13, 41, 54), Color.fromARGB(255, 25, 78, 102)],
    stops: [0.1, 0.6],
  );

  static const secondaryColor = Color.fromARGB(255, 248, 152, 7);
  // static const backgroundColor = Color.fromARGB(255, 59, 58, 58);
  // static const Color greyBackgroundCOlor = Color(0xffebecee);
  //static var selectedNavBarColor = Colors.cyan[800]!;
  // static const unselectedNavBarColor = Colors.black87;

  /// HIVE BOX DETAILS
  static String userDetailBox = "userDetails";
  static String phoneNumber = "phoneNumber";
  static String name = "name";
  static String password = "password";
}
