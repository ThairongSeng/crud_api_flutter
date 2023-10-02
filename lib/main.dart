import 'package:flutter/material.dart';
import 'package:food_panda_flutter_ui_app/views/pages/home_page.dart';


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
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor:  Colors.grey[200],
        useMaterial3: true,
      ),
      home: const HomePage()
    );
  }
}

