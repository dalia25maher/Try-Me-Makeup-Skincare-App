import 'package:flutter/material.dart';
import '../home_screen.dart';
import 'package:try_me/screens/cart_screen.dart';
import '../ProfileScreen.dart'; 
import 'fond.dart';
import 'loos.dart';
import 'prim.dart';


class MakeupProductsScreen extends StatelessWidget {
  const MakeupProductsScreen({super.key});

  final List<Map<String, dynamic>> products = const [
    {
      "name": "Dior Forever Skin Glow",
      "price": "EGP 500",
      "oldPrice": "EGP 4400",
      "image": "assets/fond.png",
      "detailsScreen": Fond(), 
    },
    {
      "name": "huda beauty loose baking",
      "price": "EGP 250",
      "oldPrice": "EGP 3000 ",
      "image": "assets/loos.png",
      "detailsScreen": Loos(), 
    },
    {
      "name": "Infaillible Mattifying Priming Base Clear",
      "price": "EGP 150",
      "oldPrice": "EGP 1000",
      "image": "assets/prim.png",
      "detailsScreen":Prim(), 
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Image.asset(
          'assets/logo2.jpg',
          height: 60,
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: products.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.7,
          ),
          itemBuilder: (context, index) {
            final product = products[index];
            return _buildProductCard(
              context,
              product["name"],
              product["price"],
              product["oldPrice"],
              product["image"],
              product["detailsScreen"],
            );
          },
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.pink,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          } else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfileScreen()),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CartScreen()), 
            );
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: ""),
        ],
      ),
    );
  }

  Widget _buildProductCard(BuildContext context, String name, String price,
      String oldPrice, String image, Widget detailsScreen) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => detailsScreen),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                  child: Image.asset(
                    image,
                    height: 120,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                const Positioned(
                  right: 8,
                  top: 8,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Text(
                    price,
                    style: const TextStyle(
                        color: Colors.pink, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    oldPrice,
                    style: const TextStyle(
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
              child: Row(
                children: [
                  Text("Review (4.6)"),
                  SizedBox(width: 5),
                  Icon(Icons.star, color: Colors.amber, size: 16),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                margin: const EdgeInsets.only(right: 8, bottom: 8),
                decoration: const BoxDecoration(
                  color: Colors.pink,
                  shape: BoxShape.circle,
                ),
                child: const Padding(
                  padding: EdgeInsets.all(6.0),
                  child: Icon(Icons.add, color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
