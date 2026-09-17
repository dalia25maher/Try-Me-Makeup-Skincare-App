class Product {
  final String name;
  final int price;
  final String image;
  int quantity; 

  Product({
    required this.name,
    required this.price,
    required this.image,
    this.quantity = 1, 
  });
}

class CartData {
  static List<Product> cartItems = [];

  static void addItem(Product item) {
    cartItems.add(item);
  }

  static void removeAt(int index) {
    if (index >= 0 && index < cartItems.length) {
      cartItems.removeAt(index);
    }
  }

  static void clearCart() {
    cartItems.clear();
  }
}
