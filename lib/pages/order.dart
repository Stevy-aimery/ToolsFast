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
        title: Text('My Cart'),
        backgroundColor: Color.fromRGBO(121, 60, 72, 1),
      ),
      body: ListView.builder(
        itemCount: widget.cartItems.length,
        itemBuilder: (context, index) {
          final item = widget.cartItems[index];
          return ListTile(
            leading: Image.network(item['image']!),
            title: Text(item['name']!),
            subtitle: Text('${item['price']} Dhs'),
          );
        },
      ),
    );
  }
}