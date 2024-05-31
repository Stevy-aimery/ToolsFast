import 'package:flutter/material.dart';

class Order extends StatelessWidget {
  final List<Map<String, String>> orders = [
    {
      'name': 'Pizza',
      'quantity': '2',
      'total': '20',
      'image': 'https://via.placeholder.com/90',
    },
    {
      'name': 'Burger',
      'quantity': '1',
      'total': '10',
      'image': 'https://via.placeholder.com/90',
    },
  ];

  @override
  Widget build(BuildContext context) {
    int total = orders.fold(0, (sum, item) => sum + int.parse(item['total']!));

    return Scaffold(
      appBar: AppBar(
        title: Text('Order'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                final order = orders[index];
                return ListTile(
                  leading: Image.network(order['image']!),
                  title: Text(order['name']!),
                  subtitle: Text('Quantity: ${order['quantity']}'),
                  trailing: Text('\$${order['total']}'),
                );
              },
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total Price',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text('\$${total.toString()}'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                // Handle checkout logic here
              },
              child: Text('CheckOut'),
            ),
          ),
        ],
      ),
    );
  }
}
