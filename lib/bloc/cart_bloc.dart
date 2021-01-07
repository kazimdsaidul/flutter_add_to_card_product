import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_add_to_card_product/model/CardItem.dart';
import 'package:flutter_add_to_card_product/model/product.dart';
import 'package:meta/meta.dart';

import '../dummy_product_list.dart';

part 'cart_event.dart';

part 'cart_state.dart';

class CardBloc extends Bloc<CartEvent, CardState> {
  List<CartItem> _cartItem = List.unmodifiable([]);

  CardBloc() : super(CartInitial());

  @override
  Stream<CardState> mapEventToState(
    CartEvent event,
  ) async* {
    if (event is AddToCard) {
      yield CardLoading();
      await Future.delayed(Duration(seconds: 3));
      List<CartItem> tempList = List<CartItem>.from(_cartItem);
      bool exists = false;
      int index;
      for (var i = 0; i < _cartItem.length; i++) {
        if (event.product.name == _cartItem[i].product.name) {
          exists = true;
          index = i;
          break;
        }
      }
      if (exists) {
        tempList[index] = CartItem(event.product, tempList[index].quantity + 1);
      } else {
        tempList.add(
          CartItem(event.product, 1),
        );
      }
      _cartItem = List.unmodifiable(tempList);
      yield CardOperationSuccess(_cartItem);
    } else if (event is PageLoad) {
      final list = DummyProductList.products;
      yield ProjectAdded(list);

      await Future.delayed(Duration(seconds: 10));

      final list2 = DummyProductList.Newproducts;
      list.addAll(list2);
      list.addAll(list2);
      list.addAll(list2);
      yield ProjectAdded(list);
    }
  }
}
