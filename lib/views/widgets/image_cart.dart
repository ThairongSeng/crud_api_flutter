import 'package:flutter/material.dart';

import '../../model/cuisine_model.dart';


class ImageCart extends StatelessWidget {

  ImageCart({super.key, required this.cuisineData});

  CuisineData? cuisineData;



  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black12)
          ),
          width: MediaQuery.of(context).size.width * 0.4,
          height: 200,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              "https://cms.istad.co${cuisineData!.attributes!.thumbnail!.data!.attributes!.url}",
              fit: BoxFit.fill,
            ),
          ),
        ),
      ],
    );
  }
}