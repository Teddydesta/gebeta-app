class AdressModel {
  late int? _id;
  late String? _addressType;
  late String? _contactPersonName;
  late String _contactPresonNumber;
  late String _address;
  late String _latitude;
  late String _longitude;

  AdressModel({
    id,
    required addressType,
    contactPersonName,
    contactPersonNumber,
    address,
    latitude,
    longitude,
  }) {
    id = _id;
    _addressType = addressType;
    _contactPersonName = contactPersonName;
    _contactPresonNumber = contactPersonNumber;
    _address = address;
    _latitude = latitude;
    _longitude = longitude;
  }
  String get address => address;
  String get addressType => addressType;
  String? get contactPersonname => contactPersonname;
  String? get contactPersonnumber => contactPersonnumber;
}
