import 'package:assinment/controllers/auth_controller.dart';
import 'package:assinment/utils/TextView.dart';
import 'package:assinment/utils/aut_btn.dart';
import 'package:assinment/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserDetail extends GetWidget<AuthController> {
  final controller = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    controller.getUser();
    return Scaffold(
      backgroundColor: Colors.green,
      body: Container(
        height: SizeConfig.heightMultiplier * 100,
        width: SizeConfig.widthMultiplier * 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => CircleAvatar(
                radius: 70,
                backgroundImage:
                    NetworkImage(controller.userinput.imgURL ?? ""),
                backgroundColor: Colors.white,
              ),
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 2,
            ),
            TextView(
              text: controller.userinput.name ?? "",
              color: Colors.white,
              fontWeight: FontWeight.bold,
              size: SizeConfig.textMultiplier * 4,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80),
              child: Divider(
                color: Colors.white,
                thickness: 1,
              ),
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 2,
            ),
            Container(
              height: SizeConfig.heightMultiplier * 6,
              width: SizeConfig.widthMultiplier * 90,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Icon(
                      Icons.phone,
                      color: Colors.green,
                    ),
                    SizedBox(
                      width: SizeConfig.widthMultiplier * 4,
                    ),
                    Obx(
                      () => TextView(
                        text: controller.userinput.phone ?? "",
                        color: Colors.green,
                        size: SizeConfig.textMultiplier * 2.5,
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 2,
            ),
            Container(
              height: SizeConfig.heightMultiplier * 6,
              width: SizeConfig.widthMultiplier * 90,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Icon(
                      Icons.email,
                      color: Colors.green,
                    ),
                    SizedBox(
                      width: SizeConfig.widthMultiplier * 4,
                    ),
                    Obx(
                      () => TextView(
                        text: controller.userinput.email??"",
                        color: Colors.green,
                        size: SizeConfig.textMultiplier * 2.5,
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 6,
            ),
            CustomAuthButton(
              callback: () {
                controller.onsignOut();
              },
              height: SizeConfig.heightMultiplier * 5,
              width: SizeConfig.widthMultiplier * 70,
              colour: Colors.blueGrey,
              title: 'Log out',
            )
          ],
        ),
      ),
    );
  }
}
