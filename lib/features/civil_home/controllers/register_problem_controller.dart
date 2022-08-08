import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:sahyog/features/civil_home/models/register_problem_model.dart';

class RegisterProblemController extends GetxController {
  var textMessageController = TextEditingController();

  late RegisterProblem problemData;
  late bool serviceEnabled;
  late LocationPermission permission;
  late Position position;

  //Obeservable
  RxDouble longitude = 0.0.obs;
  RxDouble latitude = 0.0.obs;
  RxString address = 'loading'.obs;

  // @override
  // void onInit() {
  //   super.onInit();
  //   getUpdatePositionDetail();
  // }

  getUpdatePositionDetail() {
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
            Future.error(
                'Location permissions are permanently denied, we cannot request permissions.');
          } else {}
        }
      }
    }
    Position position = await Geolocator.getCurrentPosition();
    print("position is :: $position");
    longitude.value = position.longitude;
    longitude.value = position.latitude;
    address.value = DateTime.now().toString();
    List<Placemark> placemarks =
        await placemarkFromCoordinates(longitude.value, longitude.value);
    print("PLACEMARKS : $placemarks");

    update();

    problemData = RegisterProblem(
        textMessage: "Stuck in orest",
        latitude: position.latitude,
        longitude: position.longitude,
        numOfPerson: 1);

    print(problemData.textMessage);
  }
}
