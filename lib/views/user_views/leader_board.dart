import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waste_product/models/users_model.dart';
import 'package:waste_product/services/user/get_users.dart';

class Person {
  final String name;
  final String image;
  final String title;
  final double points;

  Person(this.name, this.image, this.title, this.points);
}

class LeaderBoard extends StatefulWidget {
  const LeaderBoard({Key key}) : super(key: key);

  @override
  State<LeaderBoard> createState() => _LeaderBoardState();
}

class _LeaderBoardState extends State<LeaderBoard> {
  List<Data> users;

  @override
  initState() {
    super.initState();
    getAllUsersFunction();
  }

  Future<void> getAllUsersFunction() async {
    Users response = await UserService.getAllUsers();
    setState(() {
      if (response.data.isNotEmpty) {
        users = response.data;
      } else {
        users = [];
      }
    });
  }

  List<Person> people = [
    Person(
        "Timur",
        "https://media-exp1.licdn.com/dms/image/C4D03AQEs55XZN4QanQ/profile-displayphoto-shrink_800_800/0/1638901236761?e=1658361600&v=beta&t=xeE01H2TZDKGGtc1XGBMXHNA2Oi5GW46H2Bmer4x3NY",
        "Geri dönüştürücü",
        1400.0),
    Person(
        "Ahmet",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQFEMBwOoxcZrk5BBJZDitVllcOHS-FcAo34WHGyEU5Op4NwDidxNfc3_w5wRYty05piUc&usqp=CAU",
        "Geri dönüştürücü",
        860.0),
    Person(
        "Seda",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDjuTJpjtTRfJ-MPxh2qxiPXYZAQkH_GwmjO3AqQXiI1zQnN3kqJ9JjVSU3eBr-2IFumw&usqp=CAU",
        "Geri dönüştürücü",
        468.0),
    Person(
        "Özgür",
        "https://magic.com.tr/wp-content/uploads/2020/05/50x50-abd.jpg",
        "Geri dönüştürücü",
        200.0),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () => Get.back(),
        ),
        backgroundColor: Colors.white,
        title: Text('Lider Tablosu', style: TextStyle(color: Colors.black)),
      ),
      body: users != null
          ? users.isNotEmpty
              ? SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: Get.height / 36,
                      ),
                      SizedBox(
                        height: Get.height,
                        child: ListView.separated(
                          itemCount: users.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                              leading: Text(
                                "${index + 1}",
                                style: TextStyle(
                                  fontSize: Get.height / 40,
                                  fontWeight: FontWeight.w600,
                                ),
                                textAlign: TextAlign.end,
                              ),
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.network(
                                        people[index].image,
                                        fit: BoxFit.fill,
                                        height: 50,
                                      )),
                                  SizedBox(width: Get.width / 40),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(users[index].name,
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold)),
                                      Text(people[index].title,
                                          style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w300)),
                                    ],
                                  ),
                                ],
                              ),
                              trailing: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(users[index].points.toString(),
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold)),
                                  Text("Puan",
                                      style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w300))
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (_, __) => Divider(),
                        ),
                      )
                    ],
                  ),
                )
              : Container(child: Text("there is not user data"))
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
