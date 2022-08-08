import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:sahyog/features/civil_home/controllers/register_problem_controller.dart';
import 'package:sahyog/features/civil_home/screens/register_problem_page.dart';

class CivilHomePage extends StatelessWidget {
  final String phoneNum;
  CivilHomePage({Key? key, required this.phoneNum}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Sahyog"),
        ),
        body: ListView(
          children: [
            ElevatedButton(
                onPressed: () {
                  Get.to(RegisterProblemPage());
                },
                child: Text("Register a problem"))
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
