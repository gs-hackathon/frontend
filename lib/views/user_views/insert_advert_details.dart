import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class InsertAdvertDetails extends StatefulWidget {
  final List<String> selectedAdverts;
  const InsertAdvertDetails({Key? key, required this.selectedAdverts})
      : super(key: key);

  @override
  State<InsertAdvertDetails> createState() => _InsertAdvertDetailsState();
}

class _InsertAdvertDetailsState extends State<InsertAdvertDetails> {
  bool? isImageLoading;
  File? _pickedImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Advert'),
      ),
      body: Center(
        child: Wrap(
          spacing: 0.0,
          runSpacing: 0.0,
          children: companyPosition.toList(),
        ),
      ),
    );
  }

  Iterable<Widget> get companyPosition sync* {
    for (String advert in widget.selectedAdverts) {
      yield Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            children: [
              Text(
                advert,
                style: TextStyle(decoration: TextDecoration.underline),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Advert Location",
                  border: OutlineInputBorder(),
                ),
              ),
              RaisedButton(
                onPressed: () => pickImage(),
                child: const Text('insert image'),
              )
            ],
          ));
    }
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
