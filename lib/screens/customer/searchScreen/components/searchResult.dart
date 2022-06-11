import 'package:flutter/material.dart';
import 'package:gebeta_food_delivery/models/Hotel.dart';
import 'package:gebeta_food_delivery/screens/customer/searchScreen/components/searchResultCard.dart';


class SearchResult extends StatefulWidget {
  final List<HotelModel> hotels;
  SearchResult({Key? key, required, required this.hotels }) : super(key: key);

  @override
  _SearchResultState createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: ListView.builder(
          itemCount: widget.hotels.length,
          itemBuilder: (context, index) {
            return SearchResultCard(hotel: widget.hotels[index]);
          }),
    );
  }
}