import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? id, name, email, phone, password,imgURL;
  UserModel({this.email, this.name, this.id, this.password, this.phone,this.imgURL});
  UserModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    id = doc.id;
    name = doc["Name"];
    phone = doc["Phone"];
    email = doc["Email"];
    password = doc["Password"];
    imgURL=doc["Image"];
  }
}
