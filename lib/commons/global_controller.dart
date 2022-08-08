import 'dart:io';
import 'package:get/get.dart';
import 'package:sahyog/commons/constants/global_variables.dart';
import 'package:hive/hive.dart';
import 'package:sahyog/features/auth/screens/civil_auth_page.dart';
import 'package:sahyog/features/civil_home/screens/civil_homepage.dart';

class GlobalController extends GetxController {
  bool? isAlreadyLoggedIn = false;
  var name = ''.obs;
  var phoneNumber = ''.obs;
  var password = ''.obs;

  @override
  onInit() async {
    super.onInit();
    Future.delayed(Duration(seconds: 2), () => checkAuthState());
  }

  checkAuthState() async {
    if (await Hive.boxExists(
      GlobalVariables.userDetailBox,
    )) {
      var box = await Hive.openBox(GlobalVariables.userDetailBox);
      isAlreadyLoggedIn = true;
      phoneNumber.value = box.get(GlobalVariables.phoneNumber);
      name.value = box.get(GlobalVariables.name);
      password.value = box.get(GlobalVariables.password);
      Get.off(CivilHomePage());
      box.close();
    } else {
      Get.off(AuthPage());
    }
  }

  logOutUser() async {
    isAlreadyLoggedIn = false;
    await Hive.deleteBoxFromDisk("userDetails");
  }
}
