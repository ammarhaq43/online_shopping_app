import 'package:flutter/material.dart';
import 'product.dart';

class CartProvider with ChangeNotifier {
  final List<Product> _cartItems = [];

  List<Product> get cartItems => _cartItems;

  // Add product to cart
  void addToCart(Product product) {
    final existingProduct =
    _cartItems.firstWhere((item) => item.id == product.id, orElse: () => product);
    if (_cartItems.contains(existingProduct)) {
      existingProduct.quantity++;
    } else {
      _cartItems.add(product);
    }
    notifyListeners();
  }

  // Remove product from cart
  void removeFromCart(Product product) {
    _cartItems.remove(product);
    notifyListeners();
  }

  // Increase quantity
  void increaseQuantity(Product product) {
    final index = _cartItems.indexWhere((item) => item.id == product.id);
    if (index != -1) {
      _cartItems[index].quantity++;
      notifyListeners();
    }
  }

  // Decrease quantity
  void decreaseQuantity(Product product) {
    final index = _cartItems.indexWhere((item) => item.id == product.id);
    if (index != -1) {
      if (_cartItems[index].quantity > 1) {
        _cartItems[index].quantity--;
      } else {
        removeFromCart(product);
      }
      notifyListeners();
    }
  }

  // Clear cart
  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }

  // Calculate total price
  double get totalPrice {
    double total = 0.0;
    for (var product in _cartItems) {
      total += product.price * product.quantity;
    }
    return total;
  }
}
