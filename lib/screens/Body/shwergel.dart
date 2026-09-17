import 'package:flutter/material.dart';
import 'package:try_me/screens/cartAllData.dart';

class Shwergel extends StatelessWidget {
  const Shwergel({super.key});

  @override
  Widget build(BuildContext context) {
    final product = Product(
      name: "Shower Gel BATH AND BODY WORKS",
      price: 120,
      image: "assets/shawergel.jpg",
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Product Details"),
        centerTitle: true,
        backgroundColor:  Colors.purple,
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
                  style: TextStyle(fontSize: 18, color:  Colors.purple),
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
                    color:  Colors.purple.shade50,
                  ),
                  child: Text("1000 Sold"),
                ),
                SizedBox(width: 16),
                Icon(Icons.star, color: Colors.amber, size: 20),
                Text("4.7 (6,200)"),
              ],
            ),
            SizedBox(height: 16),

            Text(
              "Description",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "Fresh, cleansing, and luxurious — Bath & Body Works shower gel leaves your skin refreshed and fragrant all day.",
              style: TextStyle(color: Colors.grey[700]),
            ),
            SizedBox(height: 16),

            // المقاسات
            Text(
              "Size",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                _buildSizeButton("s"),
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
                      SnackBar(content: Text("Product added")),
                    );
                  },
                  icon: Icon(Icons.shopping_cart),
                  label: Text("Add to cart"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor:const Color.fromARGB(255, 215, 139, 229),
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
