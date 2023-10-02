import 'package:flutter/material.dart';

class CoffeeCart extends StatelessWidget {
  const CoffeeCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity,
          height:150,
          color: Colors.white70,
          child: Row(
            children:[
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Amazon", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                      const Text('For ref only: Rich flavor of its own signature blend that wins the hea...', style: TextStyle(color: Colors.black45),),
                      const SizedBox(height: 10,),
                      Row(
                        children: [
                          const Text("from \$ 1.60",),
                          const SizedBox(width: 10,),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[350],
                              borderRadius: BorderRadius.circular(10)
                            ),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.0),
                                child: Row(
                                  children: [
                                    Icon(Icons.fire_hydrant),
                                    Text("Popular"),
                                  ],
                                ),
                              )
                          )
                        ],
                      )
                    ],
                  ),
                ), //Replace with your child widget
              ),
              Expanded(
                flex:1,
                child:  Column(
                  children: [
                    Image.asset("assets/images/amazon2.png", height: 100),
                    Padding(
                      padding: const EdgeInsets.only( right: 5),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.pinkAccent,
                            borderRadius: BorderRadius.circular(50)
                          ),
                          child: IconButton(
                              onPressed: (){},
                              icon: const Icon(Icons.add, color: Colors.white,)
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          )
          ,
        ),
      ),
    );
  }
}
