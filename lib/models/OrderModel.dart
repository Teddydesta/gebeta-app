
import 'dart:convert';
OrderModel orderModelFromJson(String str) => OrderModel.fromJson(json.decode(str));

String orderModelToJson(OrderModel data) => json.encode(data.toJson());
class OrderModel {
    OrderModel({
        this.totalPrice,
        this.items,
    });
    int? totalPrice;
    Items? items;
    factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        totalPrice: json["totalPrice"],
        items: Items.fromJson(json["items"]),
    );
    Map<String, dynamic> toJson() => {
        "totalPrice": totalPrice,
        "items": items!.toJson(),
    };
}

class Items {
    Items({
        this.id,
        this.user,
        this.products,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    String? id;
    String? user;
    List<ProductElement>? products;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;

    factory Items.fromJson(Map<String, dynamic> json) => Items(
        id: json["_id"],
        user: json["user"],
        products: List<ProductElement>.from(json["products"].map((x) => ProductElement.fromJson(x))),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "user": user,
        "products": List<dynamic>.from(products!.map((x) => x.toJson())),
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "__v": v,
    };
}

class ProductElement {
    ProductElement({
        this.product,
        this.quantity,
        this.name,
        this.price,
        this.id,
    });

    ProductProduct? product;
    int? quantity;
    String? name;
    int? price;
    String? id;

    factory ProductElement.fromJson(Map<String, dynamic> json) => ProductElement(
        product: ProductProduct.fromJson(json["product"]),
        quantity: json["quantity"],
        name: json["name"],
        price: json["price"],
        id: json["_id"],
    );

    Map<String, dynamic> toJson() => {
        "product": product!.toJson(),
        "quantity": quantity,
        "name": name,
        "price": price,
        "_id": id,
    };
}

class ProductProduct {
    ProductProduct({
        this.id,
        this.hotelName,
        this.name,
        this.description,
        this.category,
        this.locationName,
        this.location,
        this.price,
        this.images,
        this.availability,
        this.status,
        this.created,
        this.createdAt,
        this.updatedAt,
        this.v,

    });

    String? id;
    HotelName? hotelName;
    String? name;
    String? description;
    String? category;
    String? locationName;
    Location? location;
    int? price;
    List<String>? images;
    String? availability;
    String? status;
    DateTime? created;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;

    factory ProductProduct.fromJson(Map<String, dynamic> json) => ProductProduct(
        id: json["_id"],
        hotelName: HotelName.fromJson(json["hotelName"]),
        name: json["name"],
        description: json["description"],
        category: json["category"],
        locationName: json["locationName"],
        location: Location.fromJson(json["location"]),
        price: json["price"],
        images: List<String>.from(json["images"].map((x) => x)),
        availability: json["availability"],
        status: json["status"],
        created: DateTime.parse(json["created"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "hotelName": hotelName!.toJson(),
        "name": name,
        "description": description,
        "category": category,
        "locationName": locationName,
        "location": location!.toJson(),
        "price": price,
        "images": List<dynamic>.from(images!.map((x) => x)),
        "availability": availability,
        "status": status,
        "created": created!.toIso8601String(),
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "__v": v,
    };
}

class HotelName {
    HotelName({
        this.id,
        this.name,
        this.email,
        this.telegram,
        this.description,
        this.images,
        this.password,
        this.phone,
        this.locationName,
        this.role,
        this.location,
        this.created,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    String? id;
    String? name;
    String? email;
    String? telegram;
    String? description;
    List<String>? images;
    String? password;
    String? phone;
    String? locationName;
    String? role;
    Location? location;
    DateTime? created;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;

    factory HotelName.fromJson(Map<String, dynamic> json) => HotelName(
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        telegram: json["telegram"],
        description: json["description"],
        images: List<String>.from(json["images"].map((x) => x)),
        password: json["password"],
        phone: json["phone"],
        locationName: json["locationName"],
        role: json["role"],
        location: Location.fromJson(json["location"]),
        created: DateTime.parse(json["created"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "email": email,
        "telegram": telegram,
        "description": description,
        "images": List<dynamic>.from(images!.map((x) => x)),
        "password": password,
        "phone": phone,
        "locationName": locationName,
        "role": role,
        "location": location!.toJson(),
        "created": created!.toIso8601String(),
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "__v": v,
    };
}

class Location {
    Location({
        this.type,
        this.coordinates,
        this.id,
    });

    String? type;
    List<double>? coordinates;
    String? id;

    factory Location.fromJson(Map<String, dynamic> json) => Location(
        type: json["type"],
        coordinates: List<double>.from(json["coordinates"].map((x) => x.toDouble())),
        id: json["_id"],
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "coordinates": List<dynamic>.from(coordinates!.map((x) => x)),
        "_id": id,
    };
}
