import 'package:e_commerce_provider/models/products_model.dart';

class MyProducts {
  static List<Product> allProducts = [
    Product(
        name: "New Jacket",
        image: 'assets/jacket_pictures/jacket.png',
        description: "dlawejrt ads fdsofg df asdfd",
        price: 120,
        id: 1,
        quantity: 1,
        category: ''),
    Product(
        name: "New Sneakers",
        image: "assets/sneakers_picutures/sneakers.png",
        description: "dlawejrt ads fdsofg df asdfd",
        price: 120,
        id: 2,
        quantity: 1,
        category: ''),
  ];

  static List<Product> sneakersList = [
    Product(
        name: "New Sneakers",
        image: "assets/sneakers_picutures/sneakers.png",
        description: "dlawejrt ads fdsofg df asdfd",
        price: 120,
        id: 1,
        quantity: 1,
        category: ''),
  ];

  static List<Product> jacketsList = [
    Product(
        name: "New Sneakers",
        image: "assets/sneakers_picutures/sneakers.png",
        description: "dlawejrt ads fdsofg df asdfd",
        price: 120,
        id: 2,
        quantity: 1,
        category: ''),
    Product(
        name: "New Sneakers",
        image: "assets/sneakers_picutures/sneakers.png",
        description: "dlawejrt ads fdsofg df asdfd",
        price: 120,
        id: 3,
        quantity: 1,
        category: ''),
  ];
}
