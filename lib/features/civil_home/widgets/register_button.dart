import 'package:flutter/material.dart';
import 'package:sahyog/commons/constants/global_variables.dart';

class RegisterProblemButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const RegisterProblemButton(
      {Key? key, required this.text, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            color: GlobalVariables.secondaryColor),
        child: FlatButton(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Text(
            text,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w700, fontSize: 18),
          ),
          onPressed: onTap,
        ),
      ),
    );
  }
}
