
class Product {
  String name;
  String bestPrice;
  List<String> allPrices = [];
  List<String> allShops = [];
  String imagePath;
  double width;
  double height;

  Product({
    required this.name,
    required this.bestPrice,
    required this.allPrices,
    required this.allShops,
    required this.imagePath,
    required this.height,
    required this.width
  });
}