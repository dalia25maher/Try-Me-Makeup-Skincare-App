import 'package:flutter/material.dart';
import 'package:try_me/screens/cartAllData.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {

    final product = Product(
      name: "splash BATH AND BODY WORKS",
      price: 120,
      image: "assets/splash.jpg",
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Details"),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
  
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                  image: AssetImage(product.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 16),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  product.name,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  "EGP ${product.price}",
                  style: const TextStyle(fontSize: 18, color: Colors.purple),
                ),
              ],
            ),
            const SizedBox(height: 8),

            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.purple.shade50,
                  ),
                  child: const Text("1,500 Sold"),
                ),
                const SizedBox(width: 16),
                const Icon(Icons.star, color: Colors.amber, size: 20),
                const Text("4.8 (7,500)"),
              ],
            ),
            const SizedBox(height: 16),

            const Text(
              "Description",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              "Refresh your senses with Bath & Body Works Fragrance Mist — a light, irresistible spray that leaves you smelling fresh and beautifully scented all day.",
              style: TextStyle(color: Colors.grey[700]),
            ),
            const SizedBox(height: 16),

            const Text(
              "Size",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                _buildSizeButton("S"),
                const SizedBox(width: 8),
              ],
            ),
            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Total price", style: TextStyle(color: Colors.grey[600])),
                    Text(
                      "EGP ${product.price}",
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    CartData.addItem(product);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Product added")),
                    );
                  },
                  icon: const Icon(Icons.shopping_cart),
                  label: const Text("Add to cart"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 215, 139, 229),
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  static Widget _buildSizeButton(String size) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.purple.shade100,
      ),
      child: Text(size),
    );
  }
}
