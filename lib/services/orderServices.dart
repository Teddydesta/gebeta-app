import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:gebeta_food_delivery/services/common.dart';
import 'constants.dart';

class OrderServices {
  CommonServices _commonServices = CommonServices();
  OrderServices _orderServices = OrderServices();

  //Add order
  Future createOrderItems(body) async {
    var token = await _commonServices.getToken();
    var url = Uri.parse('$baseUrl/orders/');


    print(body);
    var response = await http.post(url,
        headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
        body: body);
    if (response != null) {
      print(response);
      print(response.statusCode);
      print(response.body);
      print("Token ${token}");
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 202) {}
    }
  }

  Future getOrderList() async {
    var token = await _commonServices.getToken();
    var url = Uri.parse('$baseUrl/orders/');

  }
}
