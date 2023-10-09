import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class AddRestaurant extends StatefulWidget {
  const AddRestaurant({Key? key}) : super(key: key);


  @override
  State<AddRestaurant> createState() => _AddRestaurantState();
}

class _AddRestaurantState extends State<AddRestaurant> {
  XFile? _image;
  final _formKey = GlobalKey<FormState>();


  TextEditingController name = TextEditingController();
  TextEditingController category = TextEditingController();
  TextEditingController discount = TextEditingController();
  TextEditingController deliveryTime = TextEditingController();
  TextEditingController deliveryFee = TextEditingController();



  Future<void> _selectImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = pickedImage;
    });
  }

  Future<void> _captureImage() async {
    final picker = ImagePicker();
    final capturedImage = await picker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = capturedImage;
    });
  }

  Future<void> _uploadImage(BuildContext context) async {
    if (_image == null) {
      return;
    }

    final file = File(_image!.path);
    final url = Uri.parse('https://cms.istad.co/api/upload');

    try {
      final request = http.MultipartRequest('POST', url);
      request.files.add(await http.MultipartFile.fromPath('files', file.path));

      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        _showAlertDialog(context, 'Upload Successful');
        _cancelForm();
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      print('Error during image upload: $e');
    }
  }

  void _showAlertDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Alert'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _cancelForm() {
    setState(() {
      name.clear();
      category.clear();
      discount.clear();
      deliveryTime.clear();
      deliveryFee.clear();
      _image = null;
    });
  }

  Future<void> postRestaurant(String imageId) async {
    final url = Uri.parse('https://cms.istad.co/api/food-panda-restaurants');

    final response = await http.post(
      url,
      body: jsonEncode({
        'data': {
          'name': name.text,
          'category': category.text,
          'discount': int.parse(discount.text),
          'deliveryTime': int.parse(deliveryTime.text),
          'deliveryFee': double.parse(deliveryFee.text),
          'picture': imageId,
        },
      }),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      print('Restaurant posted successfully');
    } else {
      print('Failed to post restaurant. Status code: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Restaurant', style: TextStyle(color: Colors.pinkAccent),),
        actions: [
          IconButton(
            onPressed: _captureImage,
            icon: const Icon(Icons.camera_alt, color: Colors.pinkAccent),
          ),
          IconButton(
            onPressed: _selectImage,
            icon: const Icon(Icons.photo, color: Colors.pinkAccent),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: _image != null
                      ? Image.file(
                          File(_image!.path),
                          width: 200,
                          height: 200,
                          fit: BoxFit.cover,
                        )
                      : Container(
                          width: 200,
                          height: 200,
                          color: Colors.pink[100],
                        ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 20,
                  ),
                  child: TextFormField(
                    controller: name,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Name',
                        hintText: 'Enter Name'
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a name';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 20,
                  ),
                  child: TextFormField(
                    controller: category,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Category',
                        hintText: 'Enter Category'
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a category';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 20,
                  ),
                  child: TextFormField(
                    controller: discount,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Discount',
                        hintText: 'Enter Discount'
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a discount';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 20,
                  ),
                  child: TextFormField(
                    controller: deliveryTime,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Delivery Time',
                        hintText: 'Enter Delivery Time'
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a delivery time';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 20,
                  ),
                  child: TextFormField(
                    controller: deliveryFee,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Delivery Fee',
                        hintText: 'Enter Delivery Fee'
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a delivery fee';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                         _formKey.currentState!.validate();
                          _uploadImage(context);
                          _cancelForm();
                      },
                      child: const Text('Upload'),
                    ),
                    const SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: (){
                        _cancelForm();
                        Navigator.of(context).pop();
                      },
                      child: const Text('Cancel'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
