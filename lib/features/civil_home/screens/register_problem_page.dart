import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahyog/commons/global_controller.dart';
import 'package:sahyog/features/civil_home/controllers/register_problem_controller.dart';
import 'package:sahyog/features/civil_home/widgets/register_button.dart';
import 'package:sahyog/features/civil_home/widgets/register_textfield.dart';
import 'package:sahyog/features/civil_home/widgets/text_display.dart';
import 'package:sahyog/features/civil_home/widgets/text_label.dart';
import 'package:sahyog/features/civil_home/widgets/text_subLabel.dart';

class RegisterProblemPage extends StatelessWidget {
  RegisterProblemPage({Key? key}) : super(key: key);

  var registerProblemController = Get.put(RegisterProblemController());

  @override
  Widget build(BuildContext context) {
    registerProblemController.getUpdatePositionDetail();
    return Scaffold(
      appBar: AppBar(
        title: Text("Problem Register"),
      ),
      body: GetBuilder<RegisterProblemController>(builder: (_) {
        return Container(
          child: Form(
              child: ListView(children: [
            TextLabel(text: "Name"),
            TextDisplay(text: registerProblemController.name.value),
            SizedBox(
              height: 10,
            ),
            TextLabel(text: "Your location"),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextSubLabel(text: "Longitude"),
                TextDisplay(
                    text: "${registerProblemController.longitude.value} "),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextSubLabel(text: "Latitude"),
                TextDisplay(
                    text: "${registerProblemController.latitude.value} "),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            TextSubLabel(text: "Address"),
            TextDisplay(text: "${registerProblemController.address.value}"),
            SizedBox(
              height: 10,
            ),
            TextLabel(text: "Number of people affected(Approx)"),
            RegisterTextField(
              controller: registerProblemController.numOfPersonController,
              hintText: 'Enter num of person',
              keyboardType: TextInputType.phone,
            ),
            SizedBox(
              height: 10,
            ),
            TextLabel(text: "Your problem"),
            RegisterTextField(
              controller: registerProblemController.textMessageController,
              hintText: 'Tell your problem',
            ),
            SizedBox(
              height: 20,
            ),
            RegisterProblemButton(
                text: "Register Now",
                onTap: () {
                  registerProblemController.registerProblemFinal();
                })
          ])),
        );
      }),
    );
  }
}
