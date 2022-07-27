import 'package:assinment/model/user_mode.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<void> onUserCreate(UserModel user) async {
    try {
      await _firestore.collection("Users").doc(user.id).set({
        "Name": user.name,
        "Phone": user.phone,
        "Email": user.email,
        "Password": user.password,
        "Image":user.imgURL
      });
    } catch (e) {
      print(e);
    }
  }
}
