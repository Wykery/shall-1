import 'package:flutter/material.dart';

AppBar appBar() {
  return AppBar(
    title: Text("Home", style: TextStyle(fontFamily: 'Rubik', fontWeight: FontWeight.w900, fontSize: 30),),
    centerTitle: true,
    elevation: 0,
    actions: [
        GestureDetector(
          onTap: () {
            print("test");
          },
          child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.green[600]
          ),
          margin: EdgeInsets.all(10),
          width: 37,
          height: 37,
          child: Icon(Icons.more_horiz),
                    ),
        ),
    ]
  );
}