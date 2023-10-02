import 'package:flutter/material.dart';
import 'package:food_panda_flutter_ui_app/views/pages/successful_page.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  late bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        toolbarHeight: 70,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Checkout",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text("Café Amazon (Wat Phnom)", style: TextStyle(fontSize: 15))
          ],
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black12),
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(10),
                        topLeft: Radius.circular(10))),
                width: MediaQuery.of(context).size.width * 0.9,
                height: 260,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 10),
                  child: Column(
                    children: [
                      const Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on_outlined,
                                  color: Colors.pinkAccent,
                                ),
                                Text(
                                  "Delivery address",
                                  style: TextStyle(
                                      fontSize: 23,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            Icon(
                              Icons.edit,
                              color: Colors.pinkAccent,
                            )
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/map.jpg',
                            height: 100,
                            width: 330,
                            fit: BoxFit.fitWidth,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Expanded(
                        flex: 1,
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "2 St 562",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text('Phnom Penh',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold))
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12),
                  color: Colors.white,
                ),
                width: MediaQuery.of(context).size.width * 0.9,
                height: 50,
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.add,
                        color: Colors.pinkAccent,
                        size: 25,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "Add delivery instructions",
                        style: TextStyle(
                            color: Colors.pinkAccent,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12),
                  color: Colors.white,
                ),
                height: 80,
                width: MediaQuery.of(context).size.width * 0.9,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 19, vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Expanded(
                              flex: 3,
                              child: Text(
                                "Contactless delivery: your rider will place the order at your door",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              )),
                          Expanded(
                            flex: 1,
                            child: Switch(
                              activeColor: Colors.pinkAccent,
                              value: isChecked,
                              onChanged: (bool value) {
                                setState(() {
                                  isChecked = value;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 100,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12),
                  color: Colors.white,
                ),
                child: const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.book_online_outlined,
                            color: Colors.pinkAccent,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            "Payment method",
                            style: TextStyle(
                                fontSize: 23, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.add,
                            color: Colors.pinkAccent,
                            size: 25,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            "Add delivery instructions",
                            style: TextStyle(
                                color: Colors.pinkAccent,
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 200,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12),
                  color: Colors.white,
                ),
                child: const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.book_outlined,
                            color: Colors.pinkAccent,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            "Order summary",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 23),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "1x Cappuccino",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 17),
                              ),
                              Text(
                                "125% Sugar",
                                style: TextStyle(fontSize: 15),
                              )
                            ],
                          ),
                          Text("\$ 2.00",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17))
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("1x Cappuccino",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17)),
                              Text("125% Sugar", style: TextStyle(fontSize: 15))
                            ],
                          ),
                          Text("\$ 2.15",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 120,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12),
                  color: Colors.white,
                ),
                child: const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Subtotal",
                            style:
                                TextStyle(fontSize: 17, color: Colors.black45),
                          ),
                          Text("\$ 4.15",
                              style: TextStyle(
                                  fontSize: 17, color: Colors.black45))
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Delivery Free",
                              style: TextStyle(
                                  fontSize: 17, color: Colors.black45)),
                          Text("Free",
                              style: TextStyle(
                                  fontSize: 17, color: Colors.black45))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15,),
              SizedBox(
                height: 200,
                width: double.infinity,
                child:  Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: RichText(
                    text: const TextSpan(
                      style: TextStyle(color: Colors.black, fontSize: 33),
                      children: <TextSpan>[
                        TextSpan(text: 'By replacing your order you agree to our ',),
                        TextSpan(text: 'Terms & Conditions.', style: TextStyle(color: Colors.pinkAccent)),
                        TextSpan(text: "We will process your personal data necessary to deliver your order. You can learn more on how we process your personal data in our "),
                        TextSpan(text: "Privacy Policy", style: TextStyle(color: Colors.pinkAccent))
                      ],
                    ),
                    textScaleFactor: 0.5,
                  ),
                )
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 130,
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: const TextSpan(
                          style: TextStyle(color: Colors.black, fontSize: 36),
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Total ',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(
                                text: '(incl. VAT)',
                                style: TextStyle(fontSize: 25))
                          ],
                        ),
                        textScaleFactor: 0.5,
                      ),
                      const Text(
                        "See price breakdown",
                        style: TextStyle(color: Colors.pinkAccent),
                      )
                    ],
                  ),
                  const Text(
                    '\$ 4.15',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SuccessfulPage()));
              },
              child: Container(
                  width: MediaQuery.of(context).size.width * 0.95,
                  decoration: BoxDecoration(
                      color: Colors.pinkAccent,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
                    child: Center(
                        child: Text("Confirm address", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),)
                    ),
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
