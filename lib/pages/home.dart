import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final List<String> categories = [
    'Electronics',
    'Fashion',
    'Home Appliances',
    'Books',
    'Toys',
  ];

  final List<Map<String, String>> products = [
    {
      'name': 'Smartphone',
      'price': '699',
      'description': 'A high-end smartphone with a powerful processor.',
      'image': 'https://via.placeholder.com/150',
    },
    {
      'name': 'Laptop',
      'price': '999',
      'description': 'A sleek laptop with great performance.',
      'image': 'https://via.placeholder.com/150',
    },
    {
      'name': 'Headphones',
      'price': '199',
      'description': 'Noise-cancelling over-ear headphones.',
      'image': 'https://via.placeholder.com/150',
    },
    {
      'name': 'Smartwatch',
      'price': '299',
      'description': 'A smartwatch with various health-tracking features.',
      'image': 'https://via.placeholder.com/150',
    },
    {
      'name': 'Camera',
      'price': '499',
      'description': 'A DSLR camera with high resolution.',
      'image': 'https://via.placeholder.com/150',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.network(
              'https://via.placeholder.com/40', // Replace with your logo URL
              width: 40,
              height: 40,
            ),
            SizedBox(width: 10),
            Text('Home'),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Categories',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Container(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Chip(
                        label: Text(categories[index]),
                        backgroundColor: Colors.blue,
                        labelStyle: TextStyle(color: Colors.white),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Products',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.8,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return Card(
                    elevation: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(
                          product['image']!,
                          height: 120,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product['name']!,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text('\$${product['price']}',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.green)),
                              SizedBox(height: 5),
                              Text(
                                product['description']!,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
