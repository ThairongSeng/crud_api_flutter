import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

import '../../model/update_model.dart';
class UpdateRestaurantForm extends StatefulWidget {
  final item;
  final idpass;
  final imgid;
  UpdateRestaurantForm({required this.item, required this.idpass, required this.imgid,super.key});
  @override
  _UpdateRestaurantForm createState() => _UpdateRestaurantForm();
}

class _UpdateRestaurantForm extends State<UpdateRestaurantForm> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController discountController = TextEditingController();
  TextEditingController deliveryFeeController = TextEditingController();
  TextEditingController deliveryTimeController = TextEditingController();
  @override
  void initState() {
    super.initState();
    nameController.text = widget.item?.name;
    categoryController.text=widget.item?.category;
    discountController.text=widget.item!.discount.toString();
    deliveryFeeController.text=widget.item!.deliveryFee.toString();
    deliveryTimeController.text=widget.item!.deliveryTime.toString();
  }

  File? images;

  Future<void> _pickImage(ImageSource source) async {
    final pickedImage = await ImagePicker().pickImage(source: source);
    setState(() {
      if (pickedImage != null) {
        images = File(pickedImage.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future<int> uploadImage (path) async{
    var request = http.MultipartRequest('POST', Uri.parse('https://cms.istad.co/api/upload'));
    // Add the image file to the request
    if (images != null) {
      request.files.add(await http.MultipartFile.fromPath('files', path));
    }
    // Send the request and handle the response
    var response = await request.send();
    if (response.statusCode == 200) {
      print('API request successful');
      var responseBody = await response.stream.bytesToString();
      var parsedResponse = jsonDecode(responseBody);
      int id = parsedResponse[0]['id'];
      print('The ID is: $id');
      print(responseBody);
      return id;
    } else {
      print('API request failed');
      return widget.item?.picture?.id;
    }
  }
  Future<void> updateDate (jsonData) async{
    var headers = {
      'Content-Type': 'application/json'
    };
    var requests = http.Request('PUT', Uri.parse('https://cms.istad.co/api/food-panda-restaurants/${widget.idpass}'));
    requests.body =jsonData;
    requests.headers.addAll(headers);
    http.StreamedResponse responses = await requests.send();
    if (responses.statusCode == 200) {
      print(await responses.stream.bytesToString());
    }
    else {
      print(responses.reasonPhrase);
    }
  }

  void submitForm() async{
    if (_formKey.currentState!.validate()) {
      // Retrieve the form field values from the controllers
      String name = nameController.text;
      String category = categoryController.text;
      int discount = int.parse(discountController.text);
      double deliveryFee = double.parse(deliveryFeeController.text);
      int deliveryTime = int.parse(deliveryTimeController.text);
      // You can perform further actions with the form data and the selected image here
      //posting Image
      var ids = images != null ? await uploadImage(images!.path) : widget.imgid;
      print(ids);
      //positing restaurant
      RestaurantUpdateModel restaurantData = RestaurantUpdateModel(
        data: Data(
          name: name,
          category: category,
          discount: discount,
          deliveryFee: deliveryFee,
          deliveryTime: deliveryTime,
          picture: "$ids",
        ),
      );
      String jsonData = restaurantUpdateModelToJson(restaurantData);
      print(jsonData);
      //future insertdata
      updateDate(jsonData);
      // Reset the form
      _formKey.currentState!.reset();
      // Clear the text field controllers
      nameController.clear();
      categoryController.clear();
      discountController.clear();
      deliveryFeeController.clear();
      deliveryTimeController.clear();
      // Clear the image selection
      setState(() {
        images = null;
      });
      Navigator.of(context).pop();

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Update Successful'),
            content: Text('Your restaurant has been successfully updated.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );


    }
  }

  @override
  void dispose() {
    // Dispose the text field controllers when the widget is disposed
    nameController.dispose();
    categoryController.dispose();
    discountController.dispose();
    deliveryFeeController.dispose();
    deliveryTimeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Restaurant'),
        centerTitle: true,
          actions: [
            IconButton(
              onPressed: () => _pickImage(ImageSource.gallery),
              icon: const Icon(Icons.photo, color: Colors.pinkAccent),
            ),
          ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              images != null
                  ? Image.file(images!, height: 200, width: 200, fit: BoxFit.fitHeight,)
                  : Image.network('https://cms.istad.co${widget.item?.picture?.data?.attributes?.url}', height: 200, width: 200, fit: BoxFit.fitHeight,),

              const SizedBox(height: 40),

              TextFormField(
                controller: nameController,
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
              const SizedBox(height: 20),
              TextFormField(
                controller: categoryController,
                decoration: const InputDecoration(
                    labelText: 'Category',
                    border: OutlineInputBorder(),
                    hintText: 'Enter Name'
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a category';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: discountController,
                decoration: const InputDecoration(
                  labelText: 'Discount',
                    border: OutlineInputBorder(),
                    hintText: 'Enter Discount'
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a discount';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: deliveryFeeController,
                decoration: const InputDecoration(
                  labelText: 'Delivery Fee',
                    border: OutlineInputBorder(),
                    hintText: 'Enter Delivery Fee'
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a delivery fee';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: deliveryTimeController,
                decoration: const InputDecoration(
                    labelText: 'Delivery Time',
                    border: OutlineInputBorder(),
                    hintText: 'Enter Delivery Time'
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a delivery time';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: submitForm,
                    child: const Text('Update'),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: (){
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
    );
  }
}
//
// import 'dart:convert';
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:http/http.dart' as http;
//
// import '../../model/update_model.dart';
//
// class UpdateRestaurantForm extends StatefulWidget {
//   final item;
//   final idpass;
//   final imgid;
//
//   UpdateRestaurantForm({required this.item, required this.idpass, required this.imgid, super.key});
//
//   @override
//   _UpdateRestaurantFormState createState() => _UpdateRestaurantFormState();
// }
//
// class _UpdateRestaurantFormState extends State<UpdateRestaurantForm> {
//   final _formKey = GlobalKey<FormState>();
//
//   TextEditingController nameController = TextEditingController();
//   TextEditingController categoryController = TextEditingController();
//   TextEditingController discountController = TextEditingController();
//   TextEditingController deliveryFeeController = TextEditingController();
//   TextEditingController deliveryTimeController = TextEditingController();
//
//   bool isUpdated = false;
//
//   @override
//   void initState() {
//     super.initState();
//     nameController.text = widget.item?.name;
//     categoryController.text = widget.item?.category;
//     discountController.text = widget.item!.discount.toString();
//     deliveryFeeController.text = widget.item!.deliveryFee.toString();
//     deliveryTimeController.text = widget.item!.deliveryTime.toString();
//   }
//
//   File? images;
//
//   Future<void> _pickImage(ImageSource source) async {
//     final pickedImage = await ImagePicker().pickImage(source: source);
//     setState(() {
//       if (pickedImage != null) {
//         images = File(pickedImage.path);
//       } else {
//         print('No image selected.');
//       }
//     });
//   }
//
//   Future<int> uploadImage(path) async {
//     var request = http.MultipartRequest('POST', Uri.parse('https://cms.istad.co/api/upload'));
//     // Add the image file to the request
//     if (images != null) {
//       request.files.add(await http.MultipartFile.fromPath('files', path));
//     }
//     // Send the request and handle the response
//     var response = await request.send();
//     if (response.statusCode == 200) {
//       print('API request successful');
//       var responseBody = await response.stream.bytesToString();
//       var parsedResponse = jsonDecode(responseBody);
//       int id = parsedResponse[0]['id'];
//       print('The ID is: $id');
//       print(responseBody);
//       return id;
//     } else {
//       print('API request failed');
//       return widget.item?.picture?.id;
//     }
//   }
//
//   Future<void> updateData(jsonData) async {
//     var headers = {'Content-Type': 'application/json'};
//     var requests = http.Request('PUT', Uri.parse('https://cms.istad.co/api/food-panda-restaurants/${widget.idpass}'));
//     requests.body = jsonData;
//     requests.headers.addAll(headers);
//     http.StreamedResponse responses = await requests.send();
//     if (responses.statusCode == 200) {
//       print(await responses.stream.bytesToString());
//     } else {
//       print(responses.reasonPhrase);
//     }
//   }
//
//   void submitForm() async {
//     if (_formKey.currentState!.validate()) {
//       // Retrieve the form field values from the controllers
//       String name = nameController.text;
//       String category = categoryController.text;
//       int discount = int.parse(discountController.text);
//       double deliveryFee = double.parse(deliveryFeeController.text);
//       int deliveryTime = int.parse(deliveryTimeController.text);
//       // You can perform further actions with the form data and the selected image here
//       //posting Image
//       var ids = images != null ? await uploadImage(images!.path) : widget.imgid;
//       print(ids);
//       //posting restaurant
//       RestaurantInsertModel restaurantData = RestaurantInsertModel(
//         data: Data(
//           name: name,
//           category: category,
//           discount: discount,
//           deliveryFee: deliveryFee,
//           deliveryTime: deliveryTime,
//           picture: "$ids",
//         ),
//       );
//       String jsonData = restaurantInsertModelToJson(restaurantData);
//       print(jsonData);
//       //future insertdata
//       await updateData(jsonData);
//       // Reset the form
//       _formKey.currentState!.reset();
//       // Clear the text field controllers
//       nameController.clear();
//       categoryController.clear();
//       discountController.clear();
//       deliveryFeeController.clear();
//       deliveryTimeController.clear();
//       // Clear the image selection
//       setState(() {
//         images = null;
//         isUpdated = true;
//       });
//       showDialog(
//         context: context,
//         builder: (_) => AlertDialog(
//           title: Text('Success'),
//           content: Text('Restaurant updated successfully'),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: Text('OK'),
//             ),
//           ],
//         ),
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Update Restaurant'),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.all(20),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 TextFormField(
//                   controller: nameController,
//                   decoration: InputDecoration(
//                     labelText: 'Name',
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter a name';
//                     }
//                     return null;
//                   },
//                 ),
//                 TextFormField(
//                   controller: categoryController,
//                   decoration: InputDecoration(
//                     labelText: 'Category',
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter a category';
//                     }
//                     return null;
//                   },
//                 ),
//                 TextFormField(
//                   controller: discountController,
//                   decoration: InputDecoration(
//                     labelText: 'Discount',
//                   ),
//                   keyboardType: TextInputType.number,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter a discount';
//                     }
//                     return null;
//                   },
//                 ),
//                 TextFormField(
//                   controller: deliveryFeeController,
//                   decoration: InputDecoration(
//                     labelText: 'Delivery Fee',
//                   ),
//                   keyboardType: TextInputType.number,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter a delivery fee';
//                     }
//                     return null;
//                   },
//                 ),
//                 TextFormField(
//                   controller: deliveryTimeController,
//                   decoration: InputDecoration(
//                     labelText: 'Delivery Time',
//                   ),
//                   keyboardType: TextInputType.number,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter a delivery time';
//                     }
//                     return null;
//                   },
//                 ),
//                 SizedBox(height: 20),
//                 Center(
//                   child: images != null
//                       ? Image.file(
//                     images!,
//                     height: 200,
//                   )
//                       : Text('No image selected'),
//                 ),
//                 SizedBox(height: 20),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     ElevatedButton(
//                       onPressed: () {
//                         _pickImage(ImageSource.camera);
//                       },
//                       child: Text('Take Photo'),
//                     ),
//                     SizedBox(width: 10),
//                     ElevatedButton(
//                       onPressed: () {
//                         _pickImage(ImageSource.gallery);
//                       },
//                       child: Text('Select Photo'),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 20),
//                 Center(
//                   child: ElevatedButton(
//                     onPressed: submitForm,
//                     child: Text('Update'),
//                   ),
//                 ),
//                 if (isUpdated)
//                   Center(
//                     child: ElevatedButton(
//                       onPressed: () {
//                         setState(() {
//                           isUpdated = false;
//                         });
//                       },
//                       child: Text('Refresh'),
//                     ),
//                   ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
