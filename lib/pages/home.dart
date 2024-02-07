import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shall/decoration.dart';
import 'package:shall/models/category.dart';
import 'package:shall/models/product.dart';
import 'package:shall/models/product_view.dart';
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

  List<Product> topDiscounts = [];
  static const double topDiscountsWidth = 100;
  static const double topDiscountsHeight = 150;

  @override
  Widget build(BuildContext context) {
    categories = buildCategories();
    shops = buildShops();
    topDiscounts = buildTopDiscounts();
    return pageBody(context);
  }

  Widget pageBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textField(),
      
          headerText("Categories"),
          SizedBox(
            height: 10,
          ),
          horizontalCategoryScroll(categoriesElemHeight, categoriesElemWidth, categories),
      
          headerText("Shops"),
          SizedBox(
            height: 10,
          ),
          horizontalShopScroll(shopsElemHeight, shopsElemWidth, shops),
      
          headerText("Top Discounts"),
          SizedBox(
            height: 10,
          ),
          productGrid(topDiscounts, topDiscountsHeight, topDiscountsWidth, context)
        ],
      ),
    );
  }

  SizedBox productGrid(List<Product> elements, double elemHeight, double elemWidth, BuildContext context) {
    return SizedBox(
          height: elements.length ~/ 2 * (elemHeight + 20) + 20,
          child: GridView.count(
            childAspectRatio: elemWidth / elemHeight,
            padding: EdgeInsets.only(left: 20, right: 20),
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            crossAxisCount: 3,
            physics: NeverScrollableScrollPhysics(),
            children: List.generate(elements.length, (index) {
              return GestureDetector(
                onTap: () async{
                  await showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (BuildContext context) {
                      return ProductView(
                        product: elements[index]
                      );
                    }
                  );
                },
                child: Container(
                  decoration: UIDecoration.boxDecoration(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        child: Image.asset(elements[index].imagePath,)
                      ),
                      Column(
                        children: [
                          Text(elements[index].name),
                          Text(elements[index].bestPrice),
                        ],
                      )
                    ],
                  ),
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

  SizedBox horizontalShopScroll(double height, double width, List<Shop> scrollable) {
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
                Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  child: SvgPicture.asset(scrollable[index].iconPath, width: shopsElemWidth * 0.6, height: shopsElemHeight* 0.6,),
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

  List<Shop> buildShops() {
    List<Shop> shops = [];

    shops.add(
      Shop(name: "Maxima", iconPath: "images/maxima.svg", height: shopsElemHeight, width: shopsElemWidth)
    );
    shops.add(
      Shop(name: "Lidl", iconPath: "images/lidl.svg", height: shopsElemHeight, width: shopsElemWidth)
    );
    shops.add(
      Shop(name: "Hesburger", iconPath: "images/hesburger.svg", height: shopsElemHeight, width: shopsElemWidth)
    );
    shops.add(
      Shop(name: "Senukai", iconPath: "images/senukai.svg", height: shopsElemHeight, width: shopsElemWidth)
    );

    return shops;
  }

  List<Product> buildTopDiscounts() {
    List<Product> discounts = [];

    discounts.add(
      Product(
        name: "Cheeseburger", 
        bestPrice: "1.00€",
        allPrices: ["1.00€", "299.99€"], 
        allShops: ["Hesburger", "Burger King"],
        imagePath: "images/cheeseburger.jpg", 
        height: topDiscountsHeight, width: topDiscountsWidth)
    );
    discounts.add(
      Product(
        name: "RTX 4090 Ti", 
        bestPrice: "700.00€", 
        allPrices: ["700.00€", "1700.00€", "2300.00€"],
        allShops: ["RD Electronics", "220.lv", "1A.lv"],
        imagePath: "images/rtx4090ti.jpg", 
        height: topDiscountsHeight, width: topDiscountsWidth)
    );
    discounts.add(
      Product(
        name: "Matches", 
        bestPrice: "0.01€", 
        allPrices: ["0.01€", "0.03€"],
        allShops: ["Maxima", "Rimi"],
        imagePath: "images/matches.jpg", 
        height: topDiscountsHeight, width: topDiscountsWidth)
    );
    discounts.add(
      Product(
        name: "Banana", 
        bestPrice: "0.60€", 
        allPrices: ["0.60€", "0.79€", "30.00€"],
        allShops: ["Lidl", "Maxima", "Rimi"],
        imagePath: "images/banana.jpg", 
        height: topDiscountsHeight, width: topDiscountsWidth)
    );
    discounts.add(
      Product(
        name: "The art of war", 
        bestPrice: "15.00€", 
        allPrices: ["15.00€", "20.00€", "22.00€"],
        allShops: ["MnogoKnig", "Zvaigzne ABC", "Janis Roze"],
        imagePath: "images/art_of_war.jpg", 
        height: topDiscountsHeight, width: topDiscountsWidth)
    );

    return discounts;
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
}