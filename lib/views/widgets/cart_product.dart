import 'package:flutter/material.dart';

import '../../model/restaurant_model.dart';

class CartProduct extends StatelessWidget {
  CartProduct({super.key, required this.restaurantData});

  DataRestaurant? restaurantData;

  @override
  Widget build(BuildContext context) {
    String? imageUrl;

    if (restaurantData != null &&
        restaurantData!.attributes != null &&
        restaurantData!.attributes!.picture != null &&
        restaurantData!.attributes!.picture!.data != null &&
        restaurantData!.attributes!.picture!.data!.attributes != null) {
      imageUrl = "https://cms.istad.co${restaurantData!.attributes!.picture!.data!.attributes!.url.toString()}";
    } else {
      imageUrl = "https://cdn.vectorstock.com/i/preview-1x/65/30/default-image-icon-missing-picture-page-vector-40546530.jpg";
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.65,
              height: 150,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            //sth above the image
            Positioned(
                top: 10,
                child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10)
                      ),
                      color: Colors.black,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
                      child: Text(
                        "Top Restaurant",
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ))),
            Positioned(
                bottom: 10,
                left: 10,
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        "${restaurantData!.attributes!.deliveryTime} min",
                        style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    )))
          ],
        ),
        Padding(
          padding:const EdgeInsets.only(top: 10.0, left: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                restaurantData!.attributes!.name!,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              const Text(
                '\$\$\$ Tea & Coffee, American, Cambodia...',
              ),
              Text(
                "\$ ${restaurantData!.attributes!.deliveryFee} delivery free",
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
