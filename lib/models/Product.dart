class Product {
  String? id;
  String? hotelName;
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
      this.hotelName,
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
        id: parsedJson['id'],
        hotelName: parsedJson['hotelName'],
        name: parsedJson['name'],
        description: parsedJson['description'],
        category: parsedJson['category'],
        price: parsedJson['price'],
        images: parsedJson['images'],
        created: parsedJson['created'],
        availability: parsedJson['availability'],
        status: parsedJson['status']);
  }
}
