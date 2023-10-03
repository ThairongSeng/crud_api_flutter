import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class UpdateRestaurant extends StatefulWidget {
  const UpdateRestaurant({
    Key? key,
    required this.name,
    required this.category,
    required this.discount,
    required this.deliveryFee,
    required this.deliveryTime,
    this.id,
    this.imageUrl,
  }) : super(key: key);

  final int? id;
  final String? name;
  final String? category;
  final int? discount;
  final double? deliveryFee;
  final int? deliveryTime;
  final String? imageUrl;

  @override
  State<UpdateRestaurant> createState() => _UpdateRestaurantState();
}

class _UpdateRestaurantState extends State<UpdateRestaurant> {
  XFile? _image;

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

    final url = Uri.parse('https://cms.istad.co/api/food-panda-restaurants/${widget.id}'); // Update the URL to include the restaurant ID

    try {
      final request = http.MultipartRequest('PUT', url); // Use the PUT method for updating the restaurant
      request.fields['image_url'] = _image!.path; // Pass the image URL as a field
      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        final imageId = jsonDecode(response.body)['image_id']; // Extract the image ID from the response
        await updateRestaurant(imageId); // Pass the image ID to the updateRestaurant method
        _showAlertDialog(context, 'Update Successfully');
        _cancelForm();
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      print('Error during image update: $e');
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

  Future<void> updateRestaurant(String imageId) async {
    final url = Uri.parse('https://cms.istad.co/api/food-panda-restaurants');

    final response = await http.put(
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
      print('Restaurant update successfully');
    } else {
      print('Failed to update restaurant. Status code: ${response.statusCode}');
    }
  }

  @override
  void initState() {
    super.initState();
    name.text = widget.name ?? '';
    category.text = widget.category ?? '';
    discount.text = widget.discount?.toString() ?? '';
    deliveryTime.text = widget.deliveryTime?.toString() ?? '';
    deliveryFee.text = widget.deliveryFee?.toString() ?? '';
    _image = widget.imageUrl != null ? XFile(widget.imageUrl!) : null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Restaurant', style: TextStyle(color: Colors.pinkAccent),),
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                widget.imageUrl!,
                width: 200,
                height: 200,
                fit: BoxFit.fitHeight,
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 20,
                ),
                child: TextField(
                  controller: name,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Name',
                    hintText: 'Enter Name',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 20,
                ),
                child: TextField(
                  controller: category,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Category',
                    hintText: 'Enter Category',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 20,
                ),
                child: TextField(
                  controller: discount,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Discount',
                    hintText: 'Enter Discount',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 20,
                ),
                child: TextField(
                  controller: deliveryTime,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Delivery Time',
                    hintText: 'Enter Delivery Time',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 20,
                ),
                child: TextField(
                  controller: deliveryFee,
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Delivery Fee',
                    hintText: 'Enter Delivery Fee',
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _uploadImage(context);
                    },
                    child: const Text('Update'),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: _cancelForm,
                    child: const Text('Cancel'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

}



