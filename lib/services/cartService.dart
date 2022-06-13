import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:gebeta_food_delivery/models/Product.dart';
import 'package:gebeta_food_delivery/services/common.dart';
import 'package:gebeta_food_delivery/services/constants.dart';

import 'package:http/http.dart' as http;

class CartServices {
  CommonServices _commonServices = CommonServices();

Future getCartItems() async {
    var uri = Uri.parse('$baseUrl/cart/get');
    var token = await _commonServices.getToken();

    var response = await http.get(uri,headers: {
          HttpHeaders.authorizationHeader: "Bearer $token"
        },);

    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 202) {
      List jsonResponse = json.decode(response.body);
      var products =
          jsonResponse.map((product) => new Product.fromJson(product)).toList();

      return products;
    }
    print(json.decode(response.body)['message']);
    return null;
  }

  Future addFoodToCart({productID, quantity}) async {
    var token = await _commonServices.getToken();
    var url = Uri.parse('$baseUrl/cart/add');

    var body = {
      'productID': productID,
      'quantity': '1',
    };
    //  request.headers.addAll({'Authorization': 'Bearer $token'});

    print(body);
    var response = await http.post(url,
        headers: {
          HttpHeaders.authorizationHeader: "Bearer $token"
        },
        body: body);

    if (response != null) {
      print(response);
      print(response.statusCode);
      print(response.body);
      print("Token ${token}");
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 202) {
        // var user = Cart.fromJson(json.decode(response.body));
        //await saveToken(user.token, user.name, user.role, user.id);

      }
    }
  }

//

}
