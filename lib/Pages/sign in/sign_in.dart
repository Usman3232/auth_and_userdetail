import 'package:assinment/Pages/forget%20screen/Forgot_Screen.dart';
import 'package:assinment/Pages/sign%20up/sign_up.dart';
import 'package:assinment/Pages/user%20details/User_detail.dart';
import 'package:assinment/controllers/auth_controller.dart';
import 'package:assinment/utils/TextView.dart';
import 'package:assinment/utils/aut_btn.dart';
import 'package:assinment/utils/auth_input_text_field.dart';
import 'package:assinment/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends GetWidget<AuthController> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: SizeConfig.heightMultiplier * 30,
              width: SizeConfig.widthMultiplier * 100,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/welcome.png"),
                      fit: BoxFit.cover,
                      alignment: Alignment.bottomCenter)),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextView(
                    text: 'Login',
                    size: SizeConfig.textMultiplier * 5,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(height: SizeConfig.heightMultiplier * 5),
                  TextView(text: 'Email', fontWeight: FontWeight.bold),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 7,
                    width: SizeConfig.widthMultiplier * 100,
                    child: AuthTextInputField(
                      hintSize: SizeConfig.textMultiplier * 2,
                      hintText: "john@gmail.com",
                      textEditingController: email,
                      cursorColor: Colors.black,
                    ),
                  ),
                  SizedBox(height: SizeConfig.heightMultiplier * 1),
                  TextView(text: 'Password', fontWeight: FontWeight.bold),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 7,
                    width: SizeConfig.widthMultiplier * 100,
                    child: AuthTextInputField(
                      hintSize: SizeConfig.textMultiplier * 2,
                      hintText: "*******",
                      textEditingController: password,
                      cursorColor: Colors.black,
                      isPassword: true,
                    ),
                  ),
                  SizedBox(height: SizeConfig.heightMultiplier * 5),
                  Align(
                    alignment: Alignment.center,
                    child: CustomAuthButton(
                      callback: () {
                        controller.onSignin(email.text, password.text);
                      },
                      width: SizeConfig.widthMultiplier * 90,
                      height: SizeConfig.heightMultiplier * 5,
                      title: 'Login',
                      colour: Colors.blueGrey,
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.to(SignUp());
                        },
                        child: TextView(
                          text: 'Don`t have an account?',
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey,
                          size: SizeConfig.textMultiplier * 2,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(ForgotScreen());
                        },
                        child: TextView(
                          text: 'Forgot Password?',
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey,
                          size: SizeConfig.textMultiplier * 2,
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
