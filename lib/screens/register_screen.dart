import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'login_screen.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>(); //validation
  //reads inputs
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  //validation method
  void _register() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Registration Successful!')));

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    }
  }

  //called when the screen is closed to clear the memory
  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  //builds the UI everytime flutter rebuilds the screen
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryColor = theme.colorScheme.primary;
    final onPrimaryColor = theme.colorScheme.onPrimary;
    final secondaryColor = theme.colorScheme.secondary;
    final scaffoldBackground = theme.scaffoldBackgroundColor;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
        backgroundColor: primaryColor,
        foregroundColor: onPrimaryColor,
        elevation: 0,
      ),
      backgroundColor: scaffoldBackground,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          //starts a form for validation using _formkey
          key: _formKey,
          child: Column(
            children: [
              _buildTextField(
                //reuses this method to create a reuseable input
                controller: _usernameController,
                label: 'Username',
                validator:
                    (value) =>
                        value == null || value.isEmpty
                            ? 'Enter a username'
                            : null,
                theme: theme,
                secondaryColor: secondaryColor,
              ),
              const SizedBox(height: 15),
              _buildTextField(
                controller: _emailController,
                label: 'Email',
                validator:
                    (value) =>
                        value == null || !value.contains('@')
                            ? 'Enter a valid email'
                            : null,
                theme: theme,
                secondaryColor: secondaryColor,
              ),
              const SizedBox(height: 15),
              _buildTextField(
                controller: _passwordController,
                label: 'Password',
                obscureText: true, //hidden text
                validator:
                    (value) =>
                        value == null || value.length < 6
                            ? 'Min 6 characters'
                            : null,
                theme: theme,
                secondaryColor: secondaryColor,
              ),
              const SizedBox(height: 15),
              _buildTextField(
                controller: _confirmPasswordController,
                label: 'Confirm Password',
                obscureText: true,
                validator: //password should match
                    (value) =>
                        value != _passwordController.text
                            ? 'Passwords do not match'
                            : null,
                theme: theme,
                secondaryColor: secondaryColor,
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _register, //calls this function on tap
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    backgroundColor: primaryColor,
                    foregroundColor: onPrimaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Register',
                    style: GoogleFonts.poppins(fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    //to remove the registerscreen from the back stack
                    context,
                    MaterialPageRoute(builder: (_) => const LoginPage()),
                  );
                },
                child: Text(
                  'Already have an account? Login',
                  style: GoogleFonts.poppins(color: secondaryColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //method - reuseable widget builds form fields
  //creates a form instead of writing the full TextFormField multiple times for each input field
  Widget _buildTextField({
    required TextEditingController controller, //manages inputs
    required String label,
    bool obscureText = false,
    required String? Function(String?) validator,
    required ThemeData theme,
    required Color secondaryColor,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: GoogleFonts.poppins(color: secondaryColor),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        filled: true,
        fillColor: theme.cardColor.withOpacity(0.15),
      ),
      style: GoogleFonts.poppins(color: theme.colorScheme.primary),
      validator: validator,
    );
  }
}
