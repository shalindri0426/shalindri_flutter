import 'package:flutter/material.dart'; //imports material design widgets and themes needed fortheFlutter UI
//import 'package:luxe_living/screens/category_screen.dart';
// import 'package:luxe_living/screens/home_screen.dart';
import 'package:luxe_living/screens/login_screen.dart';
import 'package:luxe_living/screens/main_appscreen.dart';
//import 'package:luxe_living/screens/splash_screen.dart';
// import 'package:luxe_living/screens/main_appscreen.dart';
// import 'package:luxe_living/screens/placeOrder_screen.dart';
// import 'package:luxe_living/screens/splash_screen.dart';

void main() {
  //main entry point
  runApp(
    const MyApp(),
  ); //'MyApp()' is the main widget being run  //compile time constant toimprove performance
}

class MyApp extends StatelessWidget {
  //a stateless widget - does not store mutable states
  const MyApp({super.key});

  //Light mode
  ThemeData _lightTheme() {
    //configures the visual theme
    return ThemeData(
      brightness: Brightness.light, //sets the light mode
      primaryColor: const Color(0xFF16282A),
      scaffoldBackgroundColor: Colors.white,
      colorScheme: const ColorScheme.light(
        primary: Color(0xFF16282A),
        secondary: Color(0xB364675A),
        onPrimary: Colors.white,
        onSecondary: Colors.black,
      ),
      appBarTheme: const AppBarTheme(
        //app bar colours
        backgroundColor: Color(0xFF16282A),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      textTheme: const TextTheme(
        //for text widgets
        bodyLarge: TextStyle(color: Color(0xFF16282A)),
        bodySmall: TextStyle(color: Color(0xFF64675A)),
      ),
      cardColor: Color(0x3364675A), //product card colour
      buttonTheme: const ButtonThemeData(
        buttonColor: Color(0xFF16282A),
        textTheme: ButtonTextTheme.primary,
      ),
    );
  }

  //dark mode
  ThemeData _darkTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: const Color.fromARGB(255, 255, 255, 255),
      scaffoldBackgroundColor: const Color(0xFF0D1415),
      colorScheme: const ColorScheme.dark(
        primary: Color.fromARGB(255, 255, 255, 255),
        secondary: Color(0xFF64675A),
        onPrimary: Color(0xFF16282A),
        onSecondary: Color.fromARGB(179, 0, 0, 0),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        foregroundColor: Color(0xFF16282A),
        elevation: 0,
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Color(0xFF16282A)),
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
      //maked the app follow the device settings
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false, //hides the debug tag
      // theme: ThemeData.dark(),
      home: LoginPage(),
      //home:MainAppscreen()
    );
  }
}
