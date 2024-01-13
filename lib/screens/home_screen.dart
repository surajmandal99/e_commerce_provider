import 'package:e_commerce_provider/models/my_product.dart';
import 'package:e_commerce_provider/screens/details_screen.dart';
import 'package:flutter/material.dart';

import '../widgets/product_card.dart';

class HomeScreens extends StatefulWidget {
  const HomeScreens({super.key});

  @override
  State<HomeScreens> createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {
  //tab bar slider index
  int isSelected = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Our Products",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          const SizedBox(
            height: 20,
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
            height: 30,
          ),
          Expanded(
              child: isSelected == 0
                  ? _buildAllProduct()
                  : isSelected == 1
                      ? _buildJackets()
                      : _buildSneakers())
        ],
      ),
    );
  }

//fun for product cat

  _buildProductCategory({required int index, required String name}) =>
      GestureDetector(
        onTap: () => setState(() => isSelected = index),
        child: Container(
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
            )),
      );

  //fun for all proudct

  _buildAllProduct() => GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: (100 / 140),
          crossAxisSpacing: 12,
          mainAxisSpacing: 12),
      itemCount: MyProducts.allProducts.length,
      itemBuilder: (context, index) {
        final allProducts = MyProducts.allProducts[index];
        return GestureDetector(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailsScreen(product: allProducts))),
          child: ProductCard(
            product: allProducts,
          ),
        );
      });

  //fun for get jacket category
  _buildJackets() => GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: (100 / 140),
          crossAxisSpacing: 12,
          mainAxisSpacing: 12),
      scrollDirection: Axis.vertical,
      itemCount: MyProducts.jacketsList.length,
      itemBuilder: (context, index) {
        final jacketList = MyProducts.jacketsList[index];
        return GestureDetector(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailsScreen(product: jacketList))),
          child: ProductCard(
            product: jacketList,
          ),
        );
      });

  _buildSneakers() => GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: (100 / 140),
          crossAxisSpacing: 12,
          mainAxisSpacing: 12),
      scrollDirection: Axis.vertical,
      itemCount: MyProducts.sneakersList.length,
      itemBuilder: (context, index) {
        final sneakersList = MyProducts.sneakersList[index];
        return GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        DetailsScreen(product: sneakersList))),
            child: ProductCard(
              product: sneakersList,
            ));
      });
}
