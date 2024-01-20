import 'package:e_commerce_provider/widgets/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../provider/cart_provider.dart';

class CartDetailsScreen extends StatefulWidget {
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
                              child: Slidable(
                            endActionPane: ActionPane(
                                motion: const ScrollMotion(),
                                children: [
                                  SlidableAction(
                                    onPressed: (context) {
                                      finalList[index].quantity = 1;
                                      finalList.removeAt(index);
                                      setState(() {});
                                    },
                                    backgroundColor: Colors.red,
                                    foregroundColor: Colors.white,
                                    icon: Icons.delete,
                                    label: "Delete",
                                  )
                                ]),
                            child: ListTile(
                                leading: Image.asset(
                                  finalList[index].image,
                                  // fit: BoxFit.cover,
                                ),
                                title: Text(finalList[index].name),
                                subtitle:
                                    Text(finalList[index].price.toString()),
                                trailing: Column(
                                    // mainAxisSize: MainAxisSize.min,
                                    children: [
                                      buildProductQuality(Icons.remove, index),
                                      Text(
                                          finalList[index].quantity.toString()),
                                      buildProductQuality(Icons.add, index)
                                    ])),
                          )));
                    })),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              alignment: Alignment.center,
              width: double.infinity,
              height: 100,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10))),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${provider.getTotalPrice()}',
                      style: const TextStyle(
                          fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                    ElevatedButton.icon(
                        onPressed: () {
                          SnackBarUtils.showSnackBar(
                              context, "Payment is not implemented yet");
                        },
                        icon: const Icon(Icons.send),
                        label: const Text("Pay"))
                  ]),
            ),
          ],
        ));
  }
}
