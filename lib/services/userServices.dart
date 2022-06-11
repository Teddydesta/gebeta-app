import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:gebeta_food_delivery/models/UserModel.dart';
import 'package:gebeta_food_delivery/utils/locationUtils.dart';
import 'package:gebeta_food_delivery/services/common.dart';

import 'constants.dart';

class UserServices {
  CommonServices _commonServices = CommonServices();
  LocationUtils locationUtils = LocationUtils();
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Future saveToken(token, name, role, id) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setString('token', token);
    await prefs.setString('role', role);
    await prefs.setString('name', name);
    await prefs.setString('id', id);
    print(prefs.getString('token').toString());
    print(prefs.getString('role').toString());
    print(prefs.getString('name').toString());
    print(prefs.getString('id').toString());
    return;
  }

  Future registerUser({name, email, phone,  password}) async {
    // String locationName = 'Unknown';
    // var locationNameResult = await locationUtils.getReverseGeolocation(
    //     location['lat'], location['lng']);

    // if (locationNameResult['error'] == null)
    //   locationName = locationNameResult['locationName'];

    var body = {
      'name': name,
      'email': email,
      'phone': phone,
      'password': password,
      // 'locationName': locationName,
      'lat': "9.654",
       'lng': "34.68574"
    };
    var url = Uri.parse('$baseUrl/users');

print(body);

    var response = await http.post(url, body: body);

if(response != null){
print(response);
print(response.statusCode);
print(response.body);

    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 202) {
      var user = UserModel.fromJson(json.decode(response.body));
      await saveToken(user.token, user.name, user.role, user.id);

      return {'error': null, 'user': user};
    }
    return {'error': json.decode(response.body)['message'], 'user': null};

}
return {'error': json.decode(response.body)['message'], 'user': null};
  }

  Future registerHotel({name, email, phone, location, password}) async {
    // String locationName = 'Unknown';
    // var locationNameResult = await locationUtils.getReverseGeolocation(
    //     location['lat'], location['lng']);

    // if (locationNameResult['error'] == null)
    //   locationName = locationNameResult['locationName'];

    var body = {
      'name': name,
      'email': email,
      'phone': phone,
      'password': password,
      // 'locationName': locationName,
      // 'lat': location['lat'],
      // 'lng': location['lng']
    };
    var url = Uri.parse('$baseUrl/users/hotel');

    var response = await http.post(url, body: body);

    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 202) {
      var user = UserModel.fromJson(json.decode(response.body));
      await saveToken(user.token, user.name, user.role, user.id);

      return {'error': null, 'user': user};
    }

    return {'error': json.decode(response.body)['message'], 'user': null};
  }

  Future registerAdmin({name, email, phone, password}) async {
    var body = {
      'name': name,
      'email': email,
      'phone': phone,
      'password': password
    };
    
    var url = Uri.parse('$baseUrl/users/admin');

    var response = await http.post(url, body: body);

    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 202) {
      var user = UserModel.fromJson(json.decode(response.body));
      await saveToken(user.token, user.name, user.role, user.id);

      return {'error': null, 'user': user};
    }

    return {'error': json.decode(response.body)['message'], 'user': null};
  }

// Login Using email and password
  Future loginUser({email, password}) async {
    var body = {'email': email, 'password': password};
    var url = Uri.parse('$baseUrl/users/login');

    var response = await http.post(url, body: body);

    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 202) {
      var user = UserModel.fromJson(json.decode(response.body));
      await saveToken(user.token, user.name, user.role, user.id);

      return {'error': null, 'user': user};
    }

    return {'error': json.decode(response.body)['message'], 'user': null};
  }

// login via phone and password
  Future loginUser_Phone({phone, password}) async {
    var body = {'phone': phone, 'password': password};
    var url = Uri.parse('$baseUrl/users/login');

    var response = await http.post(url, body: body);

    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 202) {
      var user = UserModel.fromJson(json.decode(response.body));
      await saveToken(user.token, user.name, user.role, user.id);

      return {'error': null, 'user': user};
    }

    return {'error': json.decode(response.body)['message'], 'user': null};
  }

  Future logoutUser() async {
    final SharedPreferences prefs = await _prefs;

    if (prefs.containsKey('token')) {
      await prefs.remove('token');
      await prefs.remove('isFirstLaunch');
      return {'error': null};
    } else {
      return {'error': 'Token not found'};
    }
  }

  // Get User Profile
  Future getUserProfile() async {
    var token = await _commonServices.getToken();
    var uri = Uri.parse('$baseUrl/users/profile/');
    var response =
        await http.get(uri, headers: {'Authorization': 'Bearer $token'});

    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 202) {
      var user = UserModel.fromJson(json.decode(response.body));

      return {
        'error': null,
        'username': user.name,
        'phone': user.phone,
        'role': user.role,
        'email': user.email
      };
    }

    print(json.decode(response.body));
    return {'error': json.decode(response.body)['message'], 'user': null};
  }

// Update User Profile method
  Future updateProfile({
    name,
    email,
    phone,
  }) async {
    var token = await _commonServices.getToken();
    var uri = Uri.parse('$baseUrl/users/profile/update/:id');
    var body = {
      'name': name,
      'email': email,
      'phone': phone,
    };

    var response = await http
        .put(uri, body: body, headers: {'Authorization': 'Bearer $token'});
    print("Status Code: " + response.statusCode.toString());
    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 202) {
      var jsonResponse = await json.decode(response.body);
      var user = new UserModel.fromJson(jsonResponse);

      return user;
    }
    print('error : ${json.decode(response.body)}');
    return null;
  }

  // Phone check
  Future checkIfPhoneIsInUse({phone}) async {
    var body = {'phone': phone, };
    var url = Uri.parse('$baseUrl/users/checkPhone');

    var response = await http.post(url, body: body);
print(response.body);
    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 202) {

      return null;
    } else {
      return response.body;
    }

    return {'error': json.decode(response.body)['message'], 'user': null};
  }




  Future getNearbyHotel({lat,lng}) async {
    var body = {'lat':lat,'lng':lng};
    var url = Uri.parse('$baseUrl/users/hotels/nearby?lat=$lat&lng=$lng');


  var response = await http.get(url, );
     if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 202) {

      return json.decode(response.body);
    } else {
      return null;
    }

    return {'error': json.decode(response.body)['message'], 'user': null};
  }
}
