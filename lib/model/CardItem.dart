import 'package:flutter_add_to_card_product/model/product.dart';

class CartItem {
  final Product product;
  final int quantity;

  CartItem(this.product, this.quantity);
}