import 'package:shared_preferences/shared_preferences.dart';

class CommonServices {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future getRole() async {
    final SharedPreferences prefs = await _prefs;
    var role = await prefs.getString('role').toString();
    return role;
  }

  Future getName() async {
    final SharedPreferences prefs = await _prefs;
    var name = await prefs.getString('name').toString();
    return name;
  }

  

  Future getToken() async {
    final SharedPreferences prefs = await _prefs;
    var token = await prefs.getString('token').toString();
    return token;
  }

  Future getId() async {
    final SharedPreferences prefs = await _prefs;
    var token = await prefs.getString('id').toString();
    return token;
  }

  Future saveToken(token) async {
    final SharedPreferences prefs = await _prefs;
    var role = await prefs.setString("token", token).toString();
    return role;
  }

    Future saveName(name) async {
    final SharedPreferences prefs = await _prefs;
    var role = await prefs.setString("name", name).toString();
    return role;
  }


}
