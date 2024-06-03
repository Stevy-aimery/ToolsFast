import 'package:flutter/material.dart';
import 'package:toolsfast/pages/order.dart';
import 'package:toolsfast/pages/see_compte.dart';

class ProductDetails extends StatefulWidget {
  final Map<String, String> product;

  const ProductDetails({super.key, required this.product});

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  List<Map<String, String>> cartItems = [];
  double total = 0.0; // Define the total variable here

  @override
  Widget build(BuildContext context) {
    // Remove non-numeric characters from the product price
    String price = widget.product['price']!.replaceAll(RegExp(r'[^0-9.]'), '');
    total = double.parse(price);// Set the initial total to the product price

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
              height: 430,
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
            SizedBox(height: 25),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total Price',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('${total.toString()} Dhs'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to the see_compte page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SeeCompte(),
                    ),
                  );
                },
                child: Text('Check balance'),
              ),
            ),
            Spacer(),
            Container(
              padding: EdgeInsets.only(bottom: 20),
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Check if the product is not already in the cart

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OrderPage(
                          cartItems: cartItems,
                        ),
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
                      SizedBox(width: 10),
                      Text(
                        'Validate payment',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
