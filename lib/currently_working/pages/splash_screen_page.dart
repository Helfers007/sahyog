import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahyog/currently_working/controllers/splash_screen_controller.dart';
import 'package:sahyog/currently_working/global_variables.dart';

class SplashScreenPage extends StatelessWidget {
  var globalController = Get.put(GlobalController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(gradient: GV.backGroundGradient),
        child: Center(
          child: Image.asset(
            "assets/logo.png",
            width: Get.height * 0.2,
          ),
        ),
      ),
    );
  }
}
