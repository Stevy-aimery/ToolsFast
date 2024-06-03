import 'package:flutter/material.dart';
import 'package:toolsfast/pages/order.dart';

class ProductDetails extends StatefulWidget {
  final Map<String, String> product;

  const ProductDetails({super.key, required this.product});

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  List<Map<String, String>> cartItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product['name']!),
        backgroundColor: Color.fromRGBO(121, 60, 72, 1),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              widget.product['image']!,
              height: 530,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            Text(
              widget.product['name']!,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              '${widget.product['price']} Dhs',
              style: TextStyle(
                  fontSize: 20, color: Color.fromARGB(255, 238, 77, 77)),
            ),
            SizedBox(height: 10),
            Text(
              widget.product['description']!,
              style: TextStyle(fontSize: 16),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                // Add the current product to the cart
                setState(() {
                  cartItems.add(widget.product);
                });

                // Navigate to the OrderPage
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OrderPage(cartItems: cartItems),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(121, 60, 72, 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(Icons.shopping_cart, color: Colors.white),
                  SizedBox(width: 8),
                  Text(
                    'Add to Cart',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
