import 'package:flutter/material.dart';


class ImageCart extends StatelessWidget {
  const ImageCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.4,
          height: 200,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              "assets/images/starbuck.jpg",
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}