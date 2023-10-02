import 'package:flutter/material.dart';


class PopularCart extends StatelessWidget {
  const PopularCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.45,
            height: 180,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                "assets/images/amazon.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          //sth above the image
          const Positioned(
            height: 30,
              top: 10,
              child: Text(
                "Latte Amazon",
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 20),
              )),
          Positioned(
              bottom: 10,
              right: 10,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.black26),
                  color: Colors.white
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 10),
                  child: Text(
                    "from \$ 1.75",
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
