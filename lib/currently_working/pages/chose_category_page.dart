import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:sahyog/currently_working/buttons/choose_category_button.dart';
import 'package:sahyog/currently_working/global_variables.dart';

class ChooseCategoryPage extends StatelessWidget {
  const ChooseCategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(gradient: GV.backGroundGradient),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CategoryButton(
                text: 'OFFICER',
                chooseCategoryfunction: () {},
              ),
              CategoryButton(
                text: 'RESPONSE FORCE',
                chooseCategoryfunction: () {},
              ),
              CategoryButton(text: 'CIVILIANS', chooseCategoryfunction: () {}),
            ],
          )),
    );
  }
}
