import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:waste_product/models/item.dart';
import 'package:waste_product/views/user_views/insert_detail_advert.dart';

class SelectTypeAdvert extends StatefulWidget {
  const SelectTypeAdvert({Key key}) : super(key: key);

  @override
  State<SelectTypeAdvert> createState() => _SelectTypeAdvertState();
}

class _SelectTypeAdvertState extends State<SelectTypeAdvert> {
  final List<Item> _companies = [
    Item(
        name: 'Kağıt',
        imageUrl: 'https://cdn-icons-png.flaticon.com/512/1074/1074055.png',
        star: 3.0),
    Item(
        name: 'Not Kitapları',
        imageUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQHtLqURUXcIUw0JN8yoG9JcSY-yuARcF04YA&usqp=CAU',
        star: 2.0),
    Item(
        name: 'Karton',
        imageUrl:
            'https://st2.depositphotos.com/3907761/7996/v/950/depositphotos_79967044-stock-illustration-box-icon.jpg',
        star: 4.0),
    Item(
        name: 'Demir',
        imageUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRkZBUzaox-fWeSFxh8D5Zcbp2uq0T9tdjgMA&usqp=CAU',
        star: 4.5),
    Item(
        name: 'Teneke',
        imageUrl:
            'https://media.istockphoto.com/vectors/tin-can-waste-vector-id866163458?s=612x612',
        star: 3.5),
    Item(
        name: 'Aluminyum',
        imageUrl:
            'https://alsanaluminyum.com/wp-content/uploads/2020/02/ikon-3-aluminyum-profil.png',
        star: 2.5),
    Item(
        name: 'Plastik şişe',
        imageUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRzKbXkgmaASH5GUOPtzMKSKF3ja-gZFk3vlg&usqp=CAU',
        star: 2.0),
    Item(
        name: 'Süt Kapakları',
        imageUrl:
            'https://media.istockphoto.com/vectors/pack-of-milk-isolated-in-doodle-style-illustration-of-a-black-line-vector-id1254945363',
        star: 4.0),
    Item(
        name: 'Karıştılımış plastik',
        imageUrl:
            'https://cdn-icons-png.flaticon.com/512/2666/2666681.png',
        star: 3.5),
    // "kağıt",
    // "plastik",
    // "metal",
    // "bitkisel atık yağlar",
    // "piller",
    // "elektrikli eşyalar",
    // "elektronik eşyalar",
    // "cam ambalaj atıkları"
  ];
  final List<Item> _filters = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () => Get.back(),
          ),
          title: Text("${_filters.length} item selected",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black))),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                width: Get.width,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.black,
                  ),
                ),
                child: const Text(
                    "Ne gibi ürünleri geri dönüştürmek istiyorsunuz?",
                    textAlign: TextAlign.center)),

            Wrap(
              spacing: 0.0,
              runSpacing: 0.0,
              children: companyPosition.toList(),
            ),
            // Container(
            //   padding: const EdgeInsets.all(16),
            //   child: Row(
            //     children: [
            //       RaisedButton(
            //         onPressed: () => pickImage(),
            //         child: const Text('Take a picture'),
            //       ),
            //       isImageLoading != null
            //           ? isImageLoading!
            //               ? const CircularProgressIndicator()
            //               : SizedBox(
            //                   width: 50,
            //                   height: 50,
            //                   child: Image.file(
            //                     File(_pickedImage!.path),
            //                   ),
            //                 )
            //           : Container(
            //               child: Text("No Image"),
            //             )
            //     ],
            //   ),
            // ),
            // Container(
            //   margin: const EdgeInsets.all(16),
            //   padding: const EdgeInsets.all(5),
            //   decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(10),
            //       border: Border.all(color: Colors.black)),
            //   child: const TextField(
            //     // controller: emailController,
            //     decoration: InputDecoration(
            //         border: InputBorder.none,
            //         hintText: "Location",
            //         hintStyle: TextStyle(color: Colors.grey)),
            //   ),
            // ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () => Get.to(() => const InsertAdvertDetails()),
                child: Text("Devam"),
                style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    padding: EdgeInsets.all(16),
                    fixedSize: Size(Get.width / 1.1, 50))),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  Iterable<Widget> get companyPosition sync* {
    for (Item company in _companies) {
      yield GestureDetector(
        onTap: () {
          if (_filters.contains(company)) {
            _filters.remove(company);
          } else {
            _filters.add(company);
          }
          setState(() {});
        },
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: _filters.contains(company)
                  ? Border.all(color: Colors.blue)
                  : null,
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 0.5,
                  spreadRadius: 0.0,
                  // offset: Offset(2.0, 2.0), // shadow direction: bottom right
                )
              ],
            ),
            margin: const EdgeInsets.all(5),
            padding: const EdgeInsets.all(8),
            width: Get.width / 3.5,
            height: Get.height / 5,
            child: Column(
              children: [
                Text(
                  company.name,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                Image.network(company.imageUrl,
                    fit: BoxFit.fill, height: 60, width: 60),
                Row(
                  children: [
                    Icon(
                      Icons.star_border_outlined,
                      color: Colors.yellow,
                    ),
                    Text(
                      "${company.star}/kg",
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ],
            )),
      );
    }
  }


}

 


// FilterChip(
//           backgroundColor: Colors.tealAccent[200],
//           avatar: CircleAvatar(
//             backgroundColor: Colors.cyan,
//             child: Text(
//               company[0].toUpperCase(),
//               style: TextStyle(color: Colors.white),
//             ),
//           ),
//           label: Text(
//             company,
//           ),
//           selected: _filters.contains(company),
//           selectedColor: Colors.purpleAccent,
//           onSelected: (bool selected) {
//             setState(() {
//               if (selected) {
//                 _filters.add(company);
//               } else {
//                 _filters.removeWhere((String name) {
//                   return name == company;
//                 });
//               }
//             });
//           },
//         ),