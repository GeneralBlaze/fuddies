// near_me_event.dart
import 'package:equatable/equatable.dart';

abstract class NearMeEvent extends Equatable {
  const NearMeEvent();

  @override
  List<Object?> get props => [];
}

class LoadRestaurants extends NearMeEvent {
  const LoadRestaurants();
}

class SearchRestaurants extends NearMeEvent {
  final String query;

  const SearchRestaurants(this.query);

  @override
  List<Object?> get props => [query];
}

class FilterRestaurants extends NearMeEvent {
  final String? cuisine;
  final double? minRating;
  final bool? hasPromo;

  const FilterRestaurants({
    this.cuisine,
    this.minRating,
    this.hasPromo,
  });

  @override
  List<Object?> get props => [cuisine, minRating, hasPromo];
}

class ClearFilters extends NearMeEvent {
  const ClearFilters();
}