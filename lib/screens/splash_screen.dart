import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo.png', height: 200, width: 200),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text(
                "Luxury in every Detail",
                style: TextStyle(
                  //fontFamily: poppins,
                  fontSize: 15,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.normal,
                  color: Color(0xFF16282A),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
