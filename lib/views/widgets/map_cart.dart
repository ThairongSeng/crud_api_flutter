import 'package:flutter/material.dart';

class CartMap extends StatelessWidget {
  const CartMap({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
                  width: MediaQuery.of(context).size.width * 0.65,
                  height: 150,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      "assets/images/starbuck.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                //sth above the image
                Positioned(
                    top: 10,
                    child: Container(
                        width: 120,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10)
                          ),
                          color: Colors.black,
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Text(
                            "Top restaurant",
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
                        child: const Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Text(
                            "16 min",
                            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                          ),
                        )))
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10.0, left: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Starbucks FUN Mall TK",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '\$\$\$ Tea & Coffee, American, Bevera...',
                  ),
                  Text(
                    "\$ 0.27 delivery free",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12),
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