import 'package:flutter/material.dart';
import 'package:gebeta_food_delivery/models/Product.dart';
import 'package:gebeta_food_delivery/screens/customer/homeMainScreen.dart';
import 'package:gebeta_food_delivery/screens/customer/productScreen/components/productCard.dart';
import 'package:gebeta_food_delivery/screens/restaurant/addProductScreen/AddNewProducts.dart';
import 'package:gebeta_food_delivery/services/productService.dart';
import 'package:gebeta_food_delivery/utils/colors.dart';
import 'package:gebeta_food_delivery/widgets/customText.dart';


class ProductsScreen extends StatefulWidget {
  final category;
  const ProductsScreen({Key? key, this.category}) : super(key: key);

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
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
  // _showSnackBar(context, text) {
  //   ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
  //     content: new Text(text),
  //     duration: Duration(seconds: 3),
  //   ));
  // }

  // getProducts() async {
  //   var check = widget.category.name.toLowerCase() == 'all';
  //   // var category = check ? null : widget.category.name.toLowerCase();
  //   setState(() {
  //     loading = true;
  //   });
  //   products.clear();
  //   var res = await _productServices.getProductsByCategory(category);
  //   if (res == null) {
  //     _showSnackBar(context, 'Error getting product, please try again');
  //     setState(() {
  //       loading = false;
  //     });
  //     return;
  //   }
  //   List<Product> response = res;
  //   setState(() {
  //     products.clear();
  //     products.addAll(response);
  //     loading = false;
  //   });
  // }

  // @override
  // void initState() {
  //   getProducts();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
       title: CustomText(text: "REMAS ",fontSize: 24,fontWeight: FontWeight.bold,),
        leading: GestureDetector(
          onTap: (() => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => HomeMainScreen()) )),
          child: IconButton(
              onPressed: ()=>  HomeMainScreen(),
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black87,
                size: 25,
              )),
        ),
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
    );
  }
}

