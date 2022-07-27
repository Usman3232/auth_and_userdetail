import 'package:assinment/services/database.dart';
import 'package:assinment/model/user_mode.dart';
import 'package:assinment/root/root.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Rxn<User> firebaseuser = Rxn<User>();
  User? get users => firebaseuser.value;
  Rx<UserModel> userss = UserModel().obs;
  UserModel get userinput => userss.value;
  set userinput(UserModel value) => userss.value = value;
  @override
  void onInit() {
    super.onInit();
    firebaseuser.bindStream(_firebaseAuth.authStateChanges());
  }

  getUser() async {
    try {
      //It is getting data from the collection of "Users" which is in the database(uid is the unique id of each user in the app)
      final DocumentSnapshot doc = await FirebaseFirestore.instance
          .collection('Users')
          .doc(users!.uid)
          .get();
      userinput = UserModel.fromDocumentSnapshot(doc);
      print(users?.uid ?? "null");
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  RxString imgURL = "".obs;
  RxString pickedImagePath = "".obs;
  void onSignin(String email, String password) async {
    try {
      await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) => getUser())
          .then((value) => Get.offAll(Root()))
          .then((value) {
        Get.snackbar("Success", "You logged in successfully ;)",
            backgroundColor: Colors.green, colorText: Colors.white);
      });
    } catch (e) {
      print(e);
    }
  }

  void onSignup(String image, String name, String email, String phone,
      String password) async {
    try {
      UserCredential _authCredentials = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      UserModel user = UserModel(
          id: _authCredentials.user!.uid,
          name: name,
          email: email,
          phone: phone,
          imgURL: image,
          password: password);
      Database().onUserCreate(user).then((value) {
        Get.snackbar("Created", "User Created Successfully :)",
            backgroundColor: Colors.green, colorText: Colors.white);
      });
    } catch (e) {
      print(e);
    }
  }

  void onsignOut() {
    try {
      _firebaseAuth.signOut().then((value) => Get.to(Root()));
    } catch (e) {
      Get.snackbar('Error', 'please try again',
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }
}
