// To parse this JSON data, do
//
//     final hotelModel = hotelModelFromJson(jsonString);

import 'dart:convert';

HotelModel hotelModelFromJson(String str) => HotelModel.fromJson(json.decode(str));

String hotelModelToJson(HotelModel data) => json.encode(data.toJson());

class HotelModel {
    HotelModel({
        this.id,
        this.name,
        this.email,
        this.telegram,
        this.description,
        this.images,
        this.role,
        this.password,
        this.phone,
        this.locationName,
        this.location,
        this.created,
    });

    String? id;
    String? name;
    String? email;
    String? telegram;
    String? description;
    List<dynamic>? images;
    String? role;
    String? password;
    String? phone;
    String? locationName;
    Location? location;
    DateTime? created;

    factory HotelModel.fromJson(Map<String, dynamic> json) => HotelModel(
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        telegram: json["telegram"],
        description: json["description"],
        images: List<dynamic>.from(json["images"].map((x) => x)),
        role: json["role"],
        password: json["password"],
        phone: json["phone"],
        locationName: json["locationName"],
        location: Location.fromJson(json["location"]),
        created: DateTime.parse(json["created"]),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "email": email,
        "telegram": telegram,
        "description": description,
        "images": List<dynamic>.from(images!.map((x) => x)),
        "role": role,
        "password": password,
        "phone": phone,
        "locationName": locationName,
        "location": location!.toJson(),
        "created": created!.toIso8601String(),
    };
}

class Location {
    Location({
        this.coordinates,
        this.calculated,
    });

    List<double>? coordinates;
    double? calculated;

    factory Location.fromJson(Map<String, dynamic> json) => Location(
        coordinates: List<double>.from(json["coordinates"].map((x) => x.toDouble())),
        calculated: json["calculated"] == null ? 0.0 :json["calculated"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "coordinates": List<dynamic>.from(coordinates!.map((x) => x)),
        "calculated": calculated,
    };
}
