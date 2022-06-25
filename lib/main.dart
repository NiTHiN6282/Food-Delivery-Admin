import 'package:flutter/material.dart';
import 'package:fooddeliveryadmin/pages/food_details.dart';
import 'package:fooddeliveryadmin/pages/foodlistpage.dart';
import 'package:fooddeliveryadmin/screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FoodDetails(),
    );
  }
}
