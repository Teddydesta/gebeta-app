import 'package:gebeta_food_delivery/models/Hotel.dart';

class Product {
  String? id;
  // HotelModel? hotelName;
  String? name;
  String? description;
  String? category;
  String? price;
  List? images;
  String? created;
  String? availability;
  String? status;

  Product(
      {this.id,
      // this.hotelName,
      this.name,
      this.description,
      this.category,
      this.price,
      this.images,
      this.created,
      this.availability,
      this.status});

  factory Product.fromJson(Map<String, dynamic> parsedJson) {
    return Product(
        id: parsedJson['_id'],
        // hotelName: parsedJson['hotelName'],
        name: parsedJson['name'],
        description: parsedJson['description'],
        category: parsedJson['category'],
        price: parsedJson['price'].toString(),
        images: parsedJson['images'],
        created: parsedJson['created'],
        availability: parsedJson['availability'],
        status: parsedJson['status']);
  }

  Map<String, dynamic> toJson() => {
        "_id": id,
        // "hotelName": hotelName!.toJson(),
        "name": name,
        "description": description,
        "category": category,
        "images": List<dynamic>.from(images!.map((x) => x)),
        "price": price,
        "availability": availability,
        "status": status,
        "created": created,
    };
}
