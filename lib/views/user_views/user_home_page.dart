import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:waste_product/views/user_views/all_orders.dart';
import 'package:waste_product/views/user_views/leader_board.dart';
import 'package:waste_product/views/user_views/profile.dart';
import 'package:waste_product/views/user_views/select_type_advert.dart';

class UserHomePage extends StatefulWidget {
  const UserHomePage({Key key}) : super(key: key);

  @override
  State<UserHomePage> createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  List<String> selectedCompanies = [
    "kağıt",
    "plastik",
    "metal",
  ];

  List<String> images = [
    "https://static.daktilo.com/sites/983/uploads/2021/08/31/11531-0.jpg",
    "https://www.buyuksivas.com/wp-content/uploads/2020/06/at%C4%B1k.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXERf7iI0FkLpn-I_qCbgKYQ9aSH-hF8VkJg&usqp=CAU"
  ];
  List<String> newImages = [
    "https://www.verpacking.com/media/image/product/39048/lg/cardboard-box-single-wall-300x200x170mm.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQLiCT_c8pfpT9Y0Pjs7eadIQW4gs3t17yxjiJ5fvBRMCubcDy0DjQggDw2JK5ErQLW4r8&usqp=CAU"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      floatingActionButton: floatingActionMethod(),
      bottomNavigationBar: bottomNavigationBarMethod(),
      appBar: appBarMethod(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            recycledNumberTextMethod(),
            carouselSlideMethod(),
            recommendedContainer(),
            activeOrderMethod(),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }

  Container activeOrderMethod() {
    return Container(
              margin: const EdgeInsets.only(left: 24, right: 24, top: 0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        alignment: Alignment.centerLeft,
                        child: const Text("Aktif Talebim",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold))),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.orange[100],
                        ),
                        width: Get.width,
                        child: Row(children: [
                          ClipRRect(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(8),
                                  bottomLeft: Radius.circular(8)),
                              child: Image.network(
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQQGq_vg7t4zd0C71aTOLSX8ta6U_enxDyMQA&usqp=CAU",
                                fit: BoxFit.fill,
                                height: 150,
                                width: 120,
                              )),
                          Container(
                            padding: const EdgeInsets.only(left: 8),
                            width: Get.width / 2,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    "Seçilen İtemler; plastik, kağıt, karton, demir",
                                    style: TextStyle(fontSize: 12)),
                                Divider(),
                                Text(
                                    "Adress; Orhan Gazi Mah. 1672. sok No:42/44"
                                            .substring(0, 20) +
                                        "...",
                                    style: TextStyle(fontSize: 12)),
                                Divider(),
                                Text("Alınma Tarihi: 15.12.2020",
                                    style: TextStyle(fontSize: 12)),
                                Divider(),
                                Text("Oluşturulma Tarihi: 15.12.2020",
                                    style: TextStyle(fontSize: 12)),
                              ],
                            ),
                          )
                        ]))
                  ]));
  }

  Container recommendedContainer() {
    return Container(
              margin: const EdgeInsets.all(24),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        alignment: Alignment.centerLeft,
                        child: const Text("Tavsiye Edilen",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold))),
                    const SizedBox(
                      height: 10,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(children: [
                        recommendedItemContainer(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSv-9at0_5dFtaGusjGE8tagkJN_35Ky8_iqQ&usqp=CAU",
                            "4.5",
                            "Karton Toplama",
                            "10 karton topla",
                            "1 gün"),
                        const SizedBox(
                          width: 16,
                        ),
                        recommendedItemContainer(
                            "https://www.storhub.com.sg/theme/images/articles/201902/5-Ways-to-Recycle-Old-Books-in-Singapore-2-1024x682.jpg",
                            "3.5",
                            "Kitaplar",
                            "30 kitap topla",
                            "2 gün"),
                        const SizedBox(
                          width: 16,
                        ),
                        recommendedItemContainer(
                            "https://www.combinedresources.us/wp-content/uploads/2016/03/shutterstock_686357065.jpg",
                            "4.0",
                            "Elektronik Aletler",
                            "12 elektronik alet topla",
                            "4 gün"),
                        const SizedBox(
                          width: 16,
                        ),
                        recommendedItemContainer(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQQGq_vg7t4zd0C71aTOLSX8ta6U_enxDyMQA&usqp=CAU",
                            "3.0",
                            "Karıştırılmış plastik",
                            "60 plastik topla",
                            "2 gün"),
                      ]),
                    )

                    // CarouselSlider(
                    //   options: CarouselOptions(
                    //       height: 180.0, viewportFraction: 0.40),
                    //   items: newImages.map((i) {
                    //     return Builder(
                    //       builder: (BuildContext context) {
                    //         return Container(
                    //             width: MediaQuery.of(context).size.width,
                    //             margin: const EdgeInsets.symmetric(
                    //                 horizontal: 5.0),
                    //             decoration: BoxDecoration(
                    //                 borderRadius: BorderRadius.circular(10),
                    //                 color: Colors.amber),
                    //             child: Image.network(i, fit: BoxFit.fill));
                    //       },
                    //     );
                    //   }).toList(),
                    // ),
                  ]));
  }

  CarouselSlider carouselSlideMethod() {
    return CarouselSlider(
            options: CarouselOptions(height: 120.0, viewportFraction: 0.8),
            items: images.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(),
                      // borderRadius: BorderRadius.circular(10)),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(i, fit: BoxFit.fill)));
                },
              );
            }).toList(),
          );
  }

  Container recycledNumberTextMethod() {
    return Container(
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
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                        width: 30,
                        height: 30,
                        child:
                            Image.asset('assets/images/recycle_image.png')),
                    const Text("30 item sayenizde geri dönüştürüldü.",
                        style: TextStyle(fontSize: 12)),
                    Container()
                  ]));
  }

  AppBar appBarMethod() {
    return AppBar(
      backgroundColor: Colors.grey[100],
      automaticallyImplyLeading: false,
      title: Container(
          alignment: Alignment.centerLeft,
          child:
              const Text('Ana Sayfa', style: TextStyle(color: Colors.black))),
      actions: [
        IconButton(
            icon: Icon(Icons.person, color: Colors.black),
            onPressed: () => Get.to(() => const UserProfile())),
      ],
    );
  }

  BottomNavigationBar bottomNavigationBarMethod() {
    return BottomNavigationBar(
      onTap: (i) => {
        if (i == 0)
          {Get.to(() => const UserHomePage())}
        else if (i == 1)
          {
            Get.to(() => const AllOrders())
          }
        else
          {Get.to(() => const LeaderBoard())}
      },
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Ana Sayfa',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.all_inbox_outlined),
          label: 'Tüm İlanlarım',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.leaderboard_rounded),
          label: 'Lider Tablosu',
        ),
      ],
    );
  }

  FloatingActionButton floatingActionMethod() {
    return FloatingActionButton(
      onPressed: () => Get.to(() => const SelectTypeAdvert()),
      child: const Icon(MdiIcons.recycle, size: 30),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }

  Container recommendedItemContainer(String image, String itemStar,
      String taskCaption, String taskDetail, String taskDay) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.orange[100],
        ),
        width: Get.width / 1.8,
        height: 200,
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16)),
                  child: Image.network(image, fit: BoxFit.cover),
                ),
                Positioned(
                    left: 150,
                    top: 0,
                    right: 0,
                    bottom: 100,
                    child: Row(
                      children: [
                        Icon(
                          Icons.stars,
                          color: Colors.yellow,
                        ),
                        Text(
                          itemStar,
                          // style: TextStyle(
                          //     color: Colors.yellow),
                        ),
                      ],
                    ))
              ],
            ),
            Divider(
              height: 0,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(taskCaption,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(taskDetail, style: TextStyle(fontSize: 10)),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.watch_later, size: 15),
                      Text(taskDay, style: TextStyle(fontSize: 10)),
                    ],
                  ),
                ],
              ),
            )
          ],
        ));
  }

  Iterable<Widget> get companyPosition sync* {
    for (String company in selectedCompanies) {
      yield SizedBox(
        width: 70,
        // height: 60,
        child: FilterChip(
          padding: const EdgeInsets.all(0),
          backgroundColor: Colors.tealAccent[200],
          // avatar: CircleAvatar(
          //   backgroundColor: Colors.cyan,
          //   // child: Text(
          //   //   company[0].toUpperCase(),
          //   //   style: TextStyle(color: Colors.white),
          //   // ),
          // ),

          label: Text(
            company,
          ),
          selected: true,
          selectedColor: Colors.purpleAccent,
          onSelected: (bool selected) {
            // setState(() {
            //   if (selected) {
            //     _filters.add(company);
            //   } else {
            //     _filters.removeWhere((String name) {
            //       return name == company;
            //     });
            //   }
            // });
          },
        ),
      );
    }
  }
}
