import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waste_product/models/orders_model.dart';
import 'package:waste_product/services/order/get_orders.dart';

class Advert {
  final String name;
  final String image;
  final String address;

  Advert(this.name, this.image, this.address);
}

class AllAdverts extends StatefulWidget {
  const AllAdverts({Key key}) : super(key: key);

  @override
  State<AllAdverts> createState() => _AllAdvertsState();
}

class _AllAdvertsState extends State<AllAdverts> {
  List<Advert> adverts = [
    Advert(
        "Plastik, karton, karton",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQQGq_vg7t4zd0C71aTOLSX8ta6U_enxDyMQA&usqp=CAU",
        "Adress; Orhan Gazi Mah. 1672. sok No:42/44"),
    Advert(
        "Plastik, karton, karton",
        "https://www.combinedresources.us/wp-content/uploads/2016/03/shutterstock_686357065.jpg",
        "Adress; Orhan Gazi Mah. 1672. sok No:42/44"),
    Advert(
        "Timur",
        "https://www.storhub.com.sg/theme/images/articles/201902/5-Ways-to-Recycle-Old-Books-in-Singapore-2-1024x682.jpg",
        "Adress; Orhan Gazi Mah. 1672. sok No:42/44"),
    Advert(
        "Plastik, karton, karton",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSv-9at0_5dFtaGusjGE8tagkJN_35Ky8_iqQ&usqp=CAU",
        "Adress; Orhan Gazi Mah. 1672. sok No:42/44"),
  ];

  List<Data> orders;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future<void> getAllOrdersFunction() async {
    Orders response = await OrderService.getAllOrders();
    setState(() {
      if (response != null) {
        orders = response.data;
      } else {
        orders = [];
      }
    });
  }

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
        title: const Text('Tüm İlanlarım', style: TextStyle(color: Colors.black)),
      ),
      body: orders != null
          ? orders.isNotEmpty
              ? SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: Get.height / 36,
                      ),
                      SizedBox(
                        height: Get.height,
                        child: ListView.separated(
                          itemCount: adverts.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                              leading: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.network(
                                    adverts[index].image,
                                    fit: BoxFit.fill,
                                    height: 50,
                                  )),
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(adverts[index].name,
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold)),
                                      Text(adverts[index].address,
                                          style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w300)),
                                    ],
                                  ),
                                ],
                              ),
                              // trailing: Column(
                              //   mainAxisAlignment: MainAxisAlignment.center,
                              //   children: [
                              //     Text(people[index].points.toString(),
                              //         style: TextStyle(
                              //             fontSize: 14, fontWeight: FontWeight.bold)),
                              //     Text("Puan",
                              //         style: TextStyle(
                              //             fontSize: 10, fontWeight: FontWeight.w300))
                              //   ],
                              // ),
                            );
                          },
                          separatorBuilder: (_, __) => Divider(),
                        ),
                      )
                    ],
                  ),
                )
              : Container(child: Text("no data for orders"))
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
