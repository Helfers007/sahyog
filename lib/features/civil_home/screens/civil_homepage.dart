import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CivilHomePage extends StatelessWidget {
  final String phoneNum;
  const CivilHomePage({Key? key, required this.phoneNum}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sahyog"),
      ),
      body: Center(
        child: Text("Civilian HomePage  \n Phone number ::$phoneNum"),
      ),
    );
  }
}
