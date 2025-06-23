// restaurant_repository.dart
import 'package:flutter/material.dart';
import 'restaurant_model.dart';

class RestaurantRepository {
  // Simulate API call with delay
  Future<List<Restaurant>> getRestaurants() async {
    await Future.delayed(const Duration(milliseconds: 800));
    
    return [
      const Restaurant(
        id: '1',
        name: 'Bubur Ayam Pak Yono',
        category: 'Porridge, Rice, Chicken,',
        price: 'Rp 10.000',
        deliveryTime: '12 min',
        distance: '1 km',
        rating: 4.9,
        reviews: '400+ ratings',
        badge: 'Best Seller',
        badgeColor: Colors.orange,
        imagePath: 'assets/near_me/best-seller.png',
        cuisines: ['Indonesian', 'Porridge', 'Chicken'],
        hasPromo: false,
      ),
      const Restaurant(
        id: '2',
        name: 'Sate Kambing Pak Slamet',
        category: 'Satai, Chicken, Meat',
        price: 'Rp 10.000',
        deliveryTime: '20 min',
        distance: '1.2 km',
        rating: 4.7,
        reviews: '200+ ratings',
        badge: 'Promo',
        badgeColor: Color(0xFFCE181B),
        imagePath: 'assets/near_me/promo.png',
        cuisines: ['Indonesian', 'Grilled', 'Meat'],
        hasPromo: true,
      ),
      const Restaurant(
        id: '3',
        name: 'Bakmi Ayam Bangka 78',
        category: 'Noodle, Chicken',
        price: 'Rp 12.000',
        deliveryTime: '25 min',
        distance: '2.4 km',
        rating: 4.6,
        reviews: '150+ ratings',
        badge: null,
        badgeColor: null,
        imagePath: 'assets/near_me/bakmi.png',
        cuisines: ['Chinese', 'Noodles', 'Chicken'],
        hasPromo: false,
      ),
    ];
  }

  Future<List<Restaurant>> searchRestaurants(String query) async {
    final allRestaurants = await getRestaurants();
    
    if (query.isEmpty) return allRestaurants;
    
    return allRestaurants.where((restaurant) =>
      restaurant.name.toLowerCase().contains(query.toLowerCase()) ||
      restaurant.category.toLowerCase().contains(query.toLowerCase()) ||
      restaurant.cuisines.any((cuisine) => 
        cuisine.toLowerCase().contains(query.toLowerCase()))
    ).toList();
  }

  Future<List<Restaurant>> filterRestaurants({
    String? cuisine,
    double? minRating,
    bool? hasPromo,
  }) async {
    final allRestaurants = await getRestaurants();
    
    return allRestaurants.where((restaurant) {
      bool matchesCuisine = cuisine == null || 
        restaurant.cuisines.contains(cuisine);
      
      bool matchesRating = minRating == null || 
        restaurant.rating >= minRating;
      
      bool matchesPromo = hasPromo == null || 
        restaurant.hasPromo == hasPromo;
      
      return matchesCuisine && matchesRating && matchesPromo;
    }).toList();
  }
}