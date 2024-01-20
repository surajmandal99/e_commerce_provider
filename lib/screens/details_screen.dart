import 'package:e_commerce_provider/models/products_model.dart';
import 'package:e_commerce_provider/provider/cart_provider.dart';
import 'package:e_commerce_provider/screens/cart_details_screen.dart';

import 'package:e_commerce_provider/widgets/availabe_size.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailsScreen extends StatelessWidget {
  final Product product;
  const DetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details Screen"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 60, top: 10),
                  child: Container(
                    width: 250,
                    height: 250,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                            transform: GradientRotation(50),
                            colors: [Colors.red, Colors.yellow, Colors.grey])),
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Image.asset(
                        product.image,
                        // fit: BoxFit.none,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              height: 400,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40))),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        product.name.toUpperCase(),
                        style: const TextStyle(
                            fontSize: 26, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '\$' '${product.price}',
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  Text(
                    product.description.toLowerCase(),
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Availabel SIze",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Row(
                    children: [
                      AvailableSize(size: "Us 5"),
                      AvailableSize(size: "Us 6"),
                      AvailableSize(size: "Us 7"),
                      AvailableSize(size: "Us 8")
                    ],
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  const Row(children: [
                    Text(
                      "Available Colors",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ]),
                  const SizedBox(
                    height: 14,
                  ),
                  const Row(
                    children: [
                      CircleAvatar(
                        radius: 16,
                        backgroundColor: Colors.yellow,
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      CircleAvatar(
                        radius: 16,
                        backgroundColor: Colors.red,
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      CircleAvatar(
                        radius: 16,
                        backgroundColor: Colors.black,
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomSheet: BottomAppBar(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          alignment: Alignment.center,
          width: double.infinity,
          height: MediaQuery.of(context).size.height / 10,
          decoration: const BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$' '${product.price}',
                style:
                    const TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  provider.addToCart(product);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CartDetailsScreen()));
                },
                icon: const Icon(Icons.send_rounded),
                label: const Text("Add To Cart"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
