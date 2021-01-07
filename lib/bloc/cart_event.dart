part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {}

class AddToCard extends CartEvent {
  final Product product;

  AddToCard(this.product);
}

class RemoveFromCard extends CartEvent {
  final Product product;

  RemoveFromCard(this.product);
}

class PageLoad extends CartEvent {}
