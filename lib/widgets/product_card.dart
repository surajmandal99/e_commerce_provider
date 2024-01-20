import 'package:e_commerce_provider/provider/favorite_provider.dart';
import 'package:flutter/material.dart';

import '../models/products_model.dart';

class ProductCard extends StatefulWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    final provider = FavoriteProvider.of(context);
    return Container(
      // height: 400,
      width: MediaQuery.of(context).size.width / 2,
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(8),
          color: Colors.white10),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () => provider.addToFavorites(widget.product),
              child: Icon(
                provider.isExist(widget.product)
                    ? Icons.favorite
                    : Icons.favorite_border_outlined,
                color: Colors.red,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 130,
          width: 130,
          child: Image.asset(
            widget.product.image,
            fit: BoxFit.contain,
          ),
        ),
        Text(
          widget.product.name,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        Text(
          widget.product.category,
          style: const TextStyle(fontSize: 14, color: Colors.red),
        ),
        Text(
          '\$' '${widget.product.price}',
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ]),
    );
  }
}
