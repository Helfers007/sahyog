import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sahyog/commons/constants/global_variables.dart';
import 'package:sahyog/commons/global_controller.dart';
import 'package:sahyog/features/civil_home/screens/civil_homepage.dart';

enum CivilAuth { login, signup }

class CivilAuthController extends GetxController {
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  CivilAuth civilAuth = CivilAuth.login;
  GlobalController globalController = Get.find();
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
    }).whenComplete(() {
      globalController.name.value = nameController.text;
      globalController.password.value = passwordController.text;
      globalController.phoneNumber.value = phoneController.text;
      saveDetails();
    });
  }

  loginCheckCred() async {
    print(nameController.text);
    print(passwordController.text);
    print(phoneController.text);

    DataSnapshot data = await civilCredRef.child(phoneController.text).get();

    bool isUserExist = data.exists;

    if (isUserExist) {
      if (data.child("password").value == passwordController.text) {
        globalController.name.value = data.child("name").value.toString();
        globalController.password.value = passwordController.text;
        globalController.phoneNumber.value = phoneController.text;
        saveDetails();
      }
    }
  }

  saveDetails() async {
    var box = await Hive.openBox(GlobalVariables.userDetailBox);
    box.put(GlobalVariables.name, globalController.name.value);
    box.put(GlobalVariables.phoneNumber, globalController.phoneNumber.value);
    box.put(GlobalVariables.password, globalController.password.value);
    Get.off(CivilHomePage());
  }
}
