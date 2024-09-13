import 'package:e_commerce_provider/models/products_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartProvider extends ChangeNotifier {
  final List<Product> _cart = [];
  List<Product> get cart => _cart;

  void addToCart(Product product) {
    if (_cart.contains(product)) {
      for (Product item in _cart) {
        item.quantity++;
      }
    } else {
      _cart.add(product);
    }
    notifyListeners();
  }

  incrementQuantity(int index) => _cart[index].quantity++;
  decrementQuantity(int index) => _cart[index].quantity--;

  getTotalPrice() {
    double total = 0.0;
    for (Product item in _cart) {
      total += item.price * item.quantity;
    }
    return total;
  }

  static CartProvider of(
    BuildContext context, {
    bool listen = true,
  }) {
    return Provider.of<CartProvider>(
      context,
      listen: listen,
    );
  }
}
