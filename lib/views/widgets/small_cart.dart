import 'package:flutter/material.dart';


class SmallCartProduct extends StatelessWidget {
  const SmallCartProduct({
    super.key,
  });

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
                  child: Image.asset(
                    "assets/images/cafe.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            )
          ],
        ),
        const SizedBox(
          child: Text(
            "Milk Tea",
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}