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
      boxShadow: [ UIDecoration.boxShadow()],
      borderRadius: BorderRadius.circular(15),
      color: Colors.green[600],
    );
  }
}