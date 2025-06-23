// restaurant_model.dart
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Restaurant extends Equatable {
  final String id;
  final String name;
  final String category;
  final String price;
  final String deliveryTime;
  final String distance;
  final double rating;
  final String reviews;
  final String? badge;
  final Color? badgeColor;
  final String imagePath;
  final List<String> cuisines;
  final bool hasPromo;

  const Restaurant({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.deliveryTime,
    required this.distance,
    required this.rating,
    required this.reviews,
    this.badge,
    this.badgeColor,
    required this.imagePath,
    required this.cuisines,
    this.hasPromo = false,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        category,
        price,
        deliveryTime,
        distance,
        rating,
        reviews,
        badge,
        badgeColor,
        imagePath,
        cuisines,
        hasPromo,
      ];

  Restaurant copyWith({
    String? id,
    String? name,
    String? category,
    String? price,
    String? deliveryTime,
    String? distance,
    double? rating,
    String? reviews,
    String? badge,
    Color? badgeColor,
    String? imagePath,
    List<String>? cuisines,
    bool? hasPromo,
  }) {
    return Restaurant(
      id: id ?? this.id,
      name: name ?? this.name,
      category: category ?? this.category,
      price: price ?? this.price,
      deliveryTime: deliveryTime ?? this.deliveryTime,
      distance: distance ?? this.distance,
      rating: rating ?? this.rating,
      reviews: reviews ?? this.reviews,
      badge: badge ?? this.badge,
      badgeColor: badgeColor ?? this.badgeColor,
      imagePath: imagePath ?? this.imagePath,
      cuisines: cuisines ?? this.cuisines,
      hasPromo: hasPromo ?? this.hasPromo,
    );
  }
}