import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waste_product/views/user_views/insert_advert_details.dart';

class CreateAdvertScreen extends StatefulWidget {
  const CreateAdvertScreen({Key? key}) : super(key: key);

  @override
  State<CreateAdvertScreen> createState() => _CreateAdvertScreenState();
}

class _CreateAdvertScreenState extends State<CreateAdvertScreen> {
  List<String> _companies = [
    "kağıt",
    "plastik",
    "metal",
    "bitkisel atık yağlar",
    "piller",
    "elektrikli eşyalar",
    "elektronik eşyalar",
    "cam ambalaj atıkları"
  ];
  List<String> _filters = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Advert'),
      ),
      body: Center(
        child: SingleChildScrollView(
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
              SizedBox(
                height: Get.height / 6,
              ),
              ElevatedButton(
                  onPressed: () => Get.to(
                      () => InsertAdvertDetails(selectedAdverts: _filters)),
                  child: Text("İlan Oluştur"),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      padding: EdgeInsets.all(16),
                      fixedSize: Size(Get.width / 1.1, 50)))
            ],
          ),
        ),
      ),
    );
  }

  Iterable<Widget> get companyPosition sync* {
    for (String company in _companies) {
      yield Padding(
        padding: const EdgeInsets.all(6.0),
        child: FilterChip(
          backgroundColor: Colors.tealAccent[200],
          avatar: CircleAvatar(
            backgroundColor: Colors.cyan,
            child: Text(
              company[0].toUpperCase(),
              style: TextStyle(color: Colors.white),
            ),
          ),
          label: Text(
            company,
          ),
          selected: _filters.contains(company),
          selectedColor: Colors.purpleAccent,
          onSelected: (bool selected) {
            setState(() {
              if (selected) {
                _filters.add(company);
              } else {
                _filters.removeWhere((String name) {
                  return name == company;
                });
              }
            });
          },
        ),
      );
    }
  }
}
