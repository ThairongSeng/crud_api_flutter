import 'package:flutter/material.dart';

class OrderPopularCart extends StatelessWidget {
  const OrderPopularCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.35,
              height: 150,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  "assets/images/traditionalCake.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            //sth above the image
            Positioned(
                bottom: 10,
                right: 5,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                  ),
                  child: const Text(
                    '+',
                    style: TextStyle(color: Colors.pinkAccent, fontSize: 25),
                  ),
                ))
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0, left: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: const TextSpan(
                  style: TextStyle(color: Colors.black, fontSize: 30),
                  children: <TextSpan>[
                    TextSpan(
                        text: '\$ 1.00 ',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(
                        text: '\$ 1.25',
                        style: TextStyle(
                            decoration: TextDecoration.lineThrough,
                            color: Colors.black45))
                  ],
                ),
                textScaleFactor: 0.5,
              ),
              const Text(
                "Grilled Butter Bread",
                style: TextStyle(fontSize: 12),
              )
            ],
          ),
        )
      ],
    );
  }
}
