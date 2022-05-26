import 'package:flutter/material.dart';
import 'package:gebeta_food_delivery/screens/restaurant/Category/CategoryPage.dart';
import 'package:gebeta_food_delivery/utils/colors.dart';
import 'package:gebeta_food_delivery/widgets/customText.dart';

class AddCategoryPage extends StatefulWidget {
  static const routeName = "/AddCategoryPage";
  const AddCategoryPage({Key? key}) : super(key: key);

  @override
  _AddCategoryPageState createState() => _AddCategoryPageState();
}

class _AddCategoryPageState extends State<AddCategoryPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const CustomText(
          text: 'Add Category',
          color: Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
        leadingWidth: 80,
        leading: InkWell(
          onTap: () {
            Navigator.of(context)
                .pushReplacementNamed(CategoriesScreen.routeName);
          },
          child: GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: ((BuildContext context) =>
                        const CategoriesScreen()))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.arrow_back_ios_new_rounded,
                    color: Colors.black, size: 24),
              ],
            ),
          ),
        ),
        elevation: 0,
        actions: [
          TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((BuildContext context) =>
                            const AddCategoryPage())));
              },
              child: Container(
                height: 35,
                width: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: AppColors.orange,
                ),
                child: Center(
                  child: const CustomText(
                      text: 'SAVE', color: Colors.white, fontSize: 24,
                      fontWeight: FontWeight.bold,),
                ),
              ),)
        ],
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20.0),
              const CustomText(text: 'Category name'),
              const SizedBox(height: 5.0),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Enter category name',
                  ),
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'category name is required';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 25.0),
              const CustomText(text: 'Category Description'),
              const SizedBox(height: 5.0),
              TextFormField(
                maxLines: 8,
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'description is required';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
