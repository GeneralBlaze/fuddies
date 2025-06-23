// lib/bloc/cart_state.dart
part of 'cart_bloc.dart';

class CartState extends Equatable {
  final Map<String, int> itemQuantities;
  final double totalPrice;

  const CartState({this.itemQuantities = const {}, this.totalPrice = 0.0});

  @override
  List<Object> get props => [itemQuantities, totalPrice];
}