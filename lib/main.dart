import 'package:flutter/material.dart';
import 'package:luxe_living/screens/home_screen.dart';
import 'package:luxe_living/screens/login_screen.dart';
import 'package:luxe_living/screens/main_appscreen.dart';
import 'package:luxe_living/screens/placeOrder_screen.dart';
import 'package:luxe_living/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  ThemeData _lightTheme() {
  return ThemeData(
    brightness: Brightness.light,
    primaryColor: const Color(0xFF16282A),
    scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme.light(
      primary: Color(0xFF16282A),
      secondary: Color(0xB364675A), // 70% opacity for hover/backgrounds
      onPrimary: Colors.white,
      onSecondary: Colors.black,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF16282A),
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Color(0xFF16282A)),
      bodySmall: TextStyle(color: Color(0xFF64675A)),
    ),
    cardColor: Color(0x3364675A), // 20% opacity for card backgrounds
    buttonTheme: const ButtonThemeData(
      buttonColor: Color(0xFF16282A),
      textTheme: ButtonTextTheme.primary,
    ),
  );
}

ThemeData _darkTheme() {
  return ThemeData(
    brightness: Brightness.dark,
    primaryColor: const Color.fromARGB(255, 255, 255, 255),
    scaffoldBackgroundColor: const Color(0xFF0D1415),
    colorScheme: const ColorScheme.dark(
      primary: Color.fromARGB(255, 255, 255, 255),
      secondary: Color(0xFF64675A),
      onPrimary:  Color(0xFF16282A),
      onSecondary: Colors.white70,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white),
      bodySmall: TextStyle(color: Color(0xFFB0B3A5)),
    ),
    cardColor: Color(0xB364675A),
    buttonTheme: const ButtonThemeData(
      buttonColor: Color(0xFF64675A),
      textTheme: ButtonTextTheme.primary,
    ),
  );
}


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Luxe-Living',
      theme: _lightTheme(),
      darkTheme: _darkTheme(),
      themeMode: ThemeMode.system,
      // theme: ThemeData.dark(),
      home: LoginPage(),
      //home:PlaceOrderForm()
      //home: MainAppscreen(),
    );
  }
}
