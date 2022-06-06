import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:gebeta_food_delivery/models/DeliveredProducts.dart';
import 'package:gebeta_food_delivery/models/Product.dart';
import 'package:gebeta_food_delivery/services/common.dart';
import 'package:gebeta_food_delivery/utils/locationUtils.dart';

import 'constants.dart';

class ProductServices {
  CommonServices _commonServices = CommonServices();
  LocationUtils locationUtils = LocationUtils();

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
    var locationNameResult = await locationUtils.getReverseGeolocation(
        location['lat'], location['lng']);

    if (locationNameResult['error'] == null)
      locationName = locationNameResult['locationName'];

    List<http.MultipartFile> imagesMultipart = [];
    var uri = Uri.parse('$baseUrl/products/');
    var request = http.MultipartRequest('POST', uri);
    request.fields['name'] = name;
    request.fields['description'] = description;
    request.fields['price'] = price;
    request.fields['category'] = category;
    request.fields['locationName'] = locationName;
    request.fields['lat'] = location['lat'];
    request.fields['lng'] = location['lng'];
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
    final respStr = await response.stream.bytesToString();
    var jsonResponse = await json.decode(respStr);
    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 202) {
      var products = new Product.fromJson(jsonResponse);

      return {'error': false, 'result': products};
    }

    return {'error': true, 'result': jsonResponse['message']};
  }

  Future updateProduct(
      {name,
      description,
      price,
      category,
      location,
      images,
      imagesLinks,
      sellerid,
      productId}) async {
    var token = await _commonServices.getToken();

    String locationName = 'Unknown';
    var locationNameResult = await locationUtils.getReverseGeolocation(
        location['lat'], location['lng']);

    if (locationNameResult['error'] == null)
      locationName = locationNameResult['locationName'];
    print(imagesLinks);
    String concatImageLinks = '';
    if (imagesLinks.length > 0) {
      concatImageLinks = imagesLinks.join(',');
    }

    List<http.MultipartFile> imagesMultipart = [];
    var uri = Uri.parse('$baseUrl/products/update/$productId');
    var request = http.MultipartRequest('POST', uri);
    request.fields['name'] = name;
    request.fields['description'] = description;
    request.fields['price'] = price;
    request.fields['imagesLinks'] = concatImageLinks;
    request.fields['category'] = category;
    request.fields['sellerid'] = sellerid;
    request.fields['locationName'] = locationName;
    request.fields['lat'] = location['lat'];
    request.fields['lng'] = location['lng'];
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
}
