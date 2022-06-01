import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class PickImageScreen extends StatefulWidget {
  const PickImageScreen({Key? key}) : super(key: key);

  @override
  State<PickImageScreen> createState() => _PickImageScreenState();
}

class _PickImageScreenState extends State<PickImageScreen> {
  
  File? imageFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Capturing Images'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if(imageFile != null)
              Container(
                width: 140,
                height: 140,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  image: DecorationImage(
                    image: FileImage(imageFile!),
                    fit: BoxFit.cover
                  ),
                  border: Border.all(width: 5, color: Colors.black12),
                  borderRadius: BorderRadius.circular(1000),
                ),
              )
            else
              Container(
                width: 140,
                height: 140,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  border: Border.all(width: 5, color: Colors.black12),
                  borderRadius: BorderRadius.circular(1000.0),
                ),
                
              ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                      onPressed: ()=> getImage(source: ImageSource.camera),
                      child: const Text('Capture Image', style: TextStyle(fontSize: 18))
                  ),
                ),
                const SizedBox(width: 20,),
                Expanded(
                  child: ElevatedButton(
                      onPressed: ()=> getImage(source: ImageSource.gallery),
                      child: const Text('Select Image', style: TextStyle(fontSize: 18))
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
  
  void getImage({required ImageSource source}) async {
    
    final file = await ImagePicker().pickImage(
        source: source,
      maxWidth: 640,
      maxHeight: 480,
      imageQuality: 70 //0 - 100
    );
    
    if(file?.path != null){
      setState(() {
        imageFile = File(file!.path);
      });
    }
  }
}