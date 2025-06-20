import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:luxe_living/screens/home_screen.dart';
import 'package:luxe_living/screens/register_screen.dart';
import 'package:luxe_living/screens/main_appscreen.dart';

class LoginPage extends StatefulWidget {
  //stateful - form validation requires changes in the UI
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

//Connects to its internal state class
class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>(); //for validation
  //to read inputs from user
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _login() {
    //login validation
    if (_formKey.currentState!.validate()) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MainAppscreen()),
      );
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Logging in...")));
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryColor = theme.colorScheme.primary;
    final onPrimaryColor = theme.colorScheme.onPrimary;
    final secondaryColor = theme.colorScheme.secondary;
    //final onSecondaryColor = theme.colorScheme.onSecondary;
    final scaffoldBackground = theme.scaffoldBackgroundColor;

    return Scaffold(
      backgroundColor: scaffoldBackground,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Form(
            key: _formKey, //starts form with validation
            child: Column(
              //to stack child widgets vertically
              children: [
                Text(
                  'LUXE – LIVING',
                  style: GoogleFonts.poppins(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                    letterSpacing: 1.2,
                  ),
                ),
                const SizedBox(height: 40),

                // Email
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    prefixIcon: Icon(
                      Icons.email_outlined,
                      color: secondaryColor,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    fillColor: theme.cardColor.withOpacity(0.15),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator:
                      (value) =>
                          value != null && value.contains('@')
                              ? null
                              : 'Enter a valid email',
                  style: GoogleFonts.poppins(color: primaryColor),
                ),
                const SizedBox(height: 20),

                // Password
                TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    prefixIcon: Icon(Icons.lock_outline, color: secondaryColor),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    fillColor: theme.cardColor.withOpacity(0.15),
                  ),
                  obscureText: true,
                  validator:
                      (value) =>
                          value != null && value.length >= 6
                              ? null
                              : 'Password must be 6+ chars',
                  style: GoogleFonts.poppins(color: primaryColor),
                ),
                const SizedBox(height: 30),

                // Login Button
                SizedBox(
                  width: double.infinity, //full width
                  child: ElevatedButton(
                    onPressed: _login, //calls _login then button is pressed
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      foregroundColor: onPrimaryColor,
                    ),
                    child: Text(
                      'Login',
                      style: GoogleFonts.poppins(fontSize: 16),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Footer
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegisterPage(),
                      ),
                    );
                  },
                  child: Text(
                    "Don't have an account? Register",
                    style: GoogleFonts.poppins(color: secondaryColor),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
