import 'package:flutter/material.dart';
import 'package:shall/header_text.dart';
import 'package:shall/models/product.dart';
import 'package:shall/price_selection.dart';
import 'package:shall/decoration.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.8,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          headerText(product.name),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25),
            child: Center(child: Image.asset(product.imagePath)),
          ),
          Center(
            child: PriceSelection(product: product,),
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.1,
                  decoration: BoxDecoration(
                    boxShadow: [
                      UIDecoration.boxShadow(),
                    ],
                    borderRadius: BorderRadius.circular(15),
                    color: const Color.fromRGBO(66, 66, 66, 1),
                  ),
                  child: Center(child: Text("Activate discount", style: TextStyle(fontFamily: 'Rubik', fontWeight: FontWeight.w900, fontSize: 30))),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}