import 'package:flutter/material.dart';

class OrderPage extends StatelessWidget {
  final List<Map<String, String>> cartItems;

  const OrderPage({super.key, required this.cartItems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Confirmation of purchase'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Purchase made successfully !!'),
              Text('Delivery in 3 hours to the pergola'),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Navigate back to the previous page
                  Navigator.pop(context);
                },
                child: Text('Back to product details'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}