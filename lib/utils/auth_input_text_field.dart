import 'package:flutter/material.dart';

class AuthTextInputField extends StatefulWidget {
  final String hintText;
  final double? hintSize;
  final bool isPassword;
  final Color hintcolor;
  final Color fillColor;
  final Color textColor;
  final Color cursorColor;
  final TextEditingController? textEditingController;
  final TextInputType inputType;
  final  suffixIcon;
  final prefixIcon;
  final enabled;

  const AuthTextInputField({
    Key? key,
    required this.hintText,
    this.textEditingController,
    this.isPassword = false,
    this.hintSize,
    this.hintcolor = Colors.grey,
    this.fillColor = Colors.transparent,
    this.textColor = Colors.black,
    this.cursorColor = Colors.blue,
    this.inputType = TextInputType.text,
    this.suffixIcon,
    this.prefixIcon,
    this.enabled,
  }) : super(key: key);

  @override
  State<AuthTextInputField> createState() => _TextInputFieldViewState();
}

class _TextInputFieldViewState extends State<AuthTextInputField> {
  bool isObscure = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isObscure = widget.isPassword == true;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: widget.enabled,
      obscureText: isObscure,
      style: TextStyle(color: widget.textColor),
      controller: widget.textEditingController,
      keyboardType: widget.inputType,
      decoration: InputDecoration(
        filled: true,
        fillColor: widget.fillColor,
        hintText: widget.hintText,
        hintStyle:
            TextStyle(fontSize: widget.hintSize, color: widget.hintcolor),
        suffixIcon: widget.isPassword
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    isObscure = !isObscure;
                  });
                },
                child: Container(
                  height: 16,
                  width: 16,
                  margin: EdgeInsets.all(15),
                  child: Image.asset(
                      isObscure ? "assets/eye_hide.png" : "assets/lock.png"),
                ),
              )
            : widget.suffixIcon,
      ),
      cursorColor: widget.cursorColor,
    );
  }
}
