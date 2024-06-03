import 'package:flutter/material.dart';
import 'package:toolsfast/pages/details.dart';
import 'package:toolsfast/pages/payComfirme.dart';

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
  ];

  final List<Map<String, String>> products = [
    {
      'name': 'Smartphone',
      'price': '2 500',
      'description': 'A high-end smartphone with a powerful processor.',
      'image': 'images/Trepier-smarphone.png',
      'category': 'Electronics',
    },
    {
      'name': 'Macintosh',
      'price': '5 999',
      'description': 'A sleek laptop with great performance.',
      'image': 'images/makboot-image.png',
      'category': 'Electronics',
    },
    {
      'name': 'Headphones',
      'price': '199',
      'description': 'Noise-cancelling over-ear headphones.',
      'image': 'images/casque.png',
      'category': 'Electronics',
    },
    {
      'name': 'Laptop',
      'price': '299',
      'description': 'A smartwatch with various health-tracking features.',
      'image': 'images/Ectro1-image.png',
      'category': 'Electronics',
    },
    {
      'name': 'Air pods',
      'price': '499',
      'description': 'A DSLR camera with high resolution.',
      'image': 'images/Electo2-image.png',
      'category': 'Electronics',
    },
    {
      'name': 'T-shirt',
      'price': '29',
      'description': 'A comfortable cotton T-shirt.',
      'image': 'images/F3-image.png',
      'category': 'Fashion',
    },    
    {
      'name': 'Shirt woman',
      'price': '29',
      'description': 'A comfortable cotton T-shirt.',
      'image': 'images/F1image.png',
      'category': 'Fashion',
    },
    {
      'name': 'Shirt and shoes Man',
      'price': '29',
      'description': 'A comfortable cotton T-shirt.',
      'image': 'images/F2-image.png',
      'category': 'Fashion',
    },
    {
      'name': 'Blender',
      'price': '49',
      'description': 'A powerful blender for smoothies and shakes.',
      'image': 'images/cuissine2-image.png',
      'category': 'Home Appliances',
    },
    {
      'name': 'cooking tools',
      'price': '49',
      'description': 'A powerful blender for smoothies and shakes.',
      'image': 'images/Cuissine.png',
      'category': 'Home Appliances',
    },
    {
      'name': 'Novel',
      'price': '19',
      'description': 'An engaging mystery novel.',
      'image': 'images/book1.png',
      'category': 'Books',
    },
    {
      'name': 'Roman',
      'price': '20',
      'description': 'An engaging mystery novel.',
      'image': 'images/Book2.png',
      'category': 'Books',
    },
  ];

  String selectedCategory = 'All';
  List<Map<String, String>> cartItems = [];
  List<Map<String, String>> searchResults = [];

  List<Map<String, String>> get filteredProducts {
    if (searchResults.isNotEmpty) {
      return searchResults;
    }
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
            SizedBox(width: 30),
            Text('Home'),
          ],
        ),
        backgroundColor: Color.fromRGBO(121, 60, 72, 1),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50.0, bottom: 30.0),
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      searchResults = products.where((product) {
                        return product['name']!
                            .toLowerCase()
                            .contains(value.toLowerCase());
                      }).toList();
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'Search product',
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.filter_list),
                      onPressed: () {},
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                child: Text(
                  'Categories',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
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
                          searchResults = [];
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
                padding: EdgeInsets.only(top: 20, bottom: 50),
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