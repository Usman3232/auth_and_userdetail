import 'package:assinment/utils/size_config.dart';
import 'package:flutter/material.dart';

class CustomAuthButton extends StatelessWidget {
  String title;
  final double? height;
  final double? width;
  final Color? colour, textcolour;

  // Function callback;
  VoidCallback callback;

  CustomAuthButton(
      {Key? key,
      this.title = "",
      required this.callback,
      this.colour,
      this.textcolour = Colors.white,
      this.height,
      this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: MaterialButton(
        height: height,
        minWidth: width,
        color: colour,
        onPressed: () {
          callback();
        },
        child: Text(
          title,
          style: TextStyle(
              fontSize: SizeConfig.textMultiplier * 3, color: textcolour),
        ),
      ),
    );
  }
}
