import 'dart:convert';
import 'package:waste_product/models/orders_model.dart';
import 'package:waste_product/utils/request_helper.dart';

class OrderService {
  static Future<Orders> getAllOrders() async {
    try {
      var request = RequestHelper();
      final response = await request.get(
        request.url("order"),
      );
      print("response; ${jsonDecode(response.body)}" );
      return Orders.fromJson(jsonDecode(response.body));
    } catch (e) {
      print("error catch OrderService > getAllOrders$e");
      return null;
    }
  }
}
