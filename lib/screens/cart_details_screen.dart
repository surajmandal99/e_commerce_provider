import 'package:flutter/material.dart';

import '../provider/cart_provider.dart';

class CartDetailsScreen extends StatefulWidget {
  // final Product product;
  const CartDetailsScreen({super.key});

  @override
  State<CartDetailsScreen> createState() => _CartDetailsScreenState();
}

class _CartDetailsScreenState extends State<CartDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = CartProvider.of(context);
    final finalList = provider.cart;

    buildProductQuality(IconData icon, int index) {
      return GestureDetector(
          onTap: () {
            setState(() {
              icon == Icons.add
                  ? provider.incrementQuantity(index)
                  : provider.decrementQuantity(index);
            });
          },
          child: Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: Colors.red.shade100),
            child: Icon(
              icon,
              size: 20,
            ),
          ));
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text("My Cart"),
        ),
        body: Column(
          children: [
            Expanded(
                child: ListView.builder(
                    itemCount: finalList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                              child: ListTile(
                                  leading: Image.asset(finalList[index].image),
                                  title: Text(finalList[index].name),
                                  subtitle:
                                      Text(finalList[index].price.toString()),
                                  trailing: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        buildProductQuality(Icons.add, index),
                                        Text(finalList[index]
                                            .quantity
                                            .toString()),
                                        buildProductQuality(Icons.remove, index)
                                      ]))));
                    }))
          ],
        ));
  }
}
