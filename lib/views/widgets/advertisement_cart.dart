import 'package:flutter/material.dart';


class AdvertiseCart extends StatelessWidget {
  const AdvertiseCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 100,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.black26)
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Become a pro", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  Text("and get exclusive deals")
                ],
              ),
              Column(
                children: [
                  Image.asset("assets/images/food_panda.jpg", width: 95, height: 95,),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}