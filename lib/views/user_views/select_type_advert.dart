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
        itemNumber: 1,
        name: 'Kağıt',
        imageUrl: 'https://cdn-icons-png.flaticon.com/512/1074/1074055.png',
        star: 3.0),
    Item(
        itemNumber: 2,
        name: 'Not Kitapları',
        imageUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQHtLqURUXcIUw0JN8yoG9JcSY-yuARcF04YA&usqp=CAU',
        star: 2.0),
    Item(
        itemNumber: 3,
        name: 'Karton',
        imageUrl:
            'https://st2.depositphotos.com/3907761/7996/v/950/depositphotos_79967044-stock-illustration-box-icon.jpg',
        star: 4.0),
    Item(
        itemNumber: 4,
        name: 'Demir',
        imageUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRkZBUzaox-fWeSFxh8D5Zcbp2uq0T9tdjgMA&usqp=CAU',
        star: 4.5),
    Item(
        itemNumber: 5,
        name: 'Teneke',
        imageUrl:
            'https://media.istockphoto.com/vectors/tin-can-waste-vector-id866163458?s=612x612',
        star: 3.5),
    Item(
        itemNumber: 6,
        name: 'Aluminyum',
        imageUrl:
            'https://alsanaluminyum.com/wp-content/uploads/2020/02/ikon-3-aluminyum-profil.png',
        star: 2.5),
    Item(
        itemNumber: 7,
        name: 'Plastik şişe',
        imageUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRzKbXkgmaASH5GUOPtzMKSKF3ja-gZFk3vlg&usqp=CAU',
        star: 2.0),
    Item(
        itemNumber: 8,
        name: 'Süt Kapakları',
        imageUrl:
            'https://media.istockphoto.com/vectors/pack-of-milk-isolated-in-doodle-style-illustration-of-a-black-line-vector-id1254945363',
        star: 4.0),
    Item(
        itemNumber: 9,
        name: 'Karıştılımış plastik',
        imageUrl: 'https://cdn-icons-png.flaticon.com/512/2666/2666681.png',
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
      appBar: appBarMethod(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            recycleTextMethod(),
            Wrap(
              spacing: 0.0,
              runSpacing: 0.0,
              children: companyPosition.toList(),
            ),
            SizedBox(
              height: 20,
            ),
            continueButtonMethod(),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  ElevatedButton continueButtonMethod() {
    return ElevatedButton(
        onPressed: () =>
            Get.to(() => InsertAdvertDetails(selectedItems: _filters)),
        child: Text("Devam"),
        style: ElevatedButton.styleFrom(
            primary: Colors.blue,
            padding: EdgeInsets.all(16),
            fixedSize: Size(Get.width / 1.1, 50)));
  }

  Container recycleTextMethod() {
    return Container(
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
        child: const Text("Ne gibi ürünleri geri dönüştürmek istiyorsunuz?",
            textAlign: TextAlign.center));
  }

  AppBar appBarMethod() {
    return AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () => Get.back(),
        ),
        title: Text("${_filters.length} tip ürün seçildi",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black)));
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
                  ? Border.all(color: Colors.blue, width: 0)
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
            height: 140,
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
