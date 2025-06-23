// lib/bloc/cart_event.dart

part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();
  @override
  List<Object> get props => [];
}

class UpdateCartItem extends CartEvent {
  final String itemId;
  final int newQuantity;

  const UpdateCartItem(this.itemId, this.newQuantity);

  @override
  List<Object> get props => [itemId, newQuantity];
}

class ClearCart extends CartEvent {
  const ClearCart();
}

class RemoveFromCart extends CartEvent {
  final String itemId;

  const RemoveFromCart(this.itemId);

  @override
  List<Object> get props => [itemId];
}
