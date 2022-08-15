import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahyog/currently_working/global_variables.dart';

class CategoryButton extends StatelessWidget {
  String text;
  VoidCallback chooseCategoryfunction;
  CategoryButton({required this.text, required this.chooseCategoryfunction});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: Get.width * 0.7,
        child: ElevatedButton(onPressed: () {}, child: Text(text)));
  }
}
