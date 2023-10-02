
import 'package:flutter/material.dart';
import 'package:food_panda_flutter_ui_app/views/pages/viewcart_page.dart';
import 'package:food_panda_flutter_ui_app/views/widgets/popular_cart.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key});

  @override
  _ProductDetailsPageState createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  List<String> productTitles = [
    "Popular",
    "Coffee",
    "Tea",
    "Milk/Chocolate",
    "Juice & Smoothies",
    "Light"
  ];
  int currentTabIndex = 0;
  final PageController _pageController = PageController(keepPage: true);

  // Sample data for products in each category
  List<Product> popularProducts = [
    Product(name: "Product 1", description: "Description of Product 1."),
    Product(name: "Product 2", description: "Description of Product 2."),
  ];

  List<Product> coffeeProducts = [
    Product(name: "Coffee Product 1", description: "Description of Coffee Product 1."),
    Product(name: "Coffee Product 2", description: "Description of Coffee Product 2."),

  ];

  List<Product> teaProducts = [
    Product(name: "Tea Product 1", description: "Description of Tea Product 1."),
    Product(name: "Tea Product 2", description: "Description of Tea Product 2."),
  ];

  List<Product> milkChocolateProducts = [
    Product(name: "Milk Chocolate Product 1", description: "Description of Milk Chocolate Product 1."),
    Product(name: "Milk Chocolate Product 2", description: "Description of Milk Chocolate Product 2."),
  ];

  List<Product> juiceSmoothiesProducts = [
    Product(name: "Juice & Smoothies Product 1", description: "Description of Juice & Smoothies Product 1."),
    Product(name: "Juice & Smoothies Product 2", description: "Description of Juice & Smoothies Product 2."),
  ];

  List<Product> lightProducts = [
    Product(name: "Light Product 1", description: "Description of Light Product 1."),
    Product(name: "Light Product 2", description: "Description of Light Product 2."),
  ];

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        currentTabIndex = _pageController.page!.round();
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Delivery",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              "20 min",
              style: TextStyle(fontSize: 15, color: Colors.pinkAccent),
            )
          ],
        ),
        actions: const [
          Icon(
            Icons.favorite_border_outlined,
            color: Colors.pinkAccent,
            size: 30,
          ),
          SizedBox(
            width: 25,
          ),
          Icon(
            Icons.shape_line_outlined,
            color: Colors.pinkAccent,
          ),
          SizedBox(
            width: 25,
          ),
          Icon(
            Icons.search,
            color: Colors.pinkAccent,
            size: 35,
          ),
          SizedBox(
            width: 15,
          )
        ],
      ),
      body: Center(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            decoration: const BoxDecoration(color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Cafe Amazon(Chameleon Phil)",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: const TextSpan(
                          style: TextStyle(color: Colors.black54, fontSize: 36),
                          children: <TextSpan>[
                            TextSpan(text: '1.8km away |'),
                            TextSpan(
                                text: ' Free delivery',
                                style: TextStyle(fontWeight: FontWeight.bold))
                          ],
                        ),
                        textScaleFactor: 0.5,
                      ),
                      const Text(
                        "More info",
                        style: TextStyle(
                            color: Colors.pinkAccent,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.star_border_outlined,
                            color: Colors.pinkAccent,
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          RichText(
                            text: const TextSpan(
                              style: TextStyle(fontSize: 36),
                              children: <TextSpan>[
                                TextSpan(
                                    text: '4.8',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black)),
                                TextSpan(
                                    text: ' .79 ratings',
                                    style: TextStyle(color: Colors.black54)),
                              ],
                            ),
                            textScaleFactor: 0.5,
                          ),
                        ],
                      ),
                      const Text(
                        "See reviews",
                        style: TextStyle(
                            color: Colors.pinkAccent,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  const SizedBox(height: 25),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.alarm_add_outlined,
                            color: Colors.pinkAccent,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            "Delivery 20 min",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          )
                        ],
                      ),
                      Text(
                        "Change",
                        style: TextStyle(
                            color: Colors.pinkAccent,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 60,
            decoration: const BoxDecoration(color: Colors.white),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: productTitles.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      _pageController.animateToPage(
                        index,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: Padding( // Add Padding widget
                      padding: const EdgeInsets.symmetric(horizontal: 16.0), // Add horizontal padding
                      child: Text(
                        productTitles[index],
                        style: TextStyle(
                          fontSize: 18,
                          color: index == currentTabIndex ? Colors.blue : Colors.black,
                        ),
                      ),
                    ),
                  );
                },
              ),

          ),
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              scrollDirection: Axis.vertical,
              itemCount: productTitles.length,
              itemBuilder: (context, index) {
                return _buildProductSection(index);
              },
            ),
          ),
        ]),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: (){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ViewCartPage()));
        },
        child: Container(
          width: double.infinity,
          height: 80,
          decoration: const BoxDecoration(color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.pinkAccent,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: const Padding(
                padding: EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "1",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 18),
                    ),
                    Text(
                      "View your cart",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    Text(
                      "\$ 2.25",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProductSection(int index) {
    // Conditionally choose ListView or GridView based on the category's index
    if (index == 0) {
      return ProductSection(
        title: productTitles[index],
        products: popularProducts,
        isGridView: false,
      );
    } else {
      return ProductSection(
        title: productTitles[index],
        products: _getProductsForCategory(index),
        isGridView: true,
      );
    }
  }

  List<Product> _getProductsForCategory(int categoryIndex) {
    switch (categoryIndex) {
      case 1:
        return coffeeProducts;
      case 2:
        return teaProducts;
      case 3:
        return milkChocolateProducts;
      case 4:
        return juiceSmoothiesProducts;
      case 5:
        return lightProducts;
      default:
        return [];
    }
  }
}

class Product {
  final String name;
  final String description;

  Product({required this.name, required this.description});
}

class ProductSection extends StatelessWidget {
  final String title;
  final List<Product> products;
  final bool isGridView;

  const ProductSection({super.key,
    required this.title,
    required this.products,
    required this.isGridView,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            if (!isGridView)
              GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Adjust the number of columns as needed
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                ),
                itemCount: products.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return _buildProductCard(products[index]);
                },
              )
            else
              for(var product in products)
                Container(
                  width: double.infinity,
                  height: 150,
                  color: Colors.white70,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Amazon", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                              const Text(
                                'For ref only: Rich flavor of its own signature blend that wins the hea...',
                                style: TextStyle(color: Colors.black45),
                                maxLines: 2, // Set max lines for the description
                                overflow: TextOverflow.ellipsis, // Add ellipsis if it exceeds max lines
                              ),
                              SizedBox(height: 10,),
                              Row(
                                children: [
                                  const Text("from \$ 1.60"),
                                  const SizedBox(width: 10),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.grey[350],
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                                      child: Row(
                                        children: [
                                          Icon(Icons.fire_hydrant),
                                          Text("Popular"),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            Image.asset("assets/images/amazon2.png", height: 100),
                            Padding(
                              padding: const EdgeInsets.only(right: 6),
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: Colors.pinkAccent,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.add, color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
            // Add more content for the product section if needed
          ],
        ),
      ),
    );
  }

  Widget _buildProductCard(Product product) {
    return const PopularCart();
  }
}

