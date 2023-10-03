import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_panda_flutter_ui_app/views/pages/update_restaurant_page.dart';
import 'package:food_panda_flutter_ui_app/views/widgets/image_cart.dart';
import 'package:food_panda_flutter_ui_app/views/widgets/map_cart.dart';
import '../../model/restaurant_model.dart';
import '../widgets/advertisement_cart.dart';
import '../widgets/cart_product.dart';
import 'add_restaurant_page.dart';
import 'drawer_widget.dart';
import '../widgets/small_cart.dart';

import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late Future<RestaurantModel> futureRestaurant;

  Future<RestaurantModel> fetchRestaurant() async{
    final response = await http.get(Uri.parse("https://cms.istad.co/api/food-panda-restaurants?populate=*"));

    if(response.statusCode == 200){
      return restaurantModelFromJson(response.body);
    }else{
      throw Exception("Failed to load restaurant");
    }
  }

  Future<dynamic> deleteRestaurant(int id) async {
    final response = await http.delete(
      Uri.parse('https://cms.istad.co/api/food-panda-restaurants/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureRestaurant = fetchRestaurant();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //drawer
        drawer: const DrawerWidget(),

        //navbar
        appBar: AppBar(
          toolbarHeight: 80,
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Colors.pinkAccent,
          title: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "2 St 562",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
              Text(
                "Phnom Penh",
                style: TextStyle(fontSize: 17, color: Colors.white),
              )
            ],
          ),
          actions: const [
            Icon(
              Icons.favorite_border_outlined,
              color: Colors.white,
            ),
            SizedBox(
              width: 10,
            ),
            Icon(
              Icons.shopping_bag_outlined,
              color: Colors.white,
            ),
            SizedBox(
              width: 20,
            )
          ],
        ),

        //body of the screen
        body: CustomScrollView(
          slivers: [
            //app bar with sliver
            SliverAppBar(
              automaticallyImplyLeading: false,
              toolbarHeight: 80,
              pinned: false,
              floating: true,
              snap: false,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  color: Colors.pinkAccent,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: CupertinoTextField(
                            padding: const EdgeInsets.symmetric(
                                vertical: 13, horizontal: 10),
                            placeholder: "Search for shops & restaurants",
                            prefix: const Padding(
                              padding: EdgeInsets.only(left: 12.0),
                              child: Icon(Icons.search),
                            ),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50)),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),

            //food delivery
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                      color: Colors.white),
                  width: double.infinity,
                  height: 200,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Food delivery",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          "Order food you love",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Image.asset(
                              "assets/images/food_panda.jpg",
                              height: 100,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),

            //Groceries
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: SizedBox(
                  height: 320,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Groceries",
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "Supermarkets, Marts, Shops, & more",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 15.0),
                                child: Align(
                                  alignment: Alignment.bottomRight,
                                  child: Image.asset(
                                    "assets/images/food_panda.jpg",
                                    height: 100,
                                    width: 150,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Container(
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.all(12.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Pick-up",
                                            style: TextStyle(
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            "Up to 50% off",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 15.0),
                                      child: Align(
                                        alignment: Alignment.bottomRight,
                                        child: Image.asset(
                                          "assets/images/food_panda.jpg",
                                          height: 70,
                                          width: 100,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Row(
                                        children: [
                                          const Expanded(
                                            flex: 2,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "pandasend",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  "Send parcels in a tap",
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Column(
                                              children: [
                                                Image.asset(
                                                  "assets/images/pandasend.png",
                                                  height: 80,
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),

            //Popular restaurant
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Popular Restaurants",
                          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 240,
                          child: FutureBuilder(
                            future: futureRestaurant,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: snapshot.data!.data!.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(right: 15, top: 10),
                                      child: GestureDetector(
                                        onTap: () {
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: const Text("Are you sure to delete?"),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () {
                                                      deleteRestaurant(snapshot.data!.data![index].id!);
                                                      setState(() {
                                                        snapshot.data!.data!.removeAt(index);
                                                      });
                                                      Navigator.pop(context); // Close the dialog
                                                    },
                                                    child: const Text(
                                                      'Yes',
                                                      style: TextStyle(
                                                        color: Colors.redAccent,
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 22,
                                                      ),
                                                    ),
                                                  ),
                                                  TextButton(
                                                    child: const Text(
                                                      'Cancel',
                                                      style: TextStyle(
                                                        color: Colors.blueAccent,
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 22,
                                                      ),
                                                    ),
                                                    onPressed: () {
                                                      Navigator.pop(context); // Close the dialog
                                                    },
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        },
                                        onLongPress: () {
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: const Text("Update Restaurant"),
                                                content: Text("Restaurant ID: ${snapshot.data!.data![index].id}"),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.pop(context); // Close the dialog

                                                        int? id = snapshot.data!.data![index].id;
                                                       String? name = snapshot.data!.data![index].attributes!.name;
                                                       String? category = snapshot.data!.data![index].attributes!.category;
                                                       int? discount = snapshot.data!.data![index].attributes!.discount;
                                                       double? deliveryFee = snapshot.data!.data![index].attributes!.deliveryFee;
                                                       int? deliveryTime = snapshot.data!.data![index].attributes!.deliveryTime;
                                                       String? imageUrl = "https://cms.istad.co${snapshot.data!.data![index].attributes!.picture!.data!.attributes!.url}";

                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>  UpdateRestaurant(
                                                            id:id,
                                                            name: name,
                                                            category: category,
                                                            discount: discount,
                                                            deliveryFee: deliveryFee,
                                                            deliveryTime: deliveryTime,
                                                            imageUrl: imageUrl
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                    child: const Text(
                                                      'Update',
                                                      style: TextStyle(
                                                        color: Colors.green,
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 22,
                                                      ),
                                                    ),
                                                  ),
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.pop(context); // Close the dialog
                                                    },
                                                    child: const Text(
                                                      'Cancel',
                                                      style: TextStyle(
                                                        color: Colors.blueAccent,
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 22,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        },
                                        child: CartProduct(
                                          restaurantData: snapshot.data!.data![index],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              } else if (snapshot.hasError) {
                                return Text("${snapshot.error}");
                              }
                              return const CircularProgressIndicator();
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),


            //Cuisines
            SliverToBoxAdapter(
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Cuisines",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 240,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return const Padding(
                              padding: EdgeInsets.only(right: 20, top: 10),
                              child: Column(
                                children: [
                                  SmallCartProduct(),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  SmallCartProduct()
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            //your daily deals
            SliverToBoxAdapter(
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Your daily deals",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 220,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return const Padding(
                              padding: EdgeInsets.only(right: 15, top: 10),
                              child: ImageCart(),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            //pick up at a restaurant near you
            SliverToBoxAdapter(
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Pick you at a restaurant near you",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Stack(children: [
                        Container(
                          height: 340,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.fitHeight,
                                image: AssetImage('assets/images/map.jpg')),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30.0),
                          child: SizedBox(
                            height: 260,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 10,
                              itemBuilder: (context, index) {
                                return const Padding(
                                  padding: EdgeInsets.only(right: 15, top: 10),
                                  child: CartMap(),
                                );
                              },
                            ),
                          ),
                        ),
                      ]),
                    ],
                  ),
                ),
              ),
            ),

            //Shop
            SliverToBoxAdapter(
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Shops",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 120,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return const Padding(
                              padding: EdgeInsets.only(right: 20, top: 10),
                              child: Column(
                                children: [
                                  SmallCartProduct(),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            //advertisement cart
            SliverList(
                delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container(
                    color: Colors.white,
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: AdvertiseCart(),
                    ));
              },
              childCount: 5,
            )),
          ],
        ),

        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.pinkAccent,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AddRestaurant()));
          },
          child: const Icon(Icons.add_circle, color: Colors.white,size: 30),
        ));
  }
}
