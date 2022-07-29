import 'dart:io';
import 'package:assinment/controllers/auth_controller.dart';
import 'package:assinment/utils/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class Upload_image extends StatefulWidget {
  const Upload_image({
    Key? key,
  }) : super(key: key);

  @override
  State<Upload_image> createState() => _Upload_imageState();
}

class _Upload_imageState extends State<Upload_image> {
  final ImagePicker _picker = ImagePicker();

  File? images;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: SizeConfig.heightMultiplier * 15,
          width: SizeConfig.widthMultiplier * 30,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(width: 1, color: Colors.grey)),
          child: InkWell(
            child: ClipOval(
                child: images != null
                    ? Image(
                        image: FileImage(images!),
                      )
                    : Image.asset(
                        "assets/uploadimage.png",
                        fit: BoxFit.fill,
                      )),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (_) => CupertinoAlertDialog(
                        title: Text("Choose From"),
                        actions: [
                          CupertinoDialogAction(
                            child: GestureDetector(
                              child: Text('Camera'),
                              onTap: () {
                                getImage(ImageSource.camera);
                              },
                            ),
                          ),
                          CupertinoDialogAction(
                            child: GestureDetector(
                              child: Text('Gallery'),
                              onTap: () {
                                getImage(ImageSource.camera);
                              },
                            ),
                          )
                        ],
                      ));
            },
          ),
        ),
      ],
    );
  }

  getImage(ImageSource source) async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: source,
    );
    if (pickedFile != null) {
      setState(() {
        images = File(pickedFile.path);
        Get.find<AuthController>().pickedImagePath.value = pickedFile.path;
      });
      Get.back();
    }
  }
}
