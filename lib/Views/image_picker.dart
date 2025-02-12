import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyImagePicker extends StatefulWidget {
  const MyImagePicker({super.key});

  @override
  State<MyImagePicker> createState() => _MyImagePickerState();
}

class _MyImagePickerState extends State<MyImagePicker> {

  final TextEditingController imageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      loadImage();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFormField(
            controller: imageController, 
            readOnly: true,
            decoration: InputDecoration(
              labelText: "Select Image",
              border: OutlineInputBorder(),
            ),
            
              validator: (value) =>
                    value == null || value.isEmpty ? "Select Image" : null,
              ), 
          
          // SizedBox(height: 20),
          
          // Show the selected image
          // CircleAvatar(
          //   radius: 60,
          //   backgroundImage: _imagepath.isNotEmpty
          //       ? FileImage(File(_imagepath)) as ImageProvider
          //       : _image != null
          //           ? FileImage(_image!)
          //           : const NetworkImage(
          //               'https://via.placeholder.com/150',
          //             ),
          // ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: pickImage,
            child: const Text('Pick Image'),
          ),
          // ElevatedButton(
          //   onPressed: () => saveImage(_image?.path ?? ''),
          //   child: const Text('Save Image'),
          // ),
        ],
      ),
    );
  }

  void pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.gallery, 
      maxWidth: 1000,
      maxHeight: 600,
    );

    if (pickedFile != null) {
      setState(() {
        imageController.text = pickedFile.path; 
      });
    } else {
      print('No image selected.');
    }
  }

  Future<void> saveImage(String path) async {
    if (path.isNotEmpty) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('imagepath', path);
      print("Image path saved: $path");
    } else {
      print("No image to save.");
    }
  }

  Future<void> loadImage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedPath = prefs.getString('imagepath');

    if (savedPath != null && savedPath.isNotEmpty) {
      setState(() {
        imageController.text = savedPath;
      });
      print("Loaded image path: $savedPath");
    } else {
      print("No saved image path found.");
    }
  }
}







































































