import 'package:flutter/material.dart';

import '../models/models.dart';

class ItemProduct extends StatelessWidget {
  final ProductSearch product;
  final Function()? onPress;
  const ItemProduct({
    Key? key,
    required this.product,
    this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      margin: const EdgeInsets.only(bottom: 20, left: 10, right: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        onTap: onPress,
        leading: Image.network(product.thumbnail),
        title: Text(
          product.title,
        ),
        subtitle: Text("${product.price} ${product.currencyId}"),
      ),
    );
  }
}
