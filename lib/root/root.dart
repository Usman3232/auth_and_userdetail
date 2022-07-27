
import 'package:assinment/Pages/sign%20in/sign_in.dart';
import 'package:assinment/Pages/user%20details/User_detail.dart';
import 'package:assinment/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Root extends StatelessWidget {
  const Root({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(AuthController());
    return GetX<AuthController>(
      initState: (_){
        Get.lazyPut<AuthController>(() => AuthController());
      },
      builder: (_){
        if(_.users!=null){
          _.getUser();
          return UserDetail();
        }else{
          return Login();
        }
      });
  }
}