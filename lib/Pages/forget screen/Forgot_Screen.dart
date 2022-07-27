import 'package:assinment/Pages/sign%20in/sign_in.dart';
import 'package:assinment/utils/TextView.dart';
import 'package:assinment/utils/aut_btn.dart';
import 'package:assinment/utils/auth_input_text_field.dart';
import 'package:assinment/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotScreen extends StatelessWidget {
  const ForgotScreen({Key? key}) : super(key: key);

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
                    text: 'Forgot Password',
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
                      // labelText: 'Password',
                      cursorColor: Colors.black,
                    ),
                  ),
                  SizedBox(height: SizeConfig.heightMultiplier * 5),
                  Align(
                    alignment: Alignment.center,
                    child: CustomAuthButton(
                      callback: () {},
                      width: SizeConfig.widthMultiplier * 90,
                      height: SizeConfig.heightMultiplier * 5,
                      title: 'Submit',
                      colour: Colors.blueGrey,
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 2,
                  ),
                  Center(
                    child: InkWell(
                      onTap: () {
                        Get.to(Login());
                      },
                      child: TextView(
                        text: 'Back to Login',
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey,
                        size: SizeConfig.textMultiplier * 2,
                      ),
                    ),
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
