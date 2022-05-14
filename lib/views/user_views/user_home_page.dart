import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waste_product/views/user_views/create_advert.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
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
                    color: Colors.black, // red as border color
                  ),
                ),
                child: Text("Hoşgeldin Timur Turbil")),
            SizedBox(
              height: Get.height / 1.7,
            ),
            ElevatedButton(
                onPressed: () => Get.to(() => CreateAdvertScreen()),
                child: Text("İlan Oluştur"),
                style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    padding: EdgeInsets.all(16),
                    fixedSize: Size(Get.width / 1.1, 50)))
          ],
        ),
      ),
    );
  }
}
