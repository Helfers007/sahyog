import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahyog/currently_working/global_variables.dart';
import 'package:sahyog/currently_working/buttons/custom_button.dart';
import 'package:sahyog/currently_working/pages/civilian/civil_login_page.dart';
import 'package:sahyog/currently_working/textfields/custom_textfield.dart';

class CivilSignupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            decoration: BoxDecoration(gradient: GV.backGroundGradient),
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Container(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 40,
                    ),
                    Image.asset(
                      "assets/logo.png",
                      width: Get.height * 0.2,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "SahYog Civilian",
                      style: TextStyle(
                          color: GV.primaryColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 30),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                      //   controller: civilAuthController.phoneController,
                      hintText: "Name",
                      preIcon: Icons.person,
                      isPasswordType: false,
                      keyboardType: TextInputType.name,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      //   controller: civilAuthController.phoneController,
                      hintText: "Phone number (+91)",
                      preIcon: Icons.phone,
                      isPasswordType: false,
                      keyboardType: TextInputType.phone,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                        //  controller: civilAuthController.passwordController,
                        hintText: "Password",
                        preIcon: Icons.password,
                        isPasswordType: true),
                    SizedBox(
                      height: 20,
                    ),
                    CustomButton(text: "Sign Up", onTap: () {}),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Already have an Account ? ",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.normal),
                        ),
                        InkWell(
                          onTap: () {
                            Get.off(CivilLoginPage());
                          },
                          child: Text("Login now ",
                              style: TextStyle(
                                  color: GV.primaryColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  decoration: TextDecoration.underline)),
                        ),
                      ],
                    ),
                  ],
                ),
                width: double.infinity,
              ),
            )));
  }
}
