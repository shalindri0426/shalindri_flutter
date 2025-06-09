import 'package:flutter/material.dart';

class PlaceOrderForm extends StatefulWidget {
  //UI updates needed - form validation
  const PlaceOrderForm({super.key});

  @override
  //connects widget to its mutable state
  State<PlaceOrderForm> createState() => _PlaceOrderFormState();
}

//manages form logic, input states, submissions
class _PlaceOrderFormState extends State<PlaceOrderForm> {
  //tracks form state for validation
  final _formKey = GlobalKey<FormState>();

  //each controller holds annd manages the inputs of each field - reads the content of 'TextFormField'
  //can get, set ,clear whats typed
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController productController = TextEditingController();
  final TextEditingController quantityController = TextEditingController(
    text: '1',
  ); //pe filled with default value '1'

  @override
  //this method is called when the screen is closed
  //clears memory when the widget is removed from the UI
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    addressController.dispose();
    productController.dispose();
    quantityController.dispose();
    super.dispose();
  }

  //runs when the user clicks the Place Order button
  //Validating the fields
  void _placeOrder() {
    //check if valid
    if (_formKey.currentState!.validate()) {
      //runs all the field validators
      ScaffoldMessenger.of(context).showSnackBar(
        //a popupmsg at the bottom
        const SnackBar(content: Text('Order placed successfully!')),
      );

      // clear the form fields
      _formKey.currentState!.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final backgroundColor = theme.primaryColor;
    final textColor = theme.scaffoldBackgroundColor;

    return Scaffold(
      appBar: AppBar(
        foregroundColor: textColor,
        title: const Text('Place Order'),
      ),
      //form layout
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            //allows scrolling if content exceeds the screen height
            children: [
              // Name
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Full Name',
                  border: OutlineInputBorder(),
                ),
                style: TextStyle(color: backgroundColor),
                validator:
                    (value) => //checks if not empty
                        value == null || value.isEmpty
                            ? 'Please enter your name'
                            : null,
              ),
              const SizedBox(height: 16),

              // Email
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email Address',
                  border: OutlineInputBorder(),
                ),
                style: TextStyle(color: backgroundColor),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return 'Please enter your email';
                  if (!RegExp(
                    r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$',
                  ).hasMatch(value)) {
                    //this pattern is used to check if an emailis valid
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Phone Number
              TextFormField(
                controller: phoneController,
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(),
                ),
                style: TextStyle(color: backgroundColor),
                keyboardType: TextInputType.phone,
                validator:
                    (value) =>
                        value == null || value.isEmpty
                            ? 'Please enter your phone number'
                            : null,
              ),
              const SizedBox(height: 16),

              // Shipping Address
              TextFormField(
                controller: addressController,
                decoration: const InputDecoration(
                  labelText: 'Shipping Address',
                  border: OutlineInputBorder(),
                ),
                style: TextStyle(color: backgroundColor),
                maxLines: 2,
                validator:
                    (value) =>
                        value == null || value.isEmpty
                            ? 'Please enter your address'
                            : null,
              ),
              const SizedBox(height: 16),

              // Product Name
              TextFormField(
                controller: productController,
                decoration: const InputDecoration(
                  labelText: 'Product Name',
                  border: OutlineInputBorder(),
                ),
                style: TextStyle(color: backgroundColor),
                validator:
                    (value) =>
                        value == null || value.isEmpty
                            ? 'Please enter the product name'
                            : null,
              ),
              const SizedBox(height: 16),

              // Quantity
              TextFormField(
                controller: quantityController,
                decoration: const InputDecoration(
                  labelText: 'Quantity',
                  border: OutlineInputBorder(),
                ),
                style: TextStyle(color: backgroundColor),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return 'Please enter quantity';
                  final qty = int.tryParse(value);
                  if (qty == null || qty <= 0)
                    return 'Quantity must be greater than 0';
                  return null;
                },
              ),
              const SizedBox(height: 30),
              //place order button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: backgroundColor,
                  foregroundColor: textColor,
                ),
                //when the button is clicked, '_placeOrder()' is called to validate and show success message
                onPressed: _placeOrder,
                child: const Text('Place Order'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
