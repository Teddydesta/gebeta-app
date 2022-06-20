// import 'package:flutter/material.dart';
// import 'package:gebeta_food_delivery/screens/customer/categoryScreen/components/categoryCardLarge.dart';
// import 'package:gebeta_food_delivery/services/categoryService.dart';

// import '../../../../models/Category.dart';


// class CategoryScreenNav extends StatefulWidget {
//   const CategoryScreenNav({Key? key}) : super(key: key);

//   @override
//   _CategoryScreenNavState createState() => _CategoryScreenNavState();
// }

// class _CategoryScreenNavState extends State<CategoryScreenNav> {
//   CategoryServices _categoryServices = CategoryServices();
//   List<Category> categories = [];
//   bool loading = false;

//   _showSnackBar(context, text) {
//     ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
//       content: new Text(text),
//       duration: Duration(seconds: 3),
//     ));
//   }

//   getCategories() async {
//     setState(() {
//       loading = true;
//     });
//     var res = await _categoryServices.getCategories();
//     if (res == null) {
//       _showSnackBar(context, 'Error getting categories, please try again');
//       setState(() {
//         loading = false;
//       });
//       return;
//     }
//     List<Category> categoryRes = [];
//     categoryRes.addAll(res);
//     categories.clear();
//     categories.addAll(categoryRes);
//     setState(() {
//       loading = false;
//     });
//   }

//   @override
//   void initState() {
//     getCategories();
//     //categories = categoriesList;
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return loading
//         ? Center(
//             child: Container(
//               height: 50,
//               width: 50,
//               child: CircularProgressIndicator(
//                 color: Colors.black,
//               ),
//             ),
//           )
//         : Container(
//             child: ListView.builder(
//             itemCount: categories.length,
//             itemBuilder: (BuildContext context, int index) {
//               return CategoryCardLarge(
//                 category: categories[index],
//               );
//             },
//           ));
//   }
// }