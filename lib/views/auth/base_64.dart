import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:waste_product/views/auth/login_2.dart';

class TakePictureScreen extends StatefulWidget {
  const TakePictureScreen({Key? key}) : super(key: key);

  @override
  State<TakePictureScreen> createState() => _TakePictureScreenState();
}

class _TakePictureScreenState extends State<TakePictureScreen> {
  bool? isImageLoading;
  File? _pickedImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Take a picture'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              isImageLoading != null
                  ? isImageLoading!
                      ? const CircularProgressIndicator()
                      : Column(
                          children: [
                            Text("picked Image"),
                            SizedBox(
                              width: 200,
                              height: 200,
                              child: Image.file(
                                File(_pickedImage!.path),
                              ),
                            )
                          ],
                        )
                  : Container(
                      child: Text("No Image"),
                    ),
              RaisedButton(
                onPressed: () => pickImage(),
                child: const Text('Take a picture'),
              ),
              RaisedButton(
                onPressed: () => Get.to(() => const LoginPage2()),
                child: const Text('Get a password'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> pickImage() async {
    try {
      setState(() {
        isImageLoading = true;
      });
      XFile? pickedFile =
          await ImagePicker().pickImage(source: ImageSource.camera);

      if (pickedFile != null) {
        setState(() {
          _pickedImage = File(pickedFile!.path);
          isImageLoading = false;
        });
        print("picked image" + pickedFile!.path);
      } else {
        print("picked image null");
      }
    } on PlatformException catch (e) {
      print("user denied image access: $e");
      setState(() {
        isImageLoading = false;
      });
    }
  }
}
