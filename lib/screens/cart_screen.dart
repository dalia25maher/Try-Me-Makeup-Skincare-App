import 'package:flutter/material.dart';
import 'package:try_me/screens/cartAllData.dart';


class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    int totalPrice = CartData.cartItems.fold(
      0,
      (sum, item) => sum + (item.price * item.quantity),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Cart",
          style: TextStyle(color: Color.fromRGBO(156, 39, 176, 1)),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Color.fromARGB(255, 215, 139, 229),),
        elevation: 0,
      ),
      body: CartData.cartItems.isEmpty
          ? const Center(
              child: Text(
                "empty",
                style: TextStyle(fontSize: 18),
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(12),
                    itemCount: CartData.cartItems.length,
                    itemBuilder: (context, index) {
                      final item = CartData.cartItems[index];
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        margin: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 4),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                    
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset(
                                  item.image,
                                  width: 70,
                                  height: 70,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(width: 12),

                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.name,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      "Size: 40",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      "EGP ${item.price}",
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.purple,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    CartData.removeAt(index);
                                  });
                                },
                                icon: const Icon(Icons.delete,
                                    color: Colors.purple),
                              ),

                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        if (item.quantity > 1) {
                                          item.quantity--;
                                        }
                                      });
                                    },
                                    icon: const Icon(Icons.remove_circle,
                                        color: Colors.purple),
                                  ),
                                  Text(
                                    "${item.quantity}",
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        item.quantity++;
                                      });
                                    },
                                    icon: const Icon(Icons.add_circle,
                                        color: Colors.purple),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),

                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(color: Colors.grey.shade300),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Total price",
                            style: TextStyle(color: Colors.grey),
                          ),
                          Text(
                            "EGP $totalPrice",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 215, 139, 229),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Payment completed successfully")),
                          );
                        },
                        child: const Row(
                          children: [
                            Text("Check Out"),
                            SizedBox(width: 8),
                            Icon(Icons.arrow_forward),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
