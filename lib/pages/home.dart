import 'package:flutter/material.dart';
import 'package:shall/models/product.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  List<Product> categories = [];
  static const double categoriesElemWidth = 150;
  static const double categoriesElemHeight = 180;

  List<Product> topDiscounts = [];
  static const double topDiscountElemWidth = 100;
  static const double topDiscountElemHeight = 120;

  @override
  Widget build(BuildContext context) {
    categories = buildCategories();
    topDiscounts = buildTopDiscounts();
    return Scaffold(
      appBar: appBar(),
      body: pageBody(),

    );
  }

  Column pageBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textField(),

        headerText("Categories"),
        SizedBox(
          height: 10,
        ),
        horizontalScroll(categoriesElemHeight, categoriesElemWidth, categories),

        headerText("Top discounts"),
        SizedBox(
          height: 10,
        ),
        horizontalScroll(topDiscountElemHeight, topDiscountElemWidth, topDiscounts)
      ],
    );
  }

  SizedBox horizontalScroll(double height, double width, List<Product> scrollable) {
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

  List<Product> buildCategories() {
    List<Product> categories = [];

    categories.add(
      Product(name: "Food", icon: Icons.lunch_dining, height: categoriesElemHeight, width: categoriesElemWidth)
    );
    categories.add(
      Product(name: "Electronics", icon: Icons.smartphone, height: categoriesElemHeight, width: categoriesElemWidth)
    );
    categories.add(
      Product(name: "Grocery", icon: Icons.shopping_basket, height: categoriesElemHeight, width: categoriesElemWidth)
    );
    categories.add(
      Product(name: "Hobbies", icon: Icons.book, height: categoriesElemHeight, width: categoriesElemWidth)
    );

    return categories;
  }

  List<Product> buildTopDiscounts() {
    List<Product> categories = [];

    categories.add(
      Product(name: "Food", icon: Icons.lunch_dining, height: categoriesElemHeight, width: categoriesElemWidth)
    );
    categories.add(
      Product(name: "Electronics", icon: Icons.smartphone, height: categoriesElemHeight, width: categoriesElemWidth)
    );
    categories.add(
      Product(name: "Grocery", icon: Icons.shopping_basket, height: categoriesElemHeight, width: categoriesElemWidth)
    );
    categories.add(
      Product(name: "Hobbies", icon: Icons.book, height: categoriesElemHeight, width: categoriesElemWidth)
    );

    return categories;
  }

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

  Container textField() {
    return Container(
          margin: EdgeInsets.only(top: 40, left: 20, right: 20),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: const Color(0x401D1617),
                blurRadius: 40,
                spreadRadius: 0,
              )
            ]
          ),
          child: TextField(
            decoration: InputDecoration(
              filled: true,
              contentPadding: EdgeInsets.all(15),
              hintText: "Search",
              prefixIcon: Icon(Icons.search),
              suffixIcon: SizedBox(
                width: 100,
                child: IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      VerticalDivider(
                        color: Colors.green[600],
                        thickness: 1.0,
                        indent: 10,
                        endIndent: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Icon(Icons.tune),
                      ),
                    ]
                  ),
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        );
  }

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
}