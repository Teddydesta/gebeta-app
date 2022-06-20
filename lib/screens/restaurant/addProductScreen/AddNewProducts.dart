import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gebeta_food_delivery/models/Hotel.dart';
import 'package:gebeta_food_delivery/screens/restaurant/productScreen/productScreen.dart';
import 'package:gebeta_food_delivery/screens/restaurant/updateProdutScreen/components/updateProductButton.dart';
import 'package:gebeta_food_delivery/utils/colors.dart';

import 'package:gebeta_food_delivery/widgets/app_Icon.dart';
import 'package:gebeta_food_delivery/widgets/customDropdown.dart';
import 'package:gebeta_food_delivery/widgets/customInputText.dart';
import 'package:image_picker/image_picker.dart';

import '../../../widgets/customText.dart';
import '../../../services/productService.dart';

class AddNewProductPage extends StatefulWidget {
  const AddNewProductPage({Key? key}) : super(key: key);

  @override
  _AddNewProductPageState createState() => _AddNewProductPageState();
}

class _AddNewProductPageState extends State<AddNewProductPage> {
  final _keyForm = GlobalKey<FormState>();
  final _formKey = GlobalKey<FormState>();
  List<HotelModel> hotels = [];
  List _images = [];
  List<XFile>? imagesFromDevice = [];
  List<String> categories = ['burger'];
  final ImagePicker _picker = ImagePicker();
  //final size;
  pickImage() async {
    imagesFromDevice = await _picker.pickMultiImage();
    List paths = [];

    for (var image in imagesFromDevice!) {
      paths.add(image.path);
    }
    setState(() {
      _images.addAll(paths);
    });
  }

  final _productServices = ProductServices();
  bool loading = false;

  String? _location;
  TextEditingController _locationController = TextEditingController();
  String? _name;
  TextEditingController _nameController = TextEditingController();
  String? _description;
  TextEditingController _descriptionController = TextEditingController();
  String? _price;
  TextEditingController _priceController = TextEditingController();
  String? _category;
  TextEditingController _categoryController = TextEditingController();

  _validateName(String value) {
    value.trim();
    if (value.isEmpty) return 'Please enter product name';
    if (double.tryParse(value) != null) return 'Only text are allowed';

    return null;
  }

  _validateCategory(String value) {
    if (value.isEmpty) return 'Please choose category';

    return null;
  }

  _validateDescription(String value) {
    value.trim();
    if (value.isEmpty) return 'Please Enter product description';
    if (double.tryParse(value) != null) return 'Only text are allowed';

    return null;
  }

  _validatePrice(String value) {
    if (value.isEmpty) return 'Please Enter product price';
  }

  _showSnackBar(context, text) {
    ScaffoldMessenger.of(context)
        .showSnackBar(new SnackBar(content: new Text(text)));
  }

  _clearState() {
    _formKey.currentState!.reset();
    _images.clear();

    _priceController.clear();
    _nameController.clear();
    _descriptionController.clear();
    setState(() {
      _category = null;
    });
  }

  handleaddProduct() async {
    if (_formKey.currentState!.validate()) {
      var body = {
        'name': _nameController.text,
        'description': _descriptionController.text,
        ' price': _priceController.text,
        'category': _category,
        'images': _images
      };
      print(body);

      var addProduct = await _productServices.addProduct(
          name: _nameController.text,
          description: _descriptionController.text,
          price: _priceController.text,
          category: _category,
          images: _images);
      if (addProduct['error'] == false) {
        _showSnackBar(context, 'Successfully added');
        _nameController.text = "";
        _descriptionController.text = "";
        _priceController.text = "";
        setState(() {
          _images = [];
          imagesFromDevice = [];
        });
        return;
      } else {}
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const CustomText(
          text: 'ADD PRODUCT',
          fontSize: 24,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
        leading: GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: ((BuildContext context) => ProductsScreen()))),
            child: CustomText(
              text: "List",
              color: Colors.black,
            )),
        leadingWidth: 80,
        elevation: 1,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
          children: [
            const SizedBox(height: 10.0),
            //  const CustomText(text: 'Product name'),
            const SizedBox(height: 5.0),

            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: CustomTextField(
                name: "Product Name",
                maxLength: 30,
                controller: _nameController,
                keyboardType: TextInputType.text,
                obscureText: false,
                loading: loading,
                validator: _validateName,
                onChange: (val) {
                  setState(() {
                    _name = val;
                  });
                },
                hintText: "Enter Product Name",
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: CustomTextField(
                name: "Description",
                controller: _descriptionController,
                keyboardType: TextInputType.multiline,
                obscureText: false,
                loading: loading,
                validator: _validateDescription,
                onChange: (val) {
                  setState(() {
                    _description = val;
                  });
                },
                hintText: "Enter here description",
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: CustomTextField(
                name: "Price",
                controller: _priceController,
                keyboardType: TextInputType.number,
                obscureText: false,
                loading: loading,
                validator: _validatePrice,
                onChange: (val) {
                  setState(() {
                    _price = val;
                  });
                },
                hintText: "Product Price",
              ),
            ),
            const SizedBox(height: 20.0),

            const SizedBox(height: 10.0),
            GestureDetector(
              onTap: pickImage,
              child: Container(
                height: 100,
                decoration: BoxDecoration(color: Colors.grey[200]),
                child: Wrap(runSpacing: 5, spacing: 15, children: [
                  for (var image in _images)
                    Stack(clipBehavior: Clip.none, children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: FileImage(File(image)),
                      ),
                      Positioned(
                        bottom: -20,
                        right: -42,
                        child: MaterialButton(
                          onPressed: () => {
                            setState(() {
                              _images.remove(image);
                            })
                          },
                          child: Icon(
                            Icons.close,
                            size: 30,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ]),
                ]),
              ),
            ),

            SizedBox(height: 30),

            CustomDropdown(
              validator: _validateCategory,
              titleText: 'Category',
              controller: _categoryController,
              hintText: 'Choose category',
              value: _category,
              onChange: (String? newValue) {
                setState(() {
                  _category = newValue;
                });
              },
              items: categories,
              loading: loading,
            ),
            SizedBox(
              height: 35,
            ),
            UpdateProductButton(
              color: Colors.black,
              width: 200,
              height: 50,
              borderRadius: 5,
              text: "Add Product",
              loading: loading,
              onPressed: loading
                  ? null
                  : () {
                      handleaddProduct();
                    },
              size: size,
            )
          ],
        ),
      ),
    );
  }
}

// void _deleteCategories(context) {
//   showDialog(
//     context: context,
//     builder: (context) {
//       return Container(
//           margin: const EdgeInsets.only(top: 400, bottom: 0, right: 0, left: 0),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(30),
//           ),
//           child: Container(
//             margin: const EdgeInsets.only(left: 30),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Container(
//                   margin: const EdgeInsets.only(left: 100, top: 20),
//                   height: 5,
//                   width: 100,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(5),
//                       color: Colors.grey),
//                 ),
//                 const SizedBox(
//                   height: 25,
//                 ),
//                 CustomText(text: "Select category"),
//               ],
//             ),
//           ));
//     },
//   );
// }
