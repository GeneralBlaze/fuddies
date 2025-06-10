import 'package:flutter/material.dart';
import 'package:fudies/restaurant_details_screen.dart';

import './home_screen.dart';
import './near_me_screen.dart';

class AppRoutes {
  static const String home = '/';
  static const String nearMe = 'near-me';
  static const String restaurantDetails = 'restaurant-details';

  static Map<String, WidgetBuilder> routes = {
    home: (_) => FoodHomeScreen(),
    nearMe: (_) => NearMeScreen(),
    restaurantDetails: (_) => RestaurantDetailsScreen(),
  };
}
