import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shall/decoration.dart';
import 'package:shall/models/category.dart';
import 'package:shall/models/shop.dart';
import 'package:shall/header_text.dart';
import 'package:shall/pages/outifit.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({super.key});

  List<Category> categories = [];
  static const double categoriesElemWidth = 150;
  static const double categoriesElemHeight = 180;

  List<Shop> shops = [];
  static const double shopsElemWidth = 130;
  static const double shopsElemHeight = 100;


  @override
  Widget build(BuildContext context) {
    categories = buildCategories();
    shops = buildShops();
    return pageBody(context);
  }

  Widget pageBody(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [      
            headerText("Categories"),
            SizedBox(
              height: 10,
            ),
            horizontalCategoryScroll(categoriesElemHeight, categoriesElemWidth, categories),  
      
            headerText("Top shops"),
            shopsGrid(shops, shopsElemHeight, shopsElemWidth, context),
            Container(
              decoration: BoxDecoration (border: Border.all(color: Colors.black, width: 2)),
              child: Center(child: Text("More") ,
              ),
            ),
            SizedBox(height: 56)
          ],
        ),
      ),
    );
  }

  SizedBox shopsGrid(List<Shop> elements, double elemHeight, double elemWidth, BuildContext context) {
    return SizedBox(
      height: elements.length * elemHeight-(elemHeight*2),
          child: GridView.count(
            childAspectRatio: elemWidth / elemHeight,
            crossAxisCount: 2,
            physics: NeverScrollableScrollPhysics(),
            children: List.generate(elements.length, (index) {
              return Container(
                decoration: UIDecoration.boxDecoration(),
                child: Column(
                  children: [
                      Container(
                        padding: EdgeInsets.all(5), 
                        child: SvgPicture.asset(elements[index].imagePath, height: shopsElemHeight, width: shopsElemWidth)
                      ),
                  ],
                ),
              );
            }),
          ),
    );
  }

  SizedBox horizontalCategoryScroll(double height, double width, List<Category> scrollable) {
    return SizedBox(
      height: height,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: scrollable.length,
        itemBuilder: (context, index) {
          return Container(
            width: width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.black, width: 4),
              // boxShadow: [
              //   BoxShadow(
              //     color: const Color(0x401D1617),
              //     blurRadius: 40,
              //     spreadRadius: 0,
              //   )
              // ]
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  scrollable[index].icon,
                  size: width * 0.60,
                  color: Colors.black,
                ),
                Text(
                  scrollable[index].name,
                  style: TextStyle(color: Colors.black),
                  ),
              ],

            ),
          );
        },
        separatorBuilder:(context, index) => SizedBox(width: 25,),
        padding: EdgeInsets.only(left: 20, right: 20),
      ),
    );
  }


  List<Category> buildCategories() {
    List<Category> categories = [];

    categories.add(
      Category(name: "Discounts", icon: Icons.discount, height: categoriesElemHeight, width: categoriesElemWidth)
    );
    categories.add(
      Category(name: "Female", icon: Icons.female, height: categoriesElemHeight, width: categoriesElemWidth)
    );
    categories.add(
      Category(name: "Male", icon: Icons.male, height: categoriesElemHeight, width: categoriesElemWidth)
    );
    categories.add(
      Category(name: "Child", icon: Icons.baby_changing_station, height: categoriesElemHeight, width: categoriesElemWidth)
    );

    return categories;
  }

  List<Shop> buildShops() {
    List<Shop> shops = [];

    shops.add(
      Shop(name: "Louis Vuitton", imagePath: "images/louis_vuitton.svg", height: shopsElemHeight, width: shopsElemWidth)
    );
    shops.add(
      Shop(name: "HM", imagePath: "images/hm.svg", height: shopsElemHeight, width: shopsElemWidth)
    );
    shops.add(
      Shop(name: "Zara", imagePath: "images/zara.svg", height: shopsElemHeight, width: shopsElemWidth)
    );
    shops.add(
      Shop(name: "Adidas", imagePath: "images/adidas.svg", height: shopsElemHeight, width: shopsElemWidth)
    );
    shops.add(
      Shop(name: "Nike", imagePath: "images/nike.svg", height: shopsElemHeight, width: shopsElemWidth)
    );
    shops.add(
      Shop(name: "Puma", imagePath: "images/puma.svg", height: shopsElemHeight, width: shopsElemWidth)
    );
    shops.add(
      Shop(name: "Sportland", imagePath: "images/sportland.svg", height: shopsElemHeight, width: shopsElemWidth)
    );
    shops.add(
      Shop(name: "Tommy Hilfiger", imagePath: "images/tommy_hilfiger.svg", height: shopsElemHeight, width: shopsElemWidth)
    );

    return shops;
  }}