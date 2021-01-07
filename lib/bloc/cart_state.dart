part of 'cart_bloc.dart';

@immutable
abstract class CartState {}

class CartInitial extends CartState {}

class CardLoading extends CartState {}

class CardOperationSuccess extends CartState {
  final List<CartItem> cardItem;

  CardOperationSuccess(this.cardItem);
}

class CardOperationFail extends CartState {}
