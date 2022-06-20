import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:gebeta_food_delivery/models/Product.dart';
import 'package:gebeta_food_delivery/services/common.dart';
import 'package:gebeta_food_delivery/utils/locationUtils.dart';

import 'constants.dart';

class ProductServices {
  CommonServices _commonServices = CommonServices();
  LocationUtils locationUtils = LocationUtils();

//Delete Product
  Future deletProduct({productID}) async {
    var uri = Uri.parse('$baseUrl/products/:id');
    var token = await _commonServices.getToken();
    print("token::$token");

    var response = await http.delete(
      uri,
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
    );
    print('response : ${response.body}');
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

  Future getHotelOWnProduct() async {
    var uri = Uri.parse('$baseUrl/products/resturant/product');
    print(uri);

    var token = await _commonServices.getToken();
    var response = await http.get(
      uri,
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
    );
    print('response : ${response.body}');
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

  Future getResturantsProducts(id) async {
    var uri = Uri.parse('$baseUrl/products/resturant/$id');
    var response = await http.get(uri);

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

  Future getProducts() async {
    var uri = Uri.parse('$baseUrl/products');

    var response = await http.get(uri);
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

//search products
  Future searchProducts(name) async {
    var uri = Uri.parse('$baseUrl/products/search?name=$name');

    var response = await http.get(uri);

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

  Future getProductsByCategory(category) async {
    var uri;

    if (category == null) {
      uri = Uri.parse('$baseUrl/products');
    } else {
      uri = Uri.parse('$baseUrl/products/category/?category=$category');
    }

    var response = await http.get(uri);
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

  Future addProduct(
      {name, description, price, category, location, images}) async {
    var token = await _commonServices.getToken();

    String locationName = 'Unknown';
    // var locationNameResult = await locationUtils.getReverseGeolocation(
    //     location['lat'], location['lng']);

    // if (locationNameResult['error'] == null)
    //   locationName = locationNameResult['locationName'];
    print(token);
    List<http.MultipartFile> imagesMultipart = [];
    var uri = Uri.parse('$baseUrl/products/add');
    var request = http.MultipartRequest('POST', uri);
    request.fields['name'] = name;
    request.fields['description'] = description;
    request.fields['price'] = price;
    request.fields['category'] = category;
    request.fields['locationName'] = locationName;
    request.headers.addAll({'Authorization': 'Bearer $token'});

    for (String imagePath in images) {
      var image = await http.MultipartFile.fromPath(
        'images',
        imagePath,
      );
      imagesMultipart.add(image);
    }
    request.files.addAll(imagesMultipart);

    print(uri);
    var response = await request.send();
    print(response);
    final respStr = await response.stream.bytesToString();
    print(respStr);
    var jsonResponse = await json.decode(respStr);
    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 202) {
      var products = new Product.fromJson(jsonResponse);

      return {'error': false, 'result': products};
    }

    return {'error': true, 'result': jsonResponse['message']};
  }

//Update product
  Future updateProduct(
      {name, description, price, category, images, productId}) async {
    var token = await _commonServices.getToken();
    print(token);
    print(token);
    List<http.MultipartFile> imagesMultipart = [];
    var uri = Uri.parse('$baseUrl/products/:id');
    var request = http.MultipartRequest('PUT', uri);
    request.fields['name'] = name;
    request.fields['description'] = description;
    request.fields['price'] = price;
    request.fields['category'] = category;
    request.headers.addAll({'Authorization': 'Bearer $token'});

    for (String imagePath in images) {
      var image = await http.MultipartFile.fromPath(
        'images',
        imagePath,
      );
      imagesMultipart.add(image);
    }
    request.files.addAll(imagesMultipart);

    var response = await request.send();
    print(response);

    final respStr = await response.stream.bytesToString();

    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 202) {
      var jsonResponse = await json.decode(respStr);
      var products = new Product.fromJson(jsonResponse);

      return products;
    }
    print('error : ${json.decode(respStr)}');
    return null;
  }
//Delete Product

}
