import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:food_panda_flutter_ui_app/views/pages/checkout_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:lottie/lottie.dart';

class SuccessfulPage extends StatefulWidget {
  const SuccessfulPage({Key? key}) : super(key: key);

  @override
  State<SuccessfulPage> createState() => _SuccessfulPageState();
}

class _SuccessfulPageState extends State<SuccessfulPage> {
  int activeIndex = 0;
  final controller = CarouselController();
  final animationFiles = [
    'assets/images/1.json',
    'assets/images/2.json',
    'assets/images/3.json',
    'assets/images/4.json',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 80,
        leading: IconButton(
          onPressed: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const CheckoutPage()));
          },
          icon: const Icon(Icons.close),
          color: Colors.pinkAccent,
        ),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Your order",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text("Burger King (Tep Phorn)",
                style: TextStyle(fontSize: 17, color: Colors.black))
          ],
        ),
        actions: [
          TextButton(
              onPressed: () {},
              child: const Text(
                "Help",
                style: TextStyle(color: Colors.pinkAccent, fontSize: 17),
              ))
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),

              const Column(
                children: [
                  Text(
                    "25 - 35 mins",
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Estimated delivery time",
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  )
                ],
              ),

              CarouselSlider.builder(
                carouselController: controller,
                itemCount: animationFiles.length,
                itemBuilder: (context, index, realIndex) {
                  final animationFile = animationFiles[index];
                  return buildLottieAnimation(animationFile, index);
                },
                options: CarouselOptions(
                  height: 350,
                  autoPlay: true,
                  enableInfiniteScroll: false,
                  autoPlayAnimationDuration: const Duration(seconds: 2),
                  enlargeCenterPage: true,
                  onPageChanged: (index, reason) =>
                      setState(() => activeIndex = index),
                ),
              ),

              const SizedBox( height: 20,),

              buildIndicator(),

              const SizedBox(
                height: 30,
              ),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 35),
                child: Text(
                  textAlign: TextAlign.center,
                  "Preparing your food. Your rider will pick it up once it's ready.",
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
              ),

              const SizedBox(
                height: 30,
              ),

              const Divider(
                color: Colors.black12,
              ),

              Container(
                width: double.infinity,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      const Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Order Details",
                            style: TextStyle(
                                fontSize: 23, fontWeight: FontWeight.bold),
                          )
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Your order number:",
                            style:
                                TextStyle(fontSize: 17, color: Colors.black54),
                          ),
                          Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.blue[50]),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 7.0, vertical: 3),
                                child: Text(
                                  "#t9ua-40vz",
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),
                                ),
                              ))
                        ],
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Your order number:",
                              style: TextStyle(
                                  fontSize: 17, color: Colors.black54)),
                          Text("Burger King (Tep Phorn)",
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold))
                        ],
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Delivery address",
                              style: TextStyle(
                                  fontSize: 17, color: Colors.black54)),
                          Text("112 street. 664, Phnom Penh",
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      const Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            "Phnom Penh",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ))
                    ],
                  ),
                ),
              ),

              const Divider(
                color: Colors.black12,
              ),

              Container(
                width: double.infinity,
                color: Colors.white,
                child: const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "1x",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 17),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text("2x. Fish Burger",
                                  style: TextStyle(fontSize: 17))
                            ],
                          ),
                          Text("\$ 7.20", style: TextStyle(fontSize: 17))
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "2x",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 17),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text("2x. Chicken Tendercrisp",
                                  style: TextStyle(fontSize: 17))
                            ],
                          ),
                          Text("\$ 17.40", style: TextStyle(fontSize: 17))
                        ],
                      )
                    ],
                  ),
                ),
              ),

              const Divider(
                color: Colors.black12,
              ),

              Container(
                width: double.infinity,
                color: Colors.white,
                child: const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Subtotal",
                            style: TextStyle(
                                fontSize: 23, fontWeight: FontWeight.bold),
                          ),
                          Text("\$ 24.60",
                              style: TextStyle(
                                  fontSize: 23, fontWeight: FontWeight.bold))
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Delivery fee",
                            style:
                                TextStyle(fontSize: 17, color: Colors.black54),
                          ),
                          Text(
                            "\$ 0.50",
                            style: TextStyle(fontSize: 17),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Incl. Tax",
                              style: TextStyle(
                                  fontSize: 17, color: Colors.black54)),
                          Text(
                            "\$ 1.16",
                            style: TextStyle(fontSize: 17),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Voucher: hellopanda",
                              style: TextStyle(
                                  fontSize: 17, color: Colors.black54)),
                          Text(
                            "\$ -3.00",
                            style: TextStyle(fontSize: 17),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              Container(
                width: double.infinity,
                height:80,
                color: Colors.grey[100],
                child:const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total (incl. VAT)", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                      Text('\$ 9.80', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold))
                    ],
                  ),
                ),
              ),

              const SizedBox(
                width: double.infinity,
                height: 150,
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                       Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Paid with",
                            style: TextStyle(
                                fontSize: 23, fontWeight: FontWeight.bold),
                          )
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.attach_money_outlined),
                              SizedBox(width: 15,),
                              Text("credit card", style: TextStyle(fontSize: 20),)
                            ],
                          ),
                          Text("\$ 9.80",style: TextStyle(fontSize: 20),)
                        ],
                      )
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  Widget buildIndicator() => AnimatedSmoothIndicator(
        onDotClicked: animateToSlide,
        effect: const ExpandingDotsEffect(
            dotWidth: 25, activeDotColor: Colors.pinkAccent),
        activeIndex: activeIndex,
        count: animationFiles.length,
      );

  void animateToSlide(int index) => controller.animateToPage(index);

  // Helper method to build Lottie animations
  Widget buildLottieAnimation(String animationFile, int index) => Container(
        child: Lottie.asset(
          animationFile, // Adjust the width as needed
          fit: BoxFit.fill,
        ),
      );
}
