import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  final List<Map<String, String>> cartItems;

  const OrderPage({super.key, required this.cartItems});

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Confirmation of purchase', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Color.fromRGBO(121, 60, 72, 1),
      ),
      body: Padding(
        padding: const EdgeInsets.all(100.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.check_circle_outline, size: 100, color: Colors.green),
            SizedBox(height: 20),
            Text(
              'Purchase made successfully!!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Delivery in 3 hours to the pergola',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 25),
            Divider(),
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

  double calculateTotal() {
    double total = 0.0;
    for (var item in widget.cartItems) {
      total += double.parse(item['price']!);
    }
    return total;
  }
}
