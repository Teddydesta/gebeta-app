class Cart {
  String productID;
  String quantity;
  

  Cart({
    required this.productID,
    required this.quantity,
   
  });
  factory Cart.fromJson(Map<String, dynamic> parsedJson) {
    return Cart(
        productID: parsedJson['_id'].toString(),
        quantity: parsedJson['quantity'],);
        
  }
}