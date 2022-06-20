import 'package:flutter/material.dart';
import 'package:gebeta_food_delivery/models/Hotel.dart';
import 'package:gebeta_food_delivery/models/Product.dart';
import 'package:gebeta_food_delivery/screens/restaurant/listProductScreen/components/productCard.dart';
import 'package:gebeta_food_delivery/services/productService.dart';
import 'package:gebeta_food_delivery/utils/colors.dart';
import 'package:gebeta_food_delivery/widgets/customText.dart';


class ListProductScreen extends StatefulWidget {
  final HotelModel hotel;
  final category;
  const ListProductScreen({Key? key, this.category, required this.hotel}) : super(key: key);

  @override
  State<ListProductScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ListProductScreen> {
  bool loading = false;
  ProductServices _productServices = ProductServices();
  List<Product> products = [];
List<HotelModel> hotel=[];


getResturantProduct() async {
    print("start");
    setState(() {
      loading = true;
    });
    products.clear();
   // var res = await _productServices.getProducts(widget.hotel.id);
   var res = await _productServices.getResturantsProducts(widget.hotel.id);
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
    getResturantProduct();
    super.initState();
  }
// getProducts()async {
//   print("start");
//       setState(() {
//       loading = true;
//     });
//     products.clear();
//     var res = await _productServices.getProducts();
//     print(res);
//     if (res == null) {
//      // _showSnackBar(context, 'Error getting product, please try again');
//       setState(() {
//         loading = false;
//       });
//       return;
//     }
//      List<Product> response = res;
//     print(response);
//     setState(() {
//       products.clear();
//       products.addAll(response);
//       loading = false;
//     });
// }
deleteProducts() async{
print("start");
      setState(() {
      loading = true;
    });
    
    
}

 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: true,
         title: CustomText(text: "PRODUCTS",fontSize: 24,fontWeight: FontWeight.bold,),
          
        ),
        body: loading
            ? Center(
                child: Container(
                  height: 50,
                  width: 50,
                  child: CircularProgressIndicator(
                    color: AppColors.orange,
                  ),
                ),
              )
            : Container(
                color: Colors.white,
                child: GridView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) => ProductCard(
                    product: products[index],
                  ),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1,
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 5),
                ),
              ),
      ),
    );
  }
}

