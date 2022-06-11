import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waste_product/utils/color.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () => Get.back(),
        ),
        backgroundColor: Colors.white,
        title: Text('Profilim', style: TextStyle(color: Colors.black)),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: Get.height / 18,
            ),
            ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  "assets/images/person_icon.png",
                  fit: BoxFit.fill,
                  height: 120,
                )),
            Container(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Kullanıcı Adı",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w300)),
                  SizedBox(
                    width: Get.width / 20,
                  ),
                  Text("Timur",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                ],
              ),
            ),
            Divider(
              height: 0,
            ),
            Container(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Adres",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w300)),
                  SizedBox(
                    width: Get.width / 20,
                  ),
                  Text(
                      "Orhan Gazi mah. 1672. sok no: 42/44".substring(0, 20) +
                          "...",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                ],
              ),
            ),
            Divider(
              height: 0,
            ),
            Container(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Şifre",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w300)),
                  SizedBox(
                    width: Get.width / 20,
                  ),
                  Text("********",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                ],
              ),
            ),
            Divider(
              height: 0,
            ),
            SizedBox(
              height: Get.height / 18,
            ),
            ElevatedButton(
                onPressed: () {
                  // Get.snackbar(
                  //     "İlan oluşturma", "İlanınız Başarıyla oluşturulmuştur.");
                  // Get.to(() => const UserHomePage());
                },
                child: Text("Profili Güncelle", style: TextStyle(fontSize: 16)),
                style: ElevatedButton.styleFrom(
                    primary: Colors.indigo[700],
                    padding: EdgeInsets.all(16),
                    fixedSize: Size(Get.width / 1.1, 50))),
          ],
        ),
      ),
    );
  }
}
