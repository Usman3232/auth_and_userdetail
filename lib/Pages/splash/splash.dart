import 'dart:async';

import 'package:assinment/root/root.dart';
import 'package:assinment/utils/size_config.dart';
import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(
        Duration(seconds: 2),
        () => Navigator.pushReplacement(
            context, new MaterialPageRoute(builder: (context) => Root())));
    return Scaffold(
      body: Container(
        height: SizeConfig.heightMultiplier * 100,
        width: SizeConfig.widthMultiplier * 100,
        decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(image: AssetImage('assets/welcome.png'))),
      ),
    );
  }
}
