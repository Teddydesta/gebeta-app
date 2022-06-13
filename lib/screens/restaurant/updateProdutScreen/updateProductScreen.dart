import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gebeta_food_delivery/models/Category.dart';
import 'package:gebeta_food_delivery/models/DispatchedProduct.dart';
import 'package:gebeta_food_delivery/screens/restaurant/addProductScreen/components/addImages.dart';
import 'package:gebeta_food_delivery/screens/restaurant/updateProdutScreen/components/updateProductButton.dart';
import 'package:gebeta_food_delivery/services/categoryService.dart';
import 'package:gebeta_food_delivery/services/productService.dart';
import 'package:gebeta_food_delivery/utils/locationUtils.dart';
import 'package:gebeta_food_delivery/widgets/customDropdown.dart';
import 'package:gebeta_food_delivery/widgets/customInputText.dart';
import 'package:image_picker/image_picker.dart';

class UpdateProductScreen extends StatefulWidget {
  final DispatchedProduct product;
  const UpdateProductScreen({Key? key, required this.product})
      : super(key: key);

  @override
  _UpdateProductScreenState createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  LocationUtils _locationUtils = new LocationUtils();
  final _formKey = GlobalKey<FormState>();
  final _productServices = ProductServices();
  final ImagePicker _picker = ImagePicker();
  bool loading = false;
  bool loadingCategory = false;
  CategoryServices _categoryServices = CategoryServices();
  List<Category> categoriesFromApi = [];
  Map _location = {};
  List<String> categories = [];
  List<XFile>? imagesFromDevice = [];
  List _images = [];
  List _imagesLinks = [];
  String? _name;
  TextEditingController _nameController = TextEditingController();
  String? _description;
  TextEditingController _descriptionController = TextEditingController();
  String? _category;
  String? _price;
  TextEditingController _priceController = TextEditingController();

  _showSnackBar(context, text) {
    ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
      content: new Text(text),
      duration: Duration(seconds: 3),
    ));
  }

  _clearState() {
    _formKey.currentState!.reset();
    _images.clear();
    imagesFromDevice!.clear();
    _priceController.clear();
    _nameController.clear();
    _descriptionController.clear();
    setState(() {
      _category = null;
    });
  }

  _updateProduct() async {
    if (_location.isEmpty) {
      await getLocation();
      if (_location.isEmpty) {
        _showSnackBar(context,
            'Location coordinates are required, please turn on location service');
        return;
      }
    }
    if (_formKey.currentState!.validate()) {
      setState(() {
        loading = true;
      });
      var res = await _productServices.updateProduct(
          name: _nameController.value.text,
          description: _descriptionController.value.text,
          price: _priceController.value.text,
          category: _category,
          location: _location,
          images: _images,
          imagesLinks: _imagesLinks,
          
          productId: widget.product.id);
      if (res == null) {
        _showSnackBar(context, 'Error adding product, please try again');
        setState(() {
          loading = false;
        });
        return;
      }
      _showSnackBar(context, 'Product successfully added.');
      _clearState();
      setState(() {
        loading = false;
      });
    }
  }

  _validateText(String value, error) {
    value.trim();
    if (value.isEmpty) return error;
  }

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

  addCategories() async {
    setState(() {
      loadingCategory = true;
    });
    var categoryList = await _categoryServices.getCategories();
    if (categoryList == null) {
      _showSnackBar(context, 'Error getting categories, please try again');
      setState(() {
        loadingCategory = false;
      });
      return;
    }
    List<Category> categoryRes = [];
    categoryRes.addAll(categoryList);
    categoriesFromApi.clear();
    categoriesFromApi.addAll(categoryRes);

    for (Category category in categoryList) {
      categories.add(category.name);
    }
    setState(() {
      loadingCategory = false;
    });
  }

  getLocation() async {
    print('Fetching location ... ');
    var result = await _locationUtils.getCurrentPosition();
    print('result : $result');
    if (result['result'] == null) {
      _showSnackBar(context, "Error fetching location, ${result['error']}");
      return;
    }
    print('result : $result');

    _location.addAll({
      'lat': result['result']['lat'].toString(),
      'lng': result['result']['lng'].toString()
    });
    print('location : $_location');
  }

  @override
  void initState() {
    super.initState();
    loading = true;
    _imagesLinks.addAll(widget.product.images!);
    _category = widget.product.category;
    _nameController.value = TextEditingValue(text: widget.product.name!);
    _descriptionController.value =
        TextEditingValue(text: widget.product.description!);
    _priceController.value =
        TextEditingValue(text: widget.product.price!.toString());
    addCategories();
    getLocation();
    loading = false;
  }

  @override
  void dispose() {
    _priceController.dispose();
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          centerTitle: true,
          title: Text('Update Product'),
          leading: IconButton(
            icon: Icon(Icons.close, color: Colors.grey.shade800),
            onPressed: loading ? null : () => Navigator.pop(context),
          ),
        ),
        body: loadingCategory
            ? Center(
                child: Container(
                  height: 50,
                  width: 50,
                  child: CircularProgressIndicator(
                    color: Colors.orangeAccent,
                  ),
                ),
              )
            : Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                child: Form(
                    key: _formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextField(
                              name: 'Name',
                              onChange: (val) {
                                // setState(() {
                                //   _name = val;
                                //   _nameController.value.text = TextEditingValue(text: val);
                                // });
                              },
                              obscureText: false,
                              hintText: 'John Doe',
                              keyboardType: TextInputType.text,
                              validator: (value) => _validateText(
                                  value, 'Product name can not be empty'),
                              loading: loading,
                              controller: _nameController),
                          SizedBox(height: 15),
                          CustomTextField(
                              name: 'Description',
                              onChange: (val) {
                                // setState(() {
                                //   _description = val;
                                //   _descriptionController.value =
                                //       TextEditingValue(text: val);
                                // });
                              },
                              obscureText: false,
                              hintText: '2020 Model Toyota car ... ',
                              keyboardType: TextInputType.multiline,
                              validator: (value) => _validateText(value,
                                  'Product description can not be empty'),
                              loading: loading,
                              controller: _descriptionController),
                          SizedBox(height: 15),
                          CustomTextField(
                              name: 'Price',
                              onChange: (val) {
                                // setState(() {
                                //   _price = val;
                                //   _priceController.value =
                                //       TextEditingValue(text: val);
                                // });
                              },
                              obscureText: false,
                              hintText: '100000',
                              keyboardType: TextInputType.number,
                              validator: (value) => _validateText(
                                  value, 'Product price can not be empty'),
                              loading: loading,
                              controller: _priceController),
                          SizedBox(height: 15),
                          CustomDropdown(
                              titleText: 'Category',
                              hintText: 'Choose category',
                              value: _category,
                              loading: loading,
                              onChange: (String? newValue) {
                                setState(() {
                                  _category = newValue!;
                                });
                              },
                              items: categories),
                          SizedBox(height: 20),
                          // CustomDropdown(
                          //     titleText: 'Location',
                          //     hintText: 'Choose location',
                          //     value: _location,
                          //     loading: loading,
                          //     onChange: (String? newValue) {
                          //       setState(() {
                          //         _location = newValue!;
                          //       });
                          //     },
                          //     items: ['Gerji', 'Mexico', 'Bole', '4 Kilo']),
                          SizedBox(height: 20),
                          Wrap(runSpacing: 5, spacing: 15, children: [
                            for (var image in _imagesLinks)
                              Stack(clipBehavior: Clip.none, children: [
                                CircleAvatar(
                                  radius: 40,
                                  backgroundImage: NetworkImage(image),
                                ),
                                Positioned(
                                  bottom: -20,
                                  right: -42,
                                  child: MaterialButton(
                                    onPressed: () => {
                                      setState(() {
                                        _imagesLinks.remove(image);
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
                            for (var image in _images)
                              Stack(clipBehavior: Clip.none, children: [
                                CircleAvatar(
                                  radius: 40,
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
                          SizedBox(height: 30),
                          AddImageButton(
                              onPressed: pickImage,
                              size: size,
                              loading: loading),
                          SizedBox(height: 30),
                          UpdateProductButton(
                            loading: loading,
                            onPressed: loading
                                ? null
                                : () {
                                    if (_images.length == 0 &&
                                        _imagesLinks.length == 0) {
                                      _formKey.currentState!.validate();
                                      _showSnackBar(
                                          context, 'Image is required');
                                      return;
                                    }
                                    _updateProduct();
                                  },
                            size: size,
                          )
                        ],
                      ),
                    )),
              ));
  }
}