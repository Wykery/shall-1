import 'package:flutter/material.dart';

Column headerText(String str) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        height: 30,
      ),
      Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Text(
          str,
          style: TextStyle(
            fontFamily: 'Rubik',
            fontWeight: FontWeight.w900,
            fontSize: 20
          ),
        ),
      ),
    ],
  );
}