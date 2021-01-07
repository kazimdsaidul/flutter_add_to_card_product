part of 'cart_bloc.dart';

@immutable
abstract class CardState {}

class CartInitial extends CardState {}

class CardLoading extends CardState {}

class CardOperationSuccess extends CardState {
  final List<CartItem> cardItem;

  CardOperationSuccess(this.cardItem);
}

class CardOperationFail extends CardState {}

class ProjectAdded extends CardState {
  final List<Product> listProduct;

  ProjectAdded(this.listProduct);
}
