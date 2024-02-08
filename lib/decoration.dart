import 'package:flutter/material.dart';

class UIDecoration {
  
  static BoxShadow boxShadow() {
    return BoxShadow(
      color: const Color(0x401D1617),
      blurRadius: 40,
      spreadRadius: 0,
    );
  } 

  static BoxDecoration boxDecoration() {
    return BoxDecoration(
      color: const Color.fromARGB(255, 248, 248, 248),
      border: Border.all(color: Colors.black, width: 2)
    );
  }
}