import 'package:flutter/material.dart';
import 'package:luxe_living/screens/home_screen.dart';
import 'package:luxe_living/screens/main_appscreen.dart';
import 'package:luxe_living/screens/placeOrder_screen.dart';
import 'package:luxe_living/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Luxe-Living',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      //home: const SplashScreen(),
      //home:PlaceOrderForm()
      home: MainAppscreen(),
    );
  }
}
