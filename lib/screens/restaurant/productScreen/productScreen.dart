import 'package:flutter/material.dart';
import 'package:gebeta_food_delivery/models/Hotel.dart';
import 'package:gebeta_food_delivery/models/Product.dart';
import 'package:gebeta_food_delivery/screens/restaurant/HomeScreen.dart';
import 'package:gebeta_food_delivery/screens/restaurant/productScreen/components/productCard.dart';
import 'package:gebeta_food_delivery/screens/restaurant/updateProdutScreen/components/updateProductButton.dart';
import 'package:gebeta_food_delivery/services/productService.dart';
import 'package:gebeta_food_delivery/widgets/customText.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  bool loading = false;
  ProductServices _productServices = ProductServices();
  List<Product> products = [];
  List<HotelModel> hotels = [];

  getRestaurantOwnProduct() async {
    print("start");
    setState(() {
      loading = true;
    });
    products.clear();
    var res = await _productServices.getHotelOWnProduct();
    if (res == null) {
      // _showSnackBar(context, 'Error getting product, please try again');
      setState(() {
        loading = false;
      });
      return;
    }
    List<Product> response = res;
    setState(() {
      products.clear();
      products.addAll(response);
      loading = false;
    });
  }

  //Delete Product from the list

  deleteProduct(String? id) async {
    print("start");
    setState(() {
      loading = false;
    });

    var res = await _productServices.deletProduct();
    print(res);
  }

  @override
  void initState() {
    getRestaurantOwnProduct();
    super.initState();
  }
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        title: CustomText(
          text: "PRODUCTS",
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        automaticallyImplyLeading: false,
        
      ),
      body: loading
          ? Center(
              child: Container(
                height: 50,
                width: 50,
                child: CircularProgressIndicator(
                  color: Color.fromARGB(255, 56, 50, 45),
                ),
              ),
            )
          : 
              Container(
                color: Colors.white,
                child: GridView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) => GestureDetector(
                    
                    child: ProductCard(
                      product: products[index],
                    ),
                  ),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1,
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 5),
                ),
              
            ),
    );
  }
}


