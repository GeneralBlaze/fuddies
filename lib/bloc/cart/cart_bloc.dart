// lib/bloc/cart_bloc.dart

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final Map<String, double> itemPrices = {
    'paket_kambing': 23000,
    'paket_ayam': 19000,
    'sate_kambing_special': 35000,
    'rawon_setan': 25000,
  };

  CartBloc() : super(const CartState()) {
    on<UpdateCartItem>((event, emit) {
      final newQuantities = Map<String, int>.from(state.itemQuantities);
      
      // Update quantity (don't allow negative quantities)
      newQuantities[event.itemId] = event.newQuantity < 0 ? 0 : event.newQuantity;
      
      // Remove item from map if quantity is 0
      if (newQuantities[event.itemId] == 0) {
        newQuantities.remove(event.itemId);
      }

      // Calculate new total price
      double newTotalPrice = 0.0;
      newQuantities.forEach((itemId, quantity) {
        newTotalPrice += (itemPrices[itemId] ?? 0) * quantity;
      });

      emit(CartState(
        itemQuantities: newQuantities, 
        totalPrice: newTotalPrice,
      ));
    });

    on<ClearCart>((event, emit) {
      emit(const CartState());
    });

    on<RemoveFromCart>((event, emit) {
      final newQuantities = Map<String, int>.from(state.itemQuantities);
      newQuantities.remove(event.itemId);

      double newTotalPrice = 0.0;
      newQuantities.forEach((itemId, quantity) {
        newTotalPrice += (itemPrices[itemId] ?? 0) * quantity;
      });

      emit(CartState(
        itemQuantities: newQuantities, 
        totalPrice: newTotalPrice,
      ));
    });
  }

  // Getter methods for convenience
  int getTotalItems() {
    return state.itemQuantities.values.fold(0, (sum, quantity) => sum + quantity);
  }

  bool get hasItems => state.itemQuantities.isNotEmpty;
}