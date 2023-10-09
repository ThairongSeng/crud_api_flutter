import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:food_panda_flutter_ui_app/views/pages/home_page.dart';
import 'package:food_panda_flutter_ui_app/views/pages/welcome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food Panda Demo',
      theme: ThemeData(
        scaffoldBackgroundColor:  Colors.grey[200],
        useMaterial3: true,
      ),
        home: AnimatedSplashScreen(
            duration: 3000,
            splash: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset("assets/images/welcome.png"),
                Image.asset("assets/images/becomepro.png")
              ],
            ),
            splashIconSize: double.maxFinite,
            nextScreen: const HomePage(),
            backgroundColor: Colors.pinkAccent),
    );
  }
}
