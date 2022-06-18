import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gebeta_food_delivery/models/Product.dart';
import 'package:gebeta_food_delivery/screens/restaurant/updateProdutScreen/components/updateProductButton.dart';
import 'package:gebeta_food_delivery/services/productService.dart';
import 'package:gebeta_food_delivery/widgets/customDropdown.dart';
import 'package:gebeta_food_delivery/widgets/customInputText.dart';
import 'package:image_picker/image_picker.dart';

class UpdateProductScreen extends StatefulWidget {
  final Product? product;
  const UpdateProductScreen({Key? key, this.product}) : super(key: key);

  @override
  _UpdateProductScreenState createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  final _productServices = ProductServices();
  final ImagePicker _picker = ImagePicker();
  bool loading = false;
  Map _location = {};
  List<String> categories = ['burger'];
  List<XFile>? imagesFromDevice = [];
  List _images = [];
  String? _name;

  TextEditingController _nameController = TextEditingController();
  String? _description;
  TextEditingController _descriptionController = TextEditingController();
  String? _price;
  TextEditingController _priceController = TextEditingController();
  String? _category;
  TextEditingController _categoryController = TextEditingController();

  _showSnackBar(context, text) {
    ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
      content: new Text(text),
      duration: Duration(seconds: 3),
    ));
  }

  _validateCategory(String value) {
    if (value.isEmpty) return 'Please choose category';

    return null;
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

  handleUpdateProduct() async {
    print("start");
    if (_formKey.currentState!.validate()) {
      setState(() {
        loading = true;
      });
      var res = await _productServices.updateProduct(
          name: _nameController.text,
          description: _descriptionController.text,
          price: _priceController.text,
          category: _category,
          images: _images,
          productId: widget.product!.id);
      print(res);
      if (res == null) {
        _showSnackBar(context, 'Error adding product, please try again');
        setState(() {
          loading = false;
        });
        return;
      }

      // _showSnackBar(context, 'Product successfully added.');
      // _clearState();
      // setState(() {
      //   loading = false;
      // });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          centerTitle: true,
          title: GestureDetector(
              onTap: handleUpdateProduct, child: Text('Update Product')),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.grey.shade800),
            onPressed: loading ? null : () => Navigator.pop(context),
          ),
        ),
        body: loading
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
                              hintText: 'Camila',
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
                              hintText: 'description ',
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
                              hintText: '240 birr',
                              keyboardType: TextInputType.number,
                              validator: (value) => _validateText(
                                  value, 'Product price can not be empty'),
                              loading: loading,
                              controller: _priceController),
                          SizedBox(height: 15),
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
                          SizedBox(height: 20),
                          // CustomDropdown(
                          //     titleText: 'Location',
                          //     hintText: 'Choose location',
                          //
                          //     loading: loading,
                          //     onChange: (String? newValue) {
                          //       setState(() {
                          //         _location = newValue!;
                          //       });
                          //     },
                          //     items: ['salad', 'burger', 'Bole', '4 Kilo']),
                          SizedBox(height: 20),
                          GestureDetector(
                            onTap: pickImage,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              margin: EdgeInsets.only(left: 5, right: 5),
                              height: 140,
                              width: double.infinity,
                              child:
                                  Wrap(runSpacing: 5, spacing: 15, children: [
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

                          UpdateProductButton(
                            loading: loading,
                            onPressed: loading
                                ? null
                                : () {
                                    //handleUpdateProduct();
                                  },
                            size: size,
                          )
                        ],
                      ),
                    )),
              ));
  }
}
