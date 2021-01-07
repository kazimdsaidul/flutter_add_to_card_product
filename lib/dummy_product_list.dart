import 'model/product.dart';

class DummyProductList {
  static List<Product> products = [
    Product(
      image: "https://picsum.photos/200",
      name: "Apple",
      price: 120,
    ),
    Product(
      image: "https://picsum.photos/200",
      name: "Banana",
      price: 100,
    ),
    Product(
      image: "https://picsum.photos/200",
      name: "Orange",
      price: 80,
    ),
    Product(
      image: "https://picsum.photos/200",
      name: "Dragon Fruit",
      price: 800,
    ),
    Product(
      image:
          "data:image/png;base64,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",
      name: "Dragon Fruit",
      price: 68,
    ),
  ];
}
