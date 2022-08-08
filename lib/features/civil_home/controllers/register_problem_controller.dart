import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:sahyog/features/civil_home/models/register_problem_model.dart';

class RegisterProblemController extends GetxController {
  late RegisterProblem problemData;
  late bool serviceEnabled;
  late LocationPermission permission;
  late Position position;

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
    position;

    problemData = RegisterProblem(
        textMessage: "Stuck in orest",
        latitude: position.latitude,
        longitude: position.longitude,
        numOfPerson: 1);

    print(problemData.textMessage);
  }
}
