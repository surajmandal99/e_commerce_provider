import 'package:e_commerce_provider/models/my_product.dart';
import 'package:flutter/material.dart';

import '../widgets/product_card.dart';

class HomeScreens extends StatefulWidget {
  const HomeScreens({super.key});

  @override
  State<HomeScreens> createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {
  int isSelected = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text(
            "Our Products",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildProductCategory(index: 0, name: 'All Product'),
              _buildProductCategory(index: 1, name: 'Jackets'),
              _buildProductCategory(index: 2, name: 'Sneakers'),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          _buildAllProduct(),
        ],
      ),
    );
  }

//fun for product cat

  _buildProductCategory({required int index, required String name}) =>
      Container(
          width: 100,
          height: 40,
          margin: const EdgeInsets.only(top: 10, right: 10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected == index ? Colors.red : Colors.black,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            name,
            style: const TextStyle(color: Colors.white),
          ));

  //fun for all proudct

  _buildAllProduct() => Expanded(
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: (100 / 140),
                crossAxisSpacing: 12,
                mainAxisSpacing: 12),
            itemCount: MyProducts.allProducts.length,
            itemBuilder: (context, index) {
              final allProducts = MyProducts.allProducts[index];
              return ProductCard(
                product: allProducts,
              );
            }),
      );
}
