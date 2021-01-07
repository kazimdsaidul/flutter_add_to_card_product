part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {}

class AddToCar extends CartEvent {
  final Product product;

  AddToCar(this.product);
}

class RemoveFromCard extends CartEvent {
  final Product product;

  RemoveFromCard(this.product);
}
