import 'package:flutter/material.dart';
import 'package:gebeta_food_delivery/models/DeliveredProducts.dart';
import 'package:gebeta_food_delivery/models/Product.dart';
import 'package:gebeta_food_delivery/screens/customer/hotelMenuScreen/hotelMenuScreen.dart';
import 'package:gebeta_food_delivery/services/productService.dart';
import 'package:gebeta_food_delivery/widgets/customText.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {


   bool loading = false;
  ProductServices _productServices = ProductServices();
  List<Product> products = [];

getProducts()async {
  print("start");
      setState(() {
      loading = true;
    });
    products.clear();
    var res = await _productServices.getProducts();
    print(res);
    if (res == null) {
     // _showSnackBar(context, 'Error getting product, please try again');
      setState(() {
        loading = false;
      });
      return;
    }
     List<Product> response = res;
    print(response);
    setState(() {
      products.clear();
      products.addAll(response);
      loading = false;
    });
}
@override
  void initState() {
    getProducts();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: GestureDetector(
        // onTap: () => Navigator.push( 
        //     context,
        //     MaterialPageRoute(
        //         builder: ((BuildContext context) =>
        //              HotelMenuScreen(hotel: Hotel,)))),
        child: ListView.builder(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            itemBuilder: (_, i) {
              return Column(
                children: [
                  Container(
                    height: 100,
                    width: 120,
                    margin: const EdgeInsets.only(right: 10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image:  DecorationImage(
                          image: NetworkImage(products[i].images![0]),
                          fit: BoxFit.cover),
                    ),
                    
                  ),
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: CustomText(text: products[i].name!,fontWeight: FontWeight.bold,),
                   ),
                ],
              );
              
            }),
      ),
      // const Icon(Icons.wallpaper_rounded, size: 80, color: Colors.grey)
    );
  }
}
