import 'package:flutter/material.dart';
import 'package:shall/header_text.dart';

class CardsPage extends StatelessWidget {
  const CardsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            headerText("Maxima"),
            SizedBox(
              height: 10,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset("images/maxima.jpg"),
            ),

            headerText("Hesburger"),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset("images/hesburger.jpg"),
              ),
            ),

            headerText("Depo"),
            SizedBox(
              height: 10,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset("images/depo.jpg"),
            )
          ]
        ),
      )
    );
  }
}