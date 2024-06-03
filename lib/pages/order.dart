import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  final List<Map<String, String>> cartItems;

  const OrderPage({super.key, required this.cartItems});

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Confirmation of purchase'),
      ),
      body: Center(
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
    );
  }
}
