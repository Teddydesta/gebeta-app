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
                width: 100,
                decoration: BoxDecoration(
                  
                  gradient: LinearGradient(
            colors: [
              AppColors.orange, Color(0xFFfbab66)],
            begin: FractionalOffset(0.2, 0.2),
            end: FractionalOffset(1.0, 1.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp),
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.orange,
                ),
                child: Center(
                  child: const CustomText(
                      text: 'SAVE', color: Colors.black, fontSize: 24,
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
              CustomText(text: 'Category Name'),
              const SizedBox(height: 5.0),
              
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 0, vertical: 16),
                child: TextFormField(
                 decoration: InputDecoration(
                            
                            // hide max character counter
                                    counter: Offstage(),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey),
                                      //  borderRadius: BorderRadius.circular(8.0)),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.orange),
                                    
                          ),
                          labelText: 'Name',
                          ),
                  
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
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey),
                                      //  borderRadius: BorderRadius.circular(8.0)),
                                    ),
                                     focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.orange),),
                                            //labelText: 'Description',
                                            labelStyle: TextStyle(
                                              color: AppColors.orange
                                            ),
                ),
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
