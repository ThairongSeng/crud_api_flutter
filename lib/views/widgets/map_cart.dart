import 'package:flutter/material.dart';

import '../../model/restaurant_model.dart';

class CartMap extends StatelessWidget {
  CartMap({
    super.key,
    required this.dataRestaurant
  });

  DataRestaurant? dataRestaurant;

  @override
  Widget build(BuildContext context) {
    String? imageUrl;

    if (dataRestaurant != null &&
        dataRestaurant!.attributes != null &&
        dataRestaurant!.attributes!.picture != null &&
        dataRestaurant!.attributes!.picture!.data != null &&
        dataRestaurant!.attributes!.picture!.data!.attributes != null) {
      imageUrl = "https://cms.istad.co${dataRestaurant!.attributes!.picture!.data!.attributes!.url.toString()}";
    } else {
      imageUrl = "https://cdn.vectorstock.com/i/preview-1x/65/30/default-image-icon-missing-picture-page-vector-40546530.jpg";
    }
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,

      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: 170,
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
                          color: Colors.pinkAccent,
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Text(
                            "Save 10% ON PICK-UP!",
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ))),
                // Positioned(
                //     top: 50,
                //     // left: 10,
                //     child: Container(
                //         decoration: const BoxDecoration(
                //           borderRadius: BorderRadius.only(
                //               topRight: Radius.circular(10),
                //               bottomRight: Radius.circular(10)
                //           ),
                //           color: Colors.black54,
                //         ),
                //         child: const Padding(
                //           padding: EdgeInsets.all(5.0),
                //           child: Text(
                //             "Top restaurant",
                //             style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                //           ),
                //         )))
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, left: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "${dataRestaurant!.attributes!.name}",
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 80,),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.star, color: Colors.red,),
                          Text("4.7 ",style: TextStyle(fontWeight: FontWeight.bold),),
                          Text("(500+)")
                        ],
                      )
                    ],
                  ),
                  Text(
                    "1.1km away - Pick up in \$ ${dataRestaurant!.attributes!.deliveryFee} min",
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}