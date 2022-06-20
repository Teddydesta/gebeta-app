// import 'package:flutter/material.dart';
// import 'package:gebeta_food_delivery/screens/restaurant/listProductScreen/ListProducts.dart';
// import 'package:gebeta_food_delivery/screens/restaurant/productScreen/productScreen.dart';

// import '../../../../models/Category.dart';


// class CategoryCardLarge extends StatelessWidget {
//   final Category category;
//   const CategoryCardLarge({Key? key, required this.category}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Container(
//       margin: EdgeInsets.all(10),
//       height: 110,
//       width: size.width * 0.8,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10),
//         boxShadow: [
//           BoxShadow(
//               color: Colors.black12,
//               spreadRadius: 2.5,
//               blurRadius: 10,
//               offset: Offset(0.0, 6.0))
//         ],
//       ),
//       child: ElevatedButton(
//           style: ButtonStyle(
//               elevation: MaterialStateProperty.all(1.5),
//               shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                   RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(18.0),
//               )),
//               overlayColor: MaterialStateProperty.all(
//                 Colors.grey.shade300,
//               ),
//               backgroundColor: MaterialStateProperty.all(
//                 Colors.grey.shade200,
//               )),
//           onPressed: () => Navigator.push(
//               context,
//               MaterialPageRoute(
//                   builder: (BuildContext context) => ProductScreen(
//                         category: category,
//                       ))),
//           child: Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Padding(
//                     padding: const EdgeInsets.all(10.0),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           category.name,
//                           style: TextStyle(
//                               color: Colors.grey.shade900, fontSize: 20),
//                         ),
//                         Text(
//                           category.description,
//                           style: TextStyle(color: Colors.grey.shade900),
//                         )
//                       ],
//                     )),
//                 Container(
//                     height: 150,
//                     width: 100,
//                     decoration: BoxDecoration(
//                       image: DecorationImage(
//                           image: NetworkImage(category.image),
//                           fit: BoxFit.cover),
//                       borderRadius: BorderRadius.circular(10),
//                     ))
//               ],
//             ),
//           )),
//     );
//   }
// }