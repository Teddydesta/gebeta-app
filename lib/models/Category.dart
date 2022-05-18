class Category {
  String id;
  String name;
  String description;
  String icon;
  String image;

  Category({
    required this.id,
    required this.name,
    required this.description,
    required this.icon,
    required this.image,
  });
  factory Category.fromJson(Map<String, dynamic> parsedJson) {
    return Category(
        id: parsedJson['id'].toString(),
        name: parsedJson['name'],
        description: parsedJson['description'],
        icon: parsedJson['icon'],
        image: parsedJson['image']);
  }
}
