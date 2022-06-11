import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:waste_product/models/item.dart';
import 'package:waste_product/services/orders_services.dart';
import 'package:waste_product/utils/color.dart';
import 'package:waste_product/utils/format_utils.dart';
import 'package:waste_product/views/user_views/user_home_page.dart';

class InsertAdvertDetails extends StatefulWidget {
  final List<Item> selectedItems;
  const InsertAdvertDetails({Key key, this.selectedItems}) : super(key: key);

  @override
  State<InsertAdvertDetails> createState() => _InsertAdvertDetailsState();
}

class _InsertAdvertDetailsState extends State<InsertAdvertDetails> {
  DateTime selectedDate;
  bool isImageLoading;
  String _base64String;
  DateTime selectedDateTime;
  TextEditingController _timeController = TextEditingController();
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
        body: Container(
          margin: const EdgeInsets.only(left: 20, right: 20),
          child: SingleChildScrollView(
              child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
          SizedBox(
            height: Get.height / 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  alignment: Alignment.centerLeft,
                  child: const Text("Tarih",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
              IconButton(
                  onPressed: () => Get.back(),
                  icon: Icon(Icons.cancel_outlined))
            ],
          ),
          Container(
            width: Get.width / 2.2,
            margin: const EdgeInsets.only(bottom: 16),
            child: TextFormField(
              onTap: () => pickDateTime(context),
              controller: _timeController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(22.0)),
                      borderSide: BorderSide(color: Colors.teal)),
                  labelText: "Gönderi zamanı",
                  labelStyle: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                      fontSize: 16,
                      fontWeight: FontWeight.normal)),
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.normal),
            ),
          ),
          // SizedBox(
          //   height: 10,
          // ),
          Divider(
            thickness: 1,
          ),
          Container(
              margin: const EdgeInsets.only(bottom: 10),
              alignment: Alignment.centerLeft,
              child: const Text("Fotoğraf",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
          Container(
            margin: const EdgeInsets.only(bottom: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => pickImage(true),
                  child: Container(
                      alignment: Alignment.center,
                      width: Get.width / 2.5,
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22),
                        border: Border.all(
                          color: Colors.black
                              .withOpacity(0.3), // red as border color
                        ),
                      ),
                      child: Text("Kamera",
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.5)))),
                ),
                GestureDetector(
                  onTap: () => pickImage(false),
                  child: Container(
                      alignment: Alignment.center,
                      width: Get.width / 2.5,
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22),
                        border: Border.all(
                          color: Colors.black
                              .withOpacity(0.3), // red as border color
                        ),
                      ),
                      child: Text("Galeri",
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.5)))),
                ),
              ],
            ),
          ),
          Center(
            child: isImageLoading != null
                ? isImageLoading
                    ? const CircularProgressIndicator()
                    : SizedBox(
                        width: 120,
                        height: 120,
                        child: Image.file(
                          File(_pickedImage.path),
                        ),
                      )
                : Container(),
          ),
          Divider(
            thickness: 1,
          ),
          Container(
              margin: const EdgeInsets.only(bottom: 10),
              alignment: Alignment.centerLeft,
              child: const Text("Konum",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
          Container(
              child: textFormFieldToInsertEmail()),
          SizedBox(
            height: 50,
          ),
          Container(
            width: Get.width,
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.only(top: 16, bottom: 16),
            decoration: BoxDecoration(
              color: mainColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: TextButton(
                onPressed: () {
                  print("bastıı");
                  // insertOrder().then((value) {
                  Get.snackbar(
                      "İlan oluşturma", "İlanınız Başarıyla oluşturulmuştur.");
                  Get.to(() => const UserHomePage());
                  // });
                },
                child: Text("İlanı Tamamla",
                    style: TextStyle(color: Colors.white, fontSize: 16))
                // style: ElevatedButton.styleFrom(
                //     primary: Colors.blue,
                //     padding: EdgeInsets.all(16),
                //     fixedSize: Size(Get.width / 1.1, 50))

                ),
          ),
          SizedBox(
            height: 20,
          ),
      ],
    )),
        ));
  }

  Future<void> insertOrder() async {
    List<int> itemsNumbers =
        widget.selectedItems.map((e) => e.itemNumber).toList();
    await OrderService.insertOrder(_base64String, itemsNumbers,
        _locationController.text, selectedDate.toString().formatDate);
  }

  // Align pickDeadlineMethod() {
  //   return Align(
  //     alignment: Alignment.centerLeft,
  //     child: Container(
  //         decoration: BoxDecoration(
  //           border: Border.all(width: 0.7, color: Colors.grey),
  //           color: Colors.white,
  //           borderRadius: const BorderRadius.all(Radius.circular(8)),
  //         ),
  //         width: Get.width / 2.3,
  //         padding: const EdgeInsets.only(left: 8, right: 8),
  //         child:
  //             Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
  //           Text(selectedDate == null
  //               ? "Today"
  //               : selectedDate.toString().formatDate),
  //           IconButton(
  //             icon: const Icon(Icons.calendar_today),
  //             onPressed: () {
  //               Get.defaultDialog(
  //                 title: "Bitiş Tarihi Seç",
  //                 content: SizedBox(
  //                   width: Get.width,
  //                   height: Get.height / 2,
  //                   child: SfDateRangePicker(
  //                     onSelectionChanged: _onSelectionChanged,
  //                     view: DateRangePickerView.month,
  //                     selectionMode: DateRangePickerSelectionMode.single,
  //                     showActionButtons: true,
  //                     onCancel: () {
  //                       Get.back();
  //                       setState(() {
  //                         // showRememberTimer = false;
  //                         selectedDate = null;
  //                       });
  //                     },
  //                     onSubmit: (value) {
  //                       Get.back();
  //                     },
  //                     confirmText: 'Uygula',
  //                     cancelText: 'İptal',
  //                   ),
  //                 ),
  //               );
  //             },
  //           )
  //         ])),
  //   );
  // }

  Future pickDateTime(BuildContext context) async {
    final date = await pickDate(context);
    if (date == null) return;

    final time = await pickTime(context);
    if (time == null) return;
    selectedDateTime = DateTime(
      date.year,
      date.month,
      date.day,
      time.hour,
      time.minute,
    );
    _timeController.value = TextEditingValue(
      text: selectedDateTime.toString().formatDateAll,
      selection: TextSelection.fromPosition(
        TextPosition(offset: selectedDateTime.toString().formatDateAll.length),
      ),
    );
    setState(() {});
  }

  Future<TimeOfDay> pickTime(BuildContext context) async {
    final initialTime = TimeOfDay(hour: 9, minute: 0);
    final newTime = await showTimePicker(
      context: context,
      initialTime: selectedDateTime != null
          ? TimeOfDay(
              hour: selectedDateTime.hour, minute: selectedDateTime.minute)
          : initialTime,
    );

    if (newTime == null) return null;

    return newTime;
  }

  Future<DateTime> pickDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: selectedDateTime ?? initialDate,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    );

    if (newDate == null) return null;

    return newDate;
  }

  Future<void> pickImage(bool isCamera) async {
    try {
      setState(() {
        isImageLoading = true;
      });
      XFile pickedFile = await ImagePicker().pickImage(
          source: isCamera ? ImageSource.camera : ImageSource.gallery);

      if (pickedFile != null) {
        _base64String = convertImageToBase64(pickedFile.path);
        File _pickedFile = await convertBase64ToImage(_base64String);
        _pickedImage = File(_pickedFile.path);
        isImageLoading = false;
        setState(() {});
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

  String convertImageToBase64(String _imagePath) {
    final image = File(_imagePath);
    final bytes = image.readAsBytesSync();
    final base64Image = base64Encode(bytes);
    return base64Image;
  }

  Future<File> convertBase64ToImage(String encodedStr) async {
    Uint8List bytes = base64.decode(encodedStr);
    var dir = await getApplicationDocumentsDirectory();
    File file = File("${dir.path}/" +
        DateTime.now().millisecondsSinceEpoch.toString() +
        ".png");
    await file.writeAsBytes(bytes);
    return file;
  }

  Container textFormFieldToInsertEmail() {
    return Container(
      padding: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 0.7, color: Colors.grey)),
      // border: Border(bottom: BorderSide(color: Colors.grey[100]!))),
      child: TextField(
        maxLines: 5,
        controller: _locationController,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Konum",
            hintStyle: TextStyle(color: Colors.grey[400])),
      ),
    );
  }
}
