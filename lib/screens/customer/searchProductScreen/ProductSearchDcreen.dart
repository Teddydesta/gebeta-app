
import 'package:flutter/material.dart';
import 'package:gebeta_food_delivery/models/Product.dart';
import 'package:gebeta_food_delivery/screens/customer/searchProductScreen/components/searchResultCard.dart';
import 'package:gebeta_food_delivery/services/userServices.dart';

class SearchProductScreen extends StatefulWidget {
  const SearchProductScreen({Key? key,}) : super(key: key);

  @override
  _SearchProductScreenState createState() => _SearchProductScreenState();
}

class _SearchProductScreenState extends State<SearchProductScreen> {
  UserServices _userServices = UserServices();
    List<Product> products = [];
  bool loading = false;
  var search = '';

  searchHotel() async {
    if(search == '') return;
    setState(() {
      loading = true;
    });
    products.clear();
    var res = await _userServices.searchHotels(search);
    print(res);
    if (res == null) {
      setState(() {
        loading = false;
      });
      return;
    }
    products.clear();
    products.addAll(res);
    setState(() {
      loading = false;
    });
  }
  @override
  void initState() {
   

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: Container(
          margin: const EdgeInsets.only(top: 15.0),
          child: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.5,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.grey.shade900),
              onPressed: () => Navigator.pop(context),
            ),
            title: TextFormField(
              initialValue: search,
              onChanged: (value) => setState(() {
                search = value;
              }),
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 3, color: Colors.orangeAccent),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 1, color: Colors.grey.shade500),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: 'Search',
                  suffixIcon: IconButton(
                      onPressed: () => searchHotel(),
                      icon: Icon(
                        Icons.search,
                        color: Colors.grey.shade800,
                      ))),
            ),
          ),
        ),
      ),
      body: loading
          ? Center(
              child: Container(
                height: 50,
                width: 50,
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
            )
          : Container(
      padding: EdgeInsets.only(top: 10),
      child: ListView.builder(
          itemCount:  products.length,
          itemBuilder: (context, index) {
            return SearchResultCard(product: products[index]);
          }))
    
  );}
}