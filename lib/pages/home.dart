import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shall/decoration.dart';
import 'package:shall/models/category.dart';
import 'package:shall/models/shop.dart';
import 'package:shall/header_text.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  List<Category> categories = [];
  static const double categoriesElemWidth = 150;
  static const double categoriesElemHeight = 180;

  List<Shop> shops = [];
  static const double shopsElemWidth = 130;
  static const double shopsElemHeight = 150;


  @override
  Widget build(BuildContext context) {
    categories = buildCategories();
    shops = buildShops();
    return pageBody(context);
  }

  Widget pageBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [      
          headerText("Categories"),
          SizedBox(
            height: 10,
          ),
          horizontalCategoryScroll(categoriesElemHeight, categoriesElemWidth, categories),  

          headerText("Top shops"),
          shopsGrid(shops, shopsElemHeight, shopsElemWidth, context)
        ],
      ),
    );
  }

  SizedBox shopsGrid(List<Shop> elements, double elemHeight, double elemWidth, BuildContext context) {
    return SizedBox(
          height: elements.length ~/ 2 * (elemHeight + 20) + 20,
          child: GridView.count(
            childAspectRatio: elemWidth / elemHeight,
            padding: EdgeInsets.only(left: 20, right: 20),
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            crossAxisCount: 2,
            physics: NeverScrollableScrollPhysics(),
            children: List.generate(elements.length, (index) {
              return Container(
                decoration: UIDecoration.boxDecoration(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      child: SvgPicture.asset(elements[index].imagePath,)
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
              color: Colors.green[600],
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: const Color(0x401D1617),
                  blurRadius: 40,
                  spreadRadius: 0,
                )
              ]
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  scrollable[index].icon,
                  size: width * 0.60,
                ),
                Text(scrollable[index].name),
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
      Shop(name: "Maxima", imagePath: "images/louis_vuitton.svg", height: shopsElemHeight, width: shopsElemWidth)
    );
    shops.add(
      Shop(name: "Lidl", imagePath: "images/hm.svg", height: shopsElemHeight, width: shopsElemWidth)
    );
    shops.add(
      Shop(name: "Hesburger", imagePath: "images/zara.svg", height: shopsElemHeight, width: shopsElemWidth)
    );
    // shops.add(
    //   Shop(name: "Senukai", imagePath: "images/senukai.svg", height: shopsElemHeight, width: shopsElemWidth)
    // );

    return shops;
  }}