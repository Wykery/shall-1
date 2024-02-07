import 'package:flutter/material.dart';
import 'package:shall/header_text.dart';
import 'package:shall/models/product.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.9,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          headerText(product.name),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25),
            child: Image.asset(product.imagePath),
          ),
          Center(
            child: DropdownButton(
              
            ),
          )
        ],
      ),
    );
  }
}