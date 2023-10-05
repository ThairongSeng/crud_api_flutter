import 'package:flutter/material.dart';
import 'package:food_panda_flutter_ui_app/model/cuisine_model.dart';


class SmallCartProduct extends StatelessWidget {
  SmallCartProduct({super.key, required this.cuisineData});

  CuisineData? cuisineData;



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            SizedBox(
              child: Container(
                padding: const EdgeInsets.all(10),
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(10)),
                child: ClipRRect(
                  child: Image.network(
                    "https://cms.istad.co${cuisineData!.attributes!.thumbnail!.data!.attributes!.url}",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            )
          ],
        ),
        SizedBox(
          child: Text(
            "${cuisineData!.attributes!.title}",
            style: const TextStyle(
                fontSize: 15, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}