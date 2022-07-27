import 'dart:io';
import 'package:assinment/Pages/sign%20in/sign_in.dart';
import 'package:assinment/controllers/auth_controller.dart';
import 'package:assinment/services/firebase_api.dart';
import 'package:assinment/utils/TextView.dart';
import 'package:assinment/utils/aut_btn.dart';
import 'package:assinment/utils/auth_input_text_field.dart';
import 'package:assinment/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/upload_image.dart';

class SignUp extends GetWidget<AuthController> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
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
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextView(
                    text: 'Sign Up',
                    size: SizeConfig.textMultiplier * 5,
                    fontWeight: FontWeight.bold,
                  ),
                  Align(alignment: Alignment.center, child: Upload_image()),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 2,
                  ),
                  TextView(text: 'Name', fontWeight: FontWeight.bold),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 7,
                    width: SizeConfig.widthMultiplier * 100,
                    child: AuthTextInputField(
                      textEditingController: name,
                      hintSize: SizeConfig.textMultiplier * 2,
                      hintText: "Username",
                      cursorColor: Colors.black,
                    ),
                  ),
                  TextView(text: 'Email', fontWeight: FontWeight.bold),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 7,
                    width: SizeConfig.widthMultiplier * 100,
                    child: AuthTextInputField(
                      textEditingController: email,
                      hintSize: SizeConfig.textMultiplier * 2,
                      hintText: "john@gmail.com",
                      cursorColor: Colors.black,
                    ),
                  ),
                  TextView(text: 'contact No.', fontWeight: FontWeight.bold),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 7,
                    width: SizeConfig.widthMultiplier * 100,
                    child: AuthTextInputField(
                      textEditingController: phone,
                      hintSize: SizeConfig.textMultiplier * 2,
                      hintText: "03*********",
                      cursorColor: Colors.black,
                    ),
                  ),
                  TextView(text: 'Password', fontWeight: FontWeight.bold),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 7,
                    width: SizeConfig.widthMultiplier * 100,
                    child: AuthTextInputField(
                      textEditingController: password,
                      hintSize: SizeConfig.textMultiplier * 2,
                      hintText: "*******",
                      // labelText: 'Password',
                      cursorColor: Colors.black,
                      isPassword: true,
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 3,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: CustomAuthButton(
                      callback: () {
                        if (controller.pickedImagePath.value != "" &&
                            email.text.isNotEmpty &&
                            password.text.isNotEmpty &&
                            name.text.isNotEmpty &&
                            phone.text.isNotEmpty) {
                          FirebaseApi.onImageUploaded(
                                  File(controller.pickedImagePath.value))
                              .then((value) {
                            controller.onSignup(
                                controller.imgURL.value,
                                name.text,
                                email.text,
                                phone.text,
                                password.text);
                          });
                        } else {
                          Get.snackbar(
                              "Please try again", "Provide all information :(",
                              backgroundColor: Colors.redAccent,
                              colorText: Colors.white);
                        }
                      },
                      width: SizeConfig.widthMultiplier * 90,
                      height: SizeConfig.heightMultiplier * 5,
                      title: 'Sign Up',
                      colour: Colors.blueGrey,
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 2,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () {
                        Get.to(Login());
                      },
                      child: TextView(
                        text: 'Already have an account?',
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
