import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:sahyog/commons/global_controller.dart';
import 'package:sahyog/features/civil_home/models/register_problem_model.dart';
import 'package:sahyog/features/civil_home/widgets/text_label.dart';

class RegisterProblemController extends GetxController {
  var textMessageController = TextEditingController();
  var numOfPersonController = TextEditingController();
  GlobalController globalController = Get.find();

  late RegisterProblem problemData;
  late bool serviceEnabled;
  late LocationPermission permission;
  late Position position;
  bool isGotLocation = false;

  //Obeservable
  RxString name = 'person name'.obs;
  RxDouble longitude = 0.0.obs;
  RxDouble latitude = 0.0.obs;
  RxString address = 'loading'.obs;

  // @override
  // onInit() {
  //   super.onInit();

  // }

  getUpdatePositionDetail() {
    name.value = globalController.name.value;
    print(
        "checking ${globalController.name.value} ${globalController.phoneNumber.value} ${globalController.password.value}");
    update();
    print("updating again again ");
    registerProblem();
  }

  registerProblem() async {
    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      Future.error('Location services are disabled.');
    } else {
      print("permisison enabled");
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          Future.error('Location permissions are denied');
        } else {
          if (permission == LocationPermission.deniedForever) {
            // Permissions are denied forever, handle appropriately.
            showNoLocationPermission();
          } else {}
        }
      }
    }
    Position position = await Geolocator.getCurrentPosition();
    print("position is :: $position");
    longitude.value = position.longitude;
    latitude.value = position.latitude;
    update();
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude.value, longitude.value);
      Placemark place = placemarks[0];
      print(place);
      address.value =
          "${place.locality}, ${place.thoroughfare}, ${place.subAdministrativeArea}, ${place.administrativeArea}, ${place.postalCode}";
    } on Exception catch (e) {
      // TODO
    }
    isGotLocation = true;
    update();
  }

  showNoLocationPermission() {
    Get.showSnackbar(GetSnackBar(
      duration: Duration(seconds: 2),
      messageText: TextLabel(text: "Please allow location permission"),
      backgroundColor: Colors.redAccent,
    ));
    Get.back();
  }

  registerProblemFinal() async {
    if (textMessageController.text.trim().isNotEmpty &&
        numOfPersonController.text.trim().isNotEmpty &&
        isGotLocation) {
      problemData = RegisterProblem(
          by: name.value,
          textMessage: textMessageController.text.trim(),
          latitude: latitude.value,
          longitude: longitude.value,
          numOfPerson: int.tryParse(numOfPersonController.text.trim())!,
          address: address.value);

      DatabaseReference dbref;
      dbref = FirebaseDatabase.instance.ref("problemsData");
      var problemIdRef = dbref.push();
      problemIdRef.set({
        "by": problemData.by,
        "textMessage": problemData.textMessage,
        "longitude": problemData.longitude,
        "latitude": problemData.latitude,
        "address": problemData.address,
        "numOfPerson": problemData.numOfPerson
      }).then((value) {
        var problemId = problemIdRef.key;
        dbref = FirebaseDatabase.instance.ref("civilCred");

        dbref
            .child(globalController.phoneNumber.value)
            .child("problems")
            .child(problemId!)
            .set({"status": "open"});
      }).then((value) {
        Get.back();
        Get.showSnackbar(GetSnackBar(
          duration: Duration(seconds: 2),
          messageText: TextLabel(
            text: "Problem Registered Successully",
            textColor: Colors.white,
          ),
          backgroundColor: Colors.green,
        ));
      });
    } else {
      Get.showSnackbar(GetSnackBar(
        duration: Duration(seconds: 2),
        messageText: TextLabel(
          text: "Num of person or problem, location cannot be empty",
          textColor: Colors.white,
        ),
        backgroundColor: Colors.redAccent,
      ));
    }
  }
}
