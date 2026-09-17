import 'package:flutter/material.dart';
import 'ProfileScreen.dart'; 
import 'package:try_me/screens/cart_screen.dart';
import 'Hair/HairProductsScreen.dart';
import 'Body/BodyProductsScreen.dart';
import 'Skin/SkinProductsScreen.dart';
import 'Makeup/MakeupProductsScreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
            child: Image.asset(
                  "assets/banner.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Categories",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 12),

            SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _buildCategory(context, "assets/hair.jpg", "Hair Product"),
                  _buildCategory(context, "assets/skin.jpg", "Skin Product"),
                  _buildCategory(context, "assets/body.jpg", "Body Product"),
                  _buildCategory(context, "assets/makeup.jpg", "Makeup"),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  "assets/description.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
  backgroundColor: Colors.pink,
  selectedItemColor: Colors.white,
  unselectedItemColor: Colors.white70,
  currentIndex: 0, 
  onTap: (index) {
    if (index == 0) {
  
    } else if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ProfileScreen()),
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
)

    );
  }

  static Widget _buildCategory(
      BuildContext context, String image, String label) {
    return InkWell(
      onTap: () {
        if (label == "Hair Product") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HairProductsScreen()),
          );
        } else if (label == "Skin Product") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SkinProductsScreen()),
          );
        } else if (label == "Body Product") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const BodyProductsScreen()),
          );
        } else if (label == "Makeup") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MakeupProductsScreen()),
          );
        }
      },
      child: Container(
        width: 80,
        margin: const EdgeInsets.only(right: 16),
        child: Column(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(image),
            ),
            const SizedBox(height: 6),
            Text(
              label,
              style: const TextStyle(fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
