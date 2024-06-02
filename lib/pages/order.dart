import 'package:flutter/material.dart';

class OrderPage extends StatelessWidget {
  final List<Map<String, String>> cartItems;

  const OrderPage({Key? key, required this.cartItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
        backgroundColor: Color.fromRGBO(121, 60, 72, 1),
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          final item = cartItems[index];
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