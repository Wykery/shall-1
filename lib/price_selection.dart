import 'package:flutter/material.dart';
import 'package:shall/models/product.dart';

class PriceSelection extends StatefulWidget {

  final Product product;

  const PriceSelection({super.key, required this.product});

  @override
  State<PriceSelection> createState() => _PriceSelectionState();
}

class _PriceSelectionState extends State<PriceSelection> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: DropdownButton<int>(
        isExpanded: true,
        value: currentIndex,
        onChanged: (int? value) {
          setState(() {
            currentIndex = value!;
          });
        },
        items: List<DropdownMenuItem<int>>.generate(widget.product.allPrices.length, (int index) {
          return DropdownMenuItem<int>(
            value: index,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(widget.product.allPrices[index]),
                Text(widget.product.allShops[index]),
              ],
            ),
          );
        }),
      ),
    );
  }
}
