import 'dart:io';
import 'package:assinment/controllers/auth_controller.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart';


class FirebaseApi{
  static UploadTask uploadImg(String destination, File file) {
    try {
      final imgRef = FirebaseStorage.instance.ref(destination);
      return imgRef.putFile(file);

      // ignore: unused_catch_clause
    } on FirebaseException catch (e) {
      rethrow;
    }
  }

  static Future onImageUploaded(File file) async {
    UploadTask? imgTask;

    //if file is null
    if (file == null) return "";
    //it will remove brackets and other unuseable words from the path
    final fileName = basename(file.path);
    //we have to add file/ before the path to make the path useable
    final destination = 'files/$fileName';
    //Here the img will be uploaded on firestore storage
    imgTask = uploadImg(destination, file);
    //if img is not uploading then it will return simple
    if (imgTask == null) return "";
    //on completing upload that will generates a link which we store in imgURL
    final snapshot = await imgTask.whenComplete(() {});
    Get.find<AuthController>().imgURL.value =
        await snapshot.ref.getDownloadURL();
    
  }
}