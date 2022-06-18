import 'package:flutter/material.dart';
import 'package:gebeta_food_delivery/models/Hotel.dart';
import 'package:gebeta_food_delivery/screens/customer/homeMainScreen.dart';
import 'package:gebeta_food_delivery/screens/customer/searchScreen/components/searchResult.dart';
import 'package:gebeta_food_delivery/screens/customer/searchScreen/components/searchResultCard.dart';
import 'package:gebeta_food_delivery/services/userServices.dart';

class SearchHotelScreen extends StatefulWidget {
  const SearchHotelScreen({
    Key? key,
  }) : super(key: key);

  @override
  _SearchHotelScreenState createState() => _SearchHotelScreenState();
}

class _SearchHotelScreenState extends State<SearchHotelScreen> {
  UserServices _userServices = UserServices();
  List<HotelModel> hotels = [];
  bool loading = false;
  var search = '';

  searchHotel() async {
    if (search == '') return;
    setState(() {
      loading = true;
    });
    hotels.clear();
    var res = await _userServices.searchHotels(search);
    print(res);
    if (res == null) {
      setState(() {
        loading = false;
      });
      return;
    }
    hotels.clear();
    hotels.addAll(res);
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
                icon: Icon(Icons.arrow_back, color: Colors.grey.shade900),
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeMainScreen(),
                    )),
              ),
              title: TextFormField(
                initialValue: search,
                onChanged: (value) => setState(() {
                  search = value;
                }),
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 3, color: Colors.orangeAccent),
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
                    itemCount: hotels.length,
                    itemBuilder: (context, index) {
                      return SearchResultCard(hotel: hotels[index]);
                    })));
  }
}
