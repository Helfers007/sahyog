import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahyog/features/civil_home/screens/civil_homepage.dart';

enum CivilAuth { login, signup }

class CivilAuthController extends GetxController {
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  CivilAuth civilAuth = CivilAuth.login;

  late DatabaseReference civilCredRef;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    civilCredRef = FirebaseDatabase.instance.ref("civilCred");
  }

  @override
  void dispose() {
    passwordController.dispose();
    nameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  signUp() {
    print(nameController.text);
    print(passwordController.text);
    print(phoneController.text);
    civilCredRef = FirebaseDatabase.instance.ref("civilCred");
    civilCredRef.child(phoneController.text).set({
      "name": nameController.text,
      "phoneNum": phoneController.text,
      "password": passwordController.text
    }).whenComplete(() => Get.off(CivilHomePage(
          phoneNum: phoneController.text,
        )));
  }

  loginCheckCred() async {
    print(nameController.text);
    print(passwordController.text);
    print(phoneController.text);

    DataSnapshot data =
        await civilCredRef.child(phoneController.text).child("password").get();

    bool isUserExist = data.exists;

    if (isUserExist) {
      if (data.value == passwordController.text) {
        Get.off(CivilHomePage(
          phoneNum: phoneController.text,
        ));
      }
    }
  }
  //  checkNames() {
  //   print("CHECK NAMES");
  //   var isValid = nameFormKey.currentState!.validate();
  //   if (!isValid) {
  //     return;
  //   }
  //   nameFormKey.currentState!.save();
  //   Get.back();
  //   Get.to(GamePage());
  // }

}
