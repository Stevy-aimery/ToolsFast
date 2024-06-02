import 'package:flutter/material.dart';
import 'package:toolsfast/pages/details.dart';
import 'package:toolsfast/pages/order.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> categories = [
    'All',
    'Books',
    'Electronics',
    'Fashion',
    'Home Appliances',
    'Toys',
  ];

  final List<Map<String, String>> products = [
    {
      'name': 'Smartphone',
      'price': '699',
      'description': 'A high-end smartphone with a powerful processor.',
      'image': 'images/Logo2.png',
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
      'image': 'image/Logo2-Removebg.png',
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
      'image': 'images/Logo.png',
      'category': 'Books',
    },
    {
      'name': 'Roman',
      'price': '20',
      'description': 'An engaging mystery novel.',
      'image': 'https://via.placeholder.com/150',
      'category': 'Books',
    },
    {
      'name': 'Toy Car',
      'price': '15',
      'description': 'A small toy car for kids.',
      'image':
          'https://i.pinimg.com/564x/1c/2a/fd/1c2afd5df5bc136bfbae9ce51386cd5f.jpg',
      'category': 'Toys',
    },
  ];

  String selectedCategory = 'All';
  List<Map<String, String>> cartItems = [];

  List<Map<String, String>> get filteredProducts {
    if (selectedCategory == 'All') {
      return products;
    }
    return products
        .where((product) => product['category'] == selectedCategory)
        .toList();
  }

  void addToCart(Map<String, String> product) {
    setState(() {
      cartItems.add(product);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'images/Logo2-Removebg.png', 
              width: 40,
              height: 40,
            ),
            SizedBox(width: 50),
            Text('Home'),
          ],
        ),
        backgroundColor: Color.fromRGBO(121, 60, 72, 1),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => OrderPage(cartItems: cartItems),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Categories',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              SizedBox(
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
                              ? Color.fromRGBO(121, 60, 72, 1)
                              : Color.fromARGB(255, 130, 107, 107),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            categories[index],
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w300),
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
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.7,
                ),
                itemCount: filteredProducts.length,
                itemBuilder: (context, index) {
                  final product = filteredProducts[index];
                  return Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(15),
                          ),
                          child: Image.network(
                            product['image']!,
                            height: 110,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
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
                              Text('${product['price']} Dhs',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Color.fromARGB(255, 238, 77, 77),
                                      fontWeight: FontWeight.bold)),
                              SizedBox(height: 5),
                              Text(
                                product['description']!,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontFamily: 'Poppins', fontSize: 12),
                              ),
                              SizedBox(height: 10),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ProductDetails(
                                          product: product,
                                        ),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Color.fromRGBO(121, 60, 72, 1),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  child: const Text(
                                    'Buy now',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
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