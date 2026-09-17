import 'package:flutter/material.dart';
import 'package:try_me/screens/cartAllData.dart'; 

class Fond extends StatelessWidget {
  const Fond ({super.key});

  @override
  Widget build(BuildContext context) {
 
    final product = Product(
      name: "Dior Forever Skin Glow",
      price: 500,
      image: "assets/fond.png",
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Product Details"),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
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
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  product.name,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  "EGP ${product.price}",
                  style: TextStyle(fontSize: 18, color: Colors.purple),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.purple.shade50,
                  ),
                  child: Text("4400 Sold"),
                ),
                SizedBox(width: 16),
                Icon(Icons.star, color: Colors.amber, size: 20),
                Text("4.8 (7,500)"),
              ],
            ),
            SizedBox(height: 16),

            Text(
              "Description",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "Dior Forever Skin Glow – a long-lasting radiant foundation that hydrates, evens skin tone, and leaves your complexion luminous all day.",
              style: TextStyle(color: Colors.grey[700]),
            ),
            SizedBox(height: 16),

            Text(
              "Size",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                _buildSizeButton("S"),
                SizedBox(width: 8),
              ],
            ),
            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Total price", style: TextStyle(color: Colors.grey[600])),
                    Text(
                      "EGP ${product.price}",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                  icon: Icon(Icons.shopping_cart),
                  label: Text("Add to cart"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 215, 139, 229),
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
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

  Widget _buildSizeButton(String size) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.purple.shade100,
      ),
      child: Text(size),
    );
  }
}
