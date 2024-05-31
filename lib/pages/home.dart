import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> categories = [
    'All',
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
      'category': 'Electronics',
    },
    {
      'name': 'Laptop',
      'price': '999',
      'description': 'A sleek laptop with great performance.',
      'image': 'https://via.placeholder.com/150',
      'category': 'Electronics',
    },
    {
      'name': 'Headphones',
      'price': '199',
      'description': 'Noise-cancelling over-ear headphones.',
      'image': 'https://via.placeholder.com/150',
      'category': 'Electronics',
    },
    {
      'name': 'Smartwatch',
      'price': '299',
      'description': 'A smartwatch with various health-tracking features.',
      'image': 'https://via.placeholder.com/150',
      'category': 'Electronics',
    },
    {
      'name': 'Camera',
      'price': '499',
      'description': 'A DSLR camera with high resolution.',
      'image': 'https://via.placeholder.com/150',
      'category': 'Electronics',
    },
    {
      'name': 'T-shirt',
      'price': '29',
      'description': 'A comfortable cotton T-shirt.',
      'image': 'https://via.placeholder.com/150',
      'category': 'Fashion',
    },
    {
      'name': 'Blender',
      'price': '49',
      'description': 'A powerful blender for smoothies and shakes.',
      'image': 'https://via.placeholder.com/150',
      'category': 'Home Appliances',
    },
    {
      'name': 'Novel',
      'price': '19',
      'description': 'An engaging mystery novel.',
      'image': 'https://via.placeholder.com/150',
      'category': 'Books',
    },
    {
      'name': 'Toy Car',
      'price': '15',
      'description': 'A small toy car for kids.',
      'image': 'https://via.placeholder.com/150',
      'category': 'Toys',
    },
  ];

  String selectedCategory = 'All';

  List<Map<String, String>> get filteredProducts {
    if (selectedCategory == 'All') {
      return products;
    }
    return products
        .where((product) => product['category'] == selectedCategory)
        .toList();
  }

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
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedCategory = categories[index];
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 8.0),
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8.0),
                        decoration: BoxDecoration(
                          color: selectedCategory == categories[index]
                              ? Colors.blue
                              : Colors.grey,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            categories[index],
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
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
                itemCount: filteredProducts.length,
                itemBuilder: (context, index) {
                  final product = filteredProducts[index];
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
