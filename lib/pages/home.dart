import 'package:flutter/material.dart';
import 'package:shall/models/category.dart';
import 'package:shall/models/product.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  List<Category> categories = [];
  static const double categoriesElemWidth = 150;
  static const double categoriesElemHeight = 180;

  List<Category> shops = [];
  static const double shopsElemWidth = 130;
  static const double shopsElemHeight = 150;

  List<Product> topDiscounts = [];
  static const double topDiscountsWidth = 100;
  static const double topDiscountsHeight = 160;

  @override
  Widget build(BuildContext context) {
    categories = buildCategories();
    shops = buildShops();
    topDiscounts = buildTopDiscounts();
    return Scaffold(
      appBar: appBar(),
      body: pageBody(),

    );
  }

  Widget pageBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textField(),
      
          headerText("Categories"),
          SizedBox(
            height: 10,
          ),
          horizontalScroll(categoriesElemHeight, categoriesElemWidth, categories),
      
          headerText("Shops"),
          SizedBox(
            height: 10,
          ),
          horizontalScroll(shopsElemHeight, shopsElemWidth, shops),
      
          headerText("Top Discounts"),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: topDiscounts.length ~/ 2 * (topDiscountsHeight + 20),
            child: GridView.count(
              padding: EdgeInsets.only(left: 20, right: 20),
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              crossAxisCount: 3,
              physics: NeverScrollableScrollPhysics(),
              children: List.generate(topDiscounts.length, (index) {
                return Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(

                      ),
                    ],
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.green[600],
                  ),
                  width: topDiscountsWidth,
                  height: topDiscountsHeight,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(topDiscounts[index].imagePath, scale: categoriesElemWidth / 70,),
                      Column(
                        children: [
                          Text(topDiscounts[index].name),
                          Text(topDiscounts[index].price),
                        ],
                      )
                    ],
                  ),
                );
              }),
            ),
          )
        ],
      ),
    );
  }

  SizedBox horizontalScroll(double height, double width, List<Category> scrollable) {
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
      Category(name: "Food", icon: Icons.lunch_dining, height: categoriesElemHeight, width: categoriesElemWidth)
    );
    categories.add(
      Category(name: "Electronics", icon: Icons.smartphone, height: categoriesElemHeight, width: categoriesElemWidth)
    );
    categories.add(
      Category(name: "Grocery", icon: Icons.shopping_basket, height: categoriesElemHeight, width: categoriesElemWidth)
    );
    categories.add(
      Category(name: "Hobbies", icon: Icons.book, height: categoriesElemHeight, width: categoriesElemWidth)
    );

    return categories;
  }

  List<Category> buildShops() {
    List<Category> shops = [];

    shops.add(
      Category(name: "Maxima", icon: Icons.abc, height: shopsElemHeight, width: shopsElemWidth)
    );
    shops.add(
      Category(name: "Lidl", icon: Icons.arrow_back, height: shopsElemHeight, width: shopsElemWidth)
    );
    shops.add(
      Category(name: "Hesburger", icon: Icons.lunch_dining, height: shopsElemHeight, width: shopsElemWidth)
    );
    shops.add(
      Category(name: "Rimi", icon: Icons.breakfast_dining, height: shopsElemHeight, width: shopsElemWidth)
    );

    return shops;
  }

  List<Product> buildTopDiscounts() {
    List<Product> discounts = [];

    discounts.add(
      Product(name: "Cheeseburger", price: "1.00€", imagePath: "images/cheeseburger.jpg", height: topDiscountsHeight, width: topDiscountsWidth)
    );
    discounts.add(
      Product(name: "Maxima", price: "1.00€", imagePath: "images/cheeseburger.jpg", height: topDiscountsHeight, width: topDiscountsWidth)
    );
    discounts.add(
      Product(name: "Maxima", price: "1.00€", imagePath: "images/cheeseburger.jpg", height: topDiscountsHeight, width: topDiscountsWidth)
    );
    discounts.add(
      Product(name: "Maxima", price: "1.00€", imagePath: "images/cheeseburger.jpg", height: topDiscountsHeight, width: topDiscountsWidth)
    );

    return discounts;
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