class UserModel {
  String? id;
  String? name;
  String? email;
  String? phone;
  String? role;
  String? locationName;
  String? token;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.role,
    this.locationName,
    this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> parsedJson) {
    return UserModel(
        id: parsedJson['_id'],
        name: parsedJson['name'],
        email: parsedJson['email'],
        phone: parsedJson['phone'],
        role: parsedJson['role'],
        locationName: parsedJson['locationName'],
        token: parsedJson['token']);
  }
}
