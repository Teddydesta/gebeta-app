import 'dart:async';
import 'dart:convert';
import 'package:gebeta_food_delivery/screens/utils/locationUtils.dart';
import 'package:http/http.dart' as http;
import 'package:gebeta_food_delivery/services/common.dart';
import 'package:gebeta_food_delivery/models/Category.dart';
import 'constants.dart';

class CategoryServices {
  CommonServices _commonServices = CommonServices();
  LocationUtils locationUtils = LocationUtils();

  Future getCategories() async {
    var uri = Uri.parse('$baseUrl/category');

    var response = await http.get(uri);

    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 202) {
      List jsonResponse = json.decode(response.body);
      var categories = jsonResponse
          .map((category) => new Category.fromJson(category))
          .toList();
      print(json.decode(response.body));
      return categories;
    }
    print(json.decode(response.body)['message']);
    return null;
  }

  Future getCategoryByName(name) async {
    var uri = Uri.parse('$baseUrl/category/search?name=$name');

    var response = await http.get(uri);

    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 202) {
      List jsonResponse = json.decode(response.body);
      var categoryName = jsonResponse
          .map((searchedCategory) => new Category.fromJson(searchedCategory))
          .toList();

      return categoryName;
    }
    print(json.decode(response.body)['message']);
    return null;
  }

  Future deleteCategoryByName(name) async {
    var uri = Uri.parse('$baseUrl/category/delete?name=$name');

    var response = await http.get(uri);

    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 202) {
      List jsonResponse = json.decode(response.body);
      var categoryName = jsonResponse
          .map((deletedCategory) => Category.fromJson(deletedCategory))
          .toList();

      return categoryName;
    }
    print(json.decode(response.body)['message']);
    return null;
  }

  Future addCategory({name, description, icons}) async {
    var token = await _commonServices.getToken();
    List<http.MultipartFile> iconsMultipart = [];
    var uri = Uri.parse('$baseUrl/category/add');
    var request = http.MultipartRequest('POST', uri);
    request.fields['name'] = name;
    request.fields['description'] = description;
    request.headers.addAll({'Authorization': 'Bearer $token'});

    for (String iconPath in icons) {
      var icon = await http.MultipartFile.fromPath(
        'icons',
        iconPath,
      );
      iconsMultipart.add(icon);
    }
    request.files.addAll(iconsMultipart);
    var response = await request.send();
    final respStr = await response.stream.bytesToString();
    var jsonResponse = await json.decode(respStr);
    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 202) {
      var categories = Category.fromJson(jsonResponse);

      return {'error': false, 'result': categories};
    }

    return {'error': true, 'result': jsonResponse['message']};
  }

  Future updateCategory(
      {name, description, icons, iconLinks, categoryID}) async {
    var token = await _commonServices.getToken();

    print(iconLinks);
    String concatIconLinks = '';
    if (iconLinks.length > 0) {
      concatIconLinks = iconLinks.join(',');
    }

    List<http.MultipartFile> iconsMultipart = [];
    var uri = Uri.parse('$baseUrl/product/update/$categoryID');
    var request = http.MultipartRequest('POST', uri);
    request.fields['name'] = name;
    request.fields['description'] = description;
    request.fields['iconsLinks'] = concatIconLinks;
    request.headers.addAll({'Authorization': 'Bearer $token'});

    for (String iconPath in icons) {
      var icon = await http.MultipartFile.fromPath(
        'icons',
        iconPath,
      );
      iconsMultipart.add(icon);
    }
    request.files.addAll(iconsMultipart);
    var response = await request.send();
    final respStr = await response.stream.bytesToString();

    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 202) {
      var jsonResponse = await json.decode(respStr);
      var products = Category.fromJson(jsonResponse);

      return products;
    }
    print('error : ${json.decode(respStr)}');
    return null;
  }
}
