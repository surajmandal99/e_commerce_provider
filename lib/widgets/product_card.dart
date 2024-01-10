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
    return Container(
      width: MediaQuery.of(context).size.width / 2,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: Colors.white),
      child: Column(children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(
              Icons.favorite_border_outlined,
              color: Colors.red,
            ),
          ],
        ),
        SizedBox(
          height: 130,
          width: 130,
          child: Image.asset(
            widget.product.image,
            fit: BoxFit.cover,
          ),
        ),
        Text(widget.product.name),
        Text(widget.product.category),
        Text('\$' '${widget.product.price}'),
      ]),
    );
  }
}
