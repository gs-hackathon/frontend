import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:waste_product/utils/format_utils.dart';
import 'package:waste_product/views/user_views/user_home_page.dart';

class InsertAdvertDetails extends StatefulWidget {
  const InsertAdvertDetails({Key key}) : super(key: key);

  @override
  State<InsertAdvertDetails> createState() => _InsertAdvertDetailsState();
}

class _InsertAdvertDetailsState extends State<InsertAdvertDetails> {
  DateTime selectedDate;
  bool isImageLoading;
  final TextEditingController _locationController = TextEditingController();
  File _pickedImage;
  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      selectedDate = args.value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
      children: [
        SizedBox(
          height: Get.height / 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                margin: const EdgeInsets.only(left: 16, right: 16),
                alignment: Alignment.centerLeft,
                child: const Text("Tarih",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
            IconButton(
                padding: const EdgeInsets.only(right: 16),
                onPressed: () => Get.back(),
                icon: Icon(Icons.cancel))
          ],
        ),
        Container(
            margin: const EdgeInsets.only(left: 16, right: 16),
            child: pickDeadlineMethod()),
        Divider(
          thickness: 1,
        ),
        Container(
            margin: const EdgeInsets.only(left: 16, right: 16),
            alignment: Alignment.centerLeft,
            child: const Text("Fotoğraf",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
        Container(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              RaisedButton(
                onPressed: () => pickImage(),
                child: const Text('Take a picture'),
              ),
              SizedBox(
                width: Get.width / 5,
              ),
              isImageLoading != null
                  ? isImageLoading
                      ? const CircularProgressIndicator()
                      : SizedBox(
                          width: 120,
                          height: 120,
                          child: Image.file(
                            File(_pickedImage.path),
                          ),
                        )
                  : Container(
                      child: Text("No Image"),
                    )
            ],
          ),
        ),
        Divider(
          thickness: 1,
        ),
        Container(
            margin: const EdgeInsets.only(left: 16, right: 16),
            alignment: Alignment.centerLeft,
            child: const Text("Konum",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
        Container(
            margin: const EdgeInsets.only(left: 16, right: 16),
            child: textFormFieldToInsertEmail()),
        SizedBox(
          height: 80,
        ),
        ElevatedButton(
            onPressed: () {
              Get.snackbar(
                  "İlan oluşturma", "İlanınız Başarıyla oluşturulmuştur.");
              Get.to(() => const UserHomePage());
            },
            child: Text("İlanı Tamamla"),
            style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                padding: EdgeInsets.all(16),
                fixedSize: Size(Get.width / 1.1, 50))),
        SizedBox(
          height: 20,
        ),
      ],
    )));
  }

  Align pickDeadlineMethod() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
          decoration: BoxDecoration(
            border: Border.all(width: 0.7, color: Colors.grey),
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(8)),
          ),
          width: Get.width / 2.3,
          padding: const EdgeInsets.only(left: 8, right: 8),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(selectedDate == null
                ? "Today"
                : selectedDate.toString().formatDate),
            IconButton(
              icon: const Icon(Icons.calendar_today),
              onPressed: () {
                Get.defaultDialog(
                  title: "Bitiş Tarihi Seç",
                  content: SizedBox(
                    width: Get.width,
                    height: Get.height / 2,
                    child: SfDateRangePicker(
                      onSelectionChanged: _onSelectionChanged,
                      view: DateRangePickerView.month,
                      selectionMode: DateRangePickerSelectionMode.single,
                      showActionButtons: true,
                      onCancel: () {
                        Get.back();
                        setState(() {
                          // showRememberTimer = false;
                          selectedDate = null;
                        });
                      },
                      onSubmit: (value) {
                        Get.back();
                      },
                      confirmText: 'Uygula',
                      cancelText: 'İptal',
                    ),
                  ),
                );
              },
            )
          ])),
    );
  }

  Future<void> pickImage() async {
    try {
      setState(() {
        isImageLoading = true;
      });
      XFile pickedFile =
          await ImagePicker().pickImage(source: ImageSource.camera);

      if (pickedFile != null) {
        setState(() {
          _pickedImage = File(pickedFile.path);
          isImageLoading = false;
        });
        print("picked image" + pickedFile.path);
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

  Container textFormFieldToInsertEmail() {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 0.7, color: Colors.grey)),
      // border: Border(bottom: BorderSide(color: Colors.grey[100]!))),
      child: TextField(
        controller: _locationController,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Konum",
            hintStyle: TextStyle(color: Colors.grey[400])),
      ),
    );
  }
}
