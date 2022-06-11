import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:waste_product/models/orders_model.dart';
import 'package:waste_product/services/orders_services.dart';

class Order {
  final String name;
  final String image;
  final String address;

  Order(this.name, this.image, this.address);
}

class AllOrders extends StatefulWidget {
  const AllOrders({Key key}) : super(key: key);

  @override
  State<AllOrders> createState() => _AllOrderState();
}

class _AllOrderState extends State<AllOrders> {
  List<Order> _orders = [
    Order(
        "Plastik, karton, karton",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQQGq_vg7t4zd0C71aTOLSX8ta6U_enxDyMQA&usqp=CAU",
        "Adress; Orhan Gazi Mah. 1672. sok No:42/44"),
    Order(
        "Plastik, karton, karton",
        "https://www.combinedresources.us/wp-content/uploads/2016/03/shutterstock_686357065.jpg",
        "Adress; Orhan Gazi Mah. 1672. sok No:42/44"),
    Order(
        "Pil, Elektronik alet",
        "https://www.storhub.com.sg/theme/images/articles/201902/5-Ways-to-Recycle-Old-Books-in-Singapore-2-1024x682.jpg",
        "Adress; Orhan Gazi Mah. 1672. sok No:42/44"),
    Order(
        "Plastik, karton, karton",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSv-9at0_5dFtaGusjGE8tagkJN_35Ky8_iqQ&usqp=CAU",
        "Adress; Orhan Gazi Mah. 1672. sok No:42/44"),
  ];

  List<Data> orders;

  Future<void> deleteOrder(_id) async {
    await OrderService.closeOrder(_id);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllOrdersFunction();
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
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () => Get.back(),
        ),
        backgroundColor: Colors.white,
        title:
            const Text('Tüm İlanlarım', style: TextStyle(color: Colors.black)),
      ),
      body: /* orders != null
          ? orders.isNotEmpty
              ? */
          SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: Get.height / 36,
            ),
            SizedBox(
              height: Get.height,
              child: ListView.separated(
                itemCount: _orders.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          _orders[index].image,
                          fit: BoxFit.fill,
                          height: 50,
                        )),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                _orders[index].name.length > 20
                                    ? _orders[index].name.substring(0, 20) +
                                        "..."
                                    : _orders[index].name,
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold)),
                            Text(
                                _orders[index].address.length > 28
                                    ? _orders[index].address.substring(0, 28) +
                                        "..."
                                    : _orders[index].address,
                                style: TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.w300)),
                          ],
                        ),
                      ],
                    ),
                    trailing: IconButton(
                      onPressed: () => deleteOrder(6),
                      icon: const Icon(
                        MdiIcons.trashCanOutline,
                        color: Colors.red,
                        size: 20,
                      ),
                    ),
                  );
                },
                separatorBuilder: (_, __) => Divider(),
              ),
            )
          ],
        ),
      )
      /* : Container(child: Text("no data for orders"))
          : const Center(child: CircularProgressIndicator()) */
      ,
    );
  }
}
