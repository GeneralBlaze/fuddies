// near_me_state.dart
import 'package:equatable/equatable.dart';
import 'restaurant_model.dart';

enum NearMeStatus { initial, loading, success, failure }

class NearMeState extends Equatable {
  final NearMeStatus status;
  final List<Restaurant> restaurants;
  final List<Restaurant> filteredRestaurants;
  final String searchQuery;
  final String? selectedCuisine;
  final double? minRating;
  final bool? hasPromo;
  final String? errorMessage;

  const NearMeState({
    this.status = NearMeStatus.initial,
    this.restaurants = const [],
    this.filteredRestaurants = const [],
    this.searchQuery = '',
    this.selectedCuisine,
    this.minRating,
    this.hasPromo,
    this.errorMessage,
  });

  NearMeState copyWith({
    NearMeStatus? status,
    List<Restaurant>? restaurants,
    List<Restaurant>? filteredRestaurants,
    String? searchQuery,
    String? selectedCuisine,
    double? minRating,
    bool? hasPromo,
    String? errorMessage,
  }) {
    return NearMeState(
      status: status ?? this.status,
      restaurants: restaurants ?? this.restaurants,
      filteredRestaurants: filteredRestaurants ?? this.filteredRestaurants,
      searchQuery: searchQuery ?? this.searchQuery,
      selectedCuisine: selectedCuisine ?? this.selectedCuisine,
      minRating: minRating ?? this.minRating,
      hasPromo: hasPromo ?? this.hasPromo,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        status,
        restaurants,
        filteredRestaurants,
        searchQuery,
        selectedCuisine,
        minRating,
        hasPromo,
        errorMessage,
      ];
}