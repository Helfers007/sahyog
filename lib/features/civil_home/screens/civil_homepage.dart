import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:sahyog/commons/global_controller.dart';
import 'package:sahyog/commons/widgets/custom_button.dart';
import 'package:sahyog/features/civil_home/controllers/register_problem_controller.dart';
import 'package:sahyog/features/civil_home/screens/register_problem_page.dart';
import 'package:sahyog/features/civil_home/widgets/text_label.dart';

class CivilHomePage extends StatelessWidget {
  CivilHomePage({Key? key}) : super(key: key);
  GlobalController globalController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Sahyog"),
        ),
        body: ListView(
          children: [
            TextLabel(text: "Currently ,only register problem available"),
            TextLabel(text: "Name : ${globalController.name}"),
            TextLabel(text: "Password : ${globalController.password}"),
            TextLabel(text: "Phone Number : ${globalController.phoneNumber}"),
            SizedBox(
              height: 20,
            ),
            CustomButton(
                text: "Register Problem",
                onTap: () {
                  Get.to(RegisterProblemPage());
                })
          ],
        ));
  }

  // registerProblem() async {
  //   DatabaseReference dbref;
  //   dbref = FirebaseDatabase.instance.ref("civilCred/${phoneNum}/proble");
  //   DataSnapshot data = await dbref.get();
  //   print("DATA ::: ${data.value}");
  // }

}
