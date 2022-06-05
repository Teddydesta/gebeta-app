class DeliveredProduct {
  String? locationName;
  int? price;
  List<String>? images;
  String? status;
  String? id;
  String? name;
  String? description;
  String? category;
  Hotel? hotel;
  Location? location;
  String? created;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? deliveryPerson;

  DeliveredProduct(
      {this.locationName,
      this.price,
      this.images,
      this.status,
      this.id,
      this.name,
      this.description,
      this.category,
      this.hotel,
      this.location,
      this.created,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.deliveryPerson});

  DeliveredProduct.fromJson(Map<String, dynamic> json) {
    locationName = json['locationName'];
    price = json['price'];
    images = json['images'].cast<String>();
    status = json['status'];
    id = json['_id'];
    name = json['name'];
    description = json['description'];
    category = json['category'];
    hotel = (json['hotel'] != null ? new Hotel.fromJson(json['hotel']) : null);
    location = (json['location'] != null
        ? new Location.fromJson(json['location'])
        : null)!;
    created = json['created'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    deliveryPerson = json['deliveryPerson'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['locationName'] = this.locationName;
    data['price'] = this.price;
    data['images'] = this.images;
    data['status'] = this.status;
    data['_id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['category'] = this.category;
    if (this.hotel != null) {
      data['hotel'] = this.hotel!.toJson();
    }
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    data['created'] = this.created;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['deliveryPerson'] = this.deliveryPerson;
    return data;
  }
}

class Hotel {
  String? status;
  String? locationName;
  String? role;
  String? sId;
  String? name;
  String? email;
  String? phone;
  Location? location;
  String? created;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Hotel(
      {this.status,
      this.locationName,
      this.role,
      this.sId,
      this.name,
      this.email,
      this.phone,
      this.location,
      this.created,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Hotel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    locationName = json['locationName'];
    role = json['role'];
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    location = (json['location'] != null
        ? new Location.fromJson(json['location'])
        : null)!;
    created = json['created'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['status'] = this.status;
    data['locationName'] = this.locationName;
    data['role'] = this.role;
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    data['created'] = this.created;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class Location {
  String? type;
  List<double>? coordinates;
  String? sId;

  Location({this.type, this.coordinates, this.sId});

  Location.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    coordinates = json['coordinates'].cast<double>();
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['coordinates'] = this.coordinates;
    data['_id'] = this.sId;
    return data;
  }
}
