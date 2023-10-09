
import 'package:flutter/material.dart';
class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset("assets/images/welcome.png"),
          Image.asset("assets/images/becomepro.png",
            height: 250,
            fit: BoxFit.fitHeight,
          )
        ],
      )
    );
  }
}
