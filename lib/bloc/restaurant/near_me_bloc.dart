// near_me_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'near_me_event.dart';
import 'near_me_state.dart';
import 'restaurant_repository.dart';
import 'restaurant_model.dart';

class NearMeBloc extends Bloc<NearMeEvent, NearMeState> {
  final RestaurantRepository _repository;

  NearMeBloc({required RestaurantRepository repository})
      : _repository = repository,
        super(const NearMeState()) {
    on<LoadRestaurants>(_onLoadRestaurants);
    on<SearchRestaurants>(_onSearchRestaurants);
    on<FilterRestaurants>(_onFilterRestaurants);
    on<ClearFilters>(_onClearFilters);
  }

  Future<void> _onLoadRestaurants(
    LoadRestaurants event,
    Emitter<NearMeState> emit,
  ) async {
    emit(state.copyWith(status: NearMeStatus.loading));
    
    try {
      final restaurants = await _repository.getRestaurants();
      emit(state.copyWith(
        status: NearMeStatus.success,
        restaurants: restaurants,
        filteredRestaurants: restaurants,
      ));
    } catch (error) {
      emit(state.copyWith(
        status: NearMeStatus.failure,
        errorMessage: error.toString(),
      ));
    }
  }

  Future<void> _onSearchRestaurants(
    SearchRestaurants event,
    Emitter<NearMeState> emit,
  ) async {
    emit(state.copyWith(
      searchQuery: event.query,
      status: NearMeStatus.loading,
    ));

    try {
      List<Restaurant> filteredRestaurants;
      
      if (event.query.isEmpty) {
        // If search is empty, apply current filters
        filteredRestaurants = await _applyCurrentFilters();
      } else {
        // Search and then apply filters
        final searchResults = await _repository.searchRestaurants(event.query);
        filteredRestaurants = _applyFiltersToList(searchResults);
      }

      emit(state.copyWith(
        status: NearMeStatus.success,
        filteredRestaurants: filteredRestaurants,
      ));
    } catch (error) {
      emit(state.copyWith(
        status: NearMeStatus.failure,
        errorMessage: error.toString(),
      ));
    }
  }

  Future<void> _onFilterRestaurants(
    FilterRestaurants event,
    Emitter<NearMeState> emit,
  ) async {
    emit(state.copyWith(
      status: NearMeStatus.loading,
      selectedCuisine: event.cuisine,
      minRating: event.minRating,
      hasPromo: event.hasPromo,
    ));

    try {
      List<Restaurant> filteredRestaurants;
      
      if (state.searchQuery.isNotEmpty) {
        // Apply filters to search results
        final searchResults = await _repository.searchRestaurants(state.searchQuery);
        filteredRestaurants = _applyFiltersToList(searchResults);
      } else {
        // Apply filters to all restaurants
        filteredRestaurants = await _repository.filterRestaurants(
          cuisine: event.cuisine,
          minRating: event.minRating,
          hasPromo: event.hasPromo,
        );
      }

      emit(state.copyWith(
        status: NearMeStatus.success,
        filteredRestaurants: filteredRestaurants,
      ));
    } catch (error) {
      emit(state.copyWith(
        status: NearMeStatus.failure,
        errorMessage: error.toString(),
      ));
    }
  }

  Future<void> _onClearFilters(
    ClearFilters event,
    Emitter<NearMeState> emit,
  ) async {
    emit(state.copyWith(
      selectedCuisine: null,
      minRating: null,
      hasPromo: null,
      status: NearMeStatus.loading,
    ));

    try {
      List<Restaurant> filteredRestaurants;
      
      if (state.searchQuery.isNotEmpty) {
        filteredRestaurants = await _repository.searchRestaurants(state.searchQuery);
      } else {
        filteredRestaurants = state.restaurants;
      }

      emit(state.copyWith(
        status: NearMeStatus.success,
        filteredRestaurants: filteredRestaurants,
      ));
    } catch (error) {
      emit(state.copyWith(
        status: NearMeStatus.failure,
        errorMessage: error.toString(),
      ));
    }
  }

  Future<List<Restaurant>> _applyCurrentFilters() async {
    return await _repository.filterRestaurants(
      cuisine: state.selectedCuisine,
      minRating: state.minRating,
      hasPromo: state.hasPromo,
    );
  }

  List<Restaurant> _applyFiltersToList(List<Restaurant> restaurants) {
    return restaurants.where((restaurant) {
      bool matchesCuisine = state.selectedCuisine == null || 
        restaurant.cuisines.contains(state.selectedCuisine);
      
      bool matchesRating = state.minRating == null || 
        restaurant.rating >= state.minRating!;
      
      bool matchesPromo = state.hasPromo == null || 
        restaurant.hasPromo == state.hasPromo!;
      
      return matchesCuisine && matchesRating && matchesPromo;
    }).toList();
  }
}