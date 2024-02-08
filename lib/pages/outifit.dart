import 'package:flutter/material.dart';
import 'package:shall/main.dart';
import 'package:shall/pages/home.dart';

class outfitChoicePage extends StatelessWidget {
  const outfitChoicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar (
        title: Text(
          "Choose your outfit",
          style: TextStyle(color: Colors.black),
          ),
        centerTitle: true,
      ),
       body: ListView (
       children: [
        SizedBox(height: 200,),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            padding: EdgeInsets.all(100),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(15)
              ),
              child: Icon(
                Icons.photo_camera, 
                size: 100, 
                color: Colors.black,
              ),
            ),
        ),
       ], 
      )
    );
  }
}