import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fudies/bottom_right_clipper.dart';

import 'custom_arc.dart';

class NearMeScreen extends StatefulWidget {
  const NearMeScreen({super.key});

  @override
  State<NearMeScreen> createState() => _NearMeScreenState();
}

class _NearMeScreenState extends State<NearMeScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemGroupedBackground,
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: 270.h + MediaQuery.of(context).padding.top,
              width: double.infinity,
              child: Stack(
                children: [
                  // Main Banner Container
                  Container(
                    height: 250.h + MediaQuery.of(context).padding.top,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30.r),
                        bottomRight: Radius.circular(30.r),
                      ),
                      color: const Color(0xFFCE181B),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withAlpha((0.1 * 255).toInt()),
                          blurRadius: 8.r,
                          offset: Offset(0, 4.h),
                        ),
                      ],
                    ),
                  ),

                  // Back Button and Location Row
                  Positioned(
                    top: 20.h + MediaQuery.of(context).padding.top,
                    left: 20.w,
                    right: 20.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Back Button
                        Container(
                          padding: EdgeInsets.all(8.r),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.r),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withAlpha((0.1 * 255).toInt()),
                                blurRadius: 4.r,
                                offset: Offset(0, 2.h),
                              ),
                            ],
                          ),
                          child: Icon(
                            CupertinoIcons.chevron_left,
                            size: 20.sp,
                            color: Colors.black87,
                          ),
                        ),

                        // Location Container
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 8.h,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25.r),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withAlpha((0.1 * 255).toInt()),
                                blurRadius: 4.r,
                                offset: Offset(0, 2.h),
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                CupertinoIcons.location_solid,
                                size: 16.sp,
                                color: const Color(0xFFCE181B),
                              ),
                              SizedBox(width: 8.w),
                              Text(
                                'JL. Kampung Melon No. 32',
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Near Me Title and Subtitle
                  Positioned(
                    top: 90.h + MediaQuery.of(context).padding.top,
                    left: 20.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Near Me",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28.sp,
                            fontWeight: FontWeight.w800,
                            height: 1.1,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          "Choose From Nearby Restaurants",
                          style: TextStyle(
                            color: Colors.white.withAlpha((0.9 * 255).toInt()),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "With Deliciousness Awaiting",
                          style: TextStyle(
                            color: Colors.white.withAlpha((0.9 * 255).toInt()),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Illustration (Person waving)
                  Positioned(
                    top: MediaQuery.of(context).padding.top,
                    right: 0,
                    child: SizedBox(
                      width: 260.w,
                      height: 250.h,
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(30.r),
                            ),
                            child: CustomPaint(
                              size: Size(260.w, 250.h),
                              painter: ArcPainter(
                                controlX: 0.3,
                                controlY: 0.2,
                                endX: 0.1,
                                start: 100,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 154,
                            left: 45,
                            child: ClipPath(
                              clipper: BottomRightClipper(),
                              child: SizedBox(
                                width: 213.w,
                                height: 80.5.h,
                                child: Image.asset(
                                  'assets/near_me/Map.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 70,
                            left: 110,
                            child: SizedBox(
                              height: 152.62.h,
                              width: 112.11.w,
                              child: Image.asset(
                                'assets/near_me/Character.png',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Overlapping Search Bar
                  Positioned(
                    bottom: 0,
                    left: 20.w,
                    right: 20.w,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.r),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withAlpha((0.15 * 255).toInt()),
                              blurRadius: 12.r,
                              offset: Offset(0, 6.h),
                            ),
                          ],
                      ),
                      child: CupertinoSearchTextField(
                        controller: _searchController,
                        placeholder: 'What do you want to eat?',
                        onChanged: (value) {},
                        onSubmitted: (value) {},
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.black87,
                        ),
                        placeholderStyle: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.grey.shade600,
                        ),
                        itemSize: 24.sp,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25.r),
                          border: Border.all(
                            color: Colors.grey.shade200,
                            width: 1,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.w,
                          vertical: 16.h,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Filter Section
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    // Filter icon
                    Container(
                      padding: EdgeInsets.all(10.r),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18.r),
                        border: Border.all(color: Colors.grey.shade300),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withAlpha((0.05 * 255).toInt()),
                              blurRadius: 4.r,
                              offset: Offset(0, 2.h),
                            ),
                          ],
                      ),
                      child: Icon(
                        CupertinoIcons.slider_horizontal_3,
                        size: 20.sp,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(width: 12.w),

                    // Cuisines filter
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 12.h,
                      ),
                      constraints: BoxConstraints(minHeight: 40.h),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18.r),
                        border: Border.all(color: Colors.grey.shade300),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withAlpha((0.05 * 255).toInt()),
                              blurRadius: 4.r,
                              offset: Offset(0, 2.h),
                            ),
                          ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Cuisines',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(width: 6.w),
                          Icon(
                            CupertinoIcons.chevron_down,
                            size: 14.sp,
                            color: Colors.black87,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 12.w),

                    // Rated filter
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 12.h,
                      ),
                      constraints: BoxConstraints(minHeight: 40.h),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18.r),
                        border: Border.all(color: Colors.grey.shade300),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withAlpha((0.05 * 255).toInt()),
                              blurRadius: 4.r,
                              offset: Offset(0, 2.h),
                            ),
                          ],
                      ),
                      child: Text(
                        'Rated 4.5+',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    SizedBox(width: 12.w),

                    // Promo filter
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 12.h,
                      ),
                      constraints: BoxConstraints(minHeight: 40.h),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18.r),
                        border: Border.all(color: Colors.grey.shade300),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withAlpha((0.05 * 255).toInt()),
                            blurRadius: 4.r,
                            offset: Offset(0, 2.h),
                          ),
                        ],
                      ),
                      child: Text(
                        'Promo',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Restaurant List
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return _buildRestaurantCard(index);
            }, childCount: 3),
          ),
        ],
      ),
    );
  }

  Widget _buildRestaurantCard(int index) {
    final restaurants = [
      {
        'name': 'Bubur Ayam Pak Yono',
        'category': 'Porridge, Rice, Chicken,',
        'price': 'Rp 10.000',
        'time': '12 min',
        'distance': '1 km',
        'rating': '4.9',
        'reviews': '400+ ratings',
        'badge': 'Best Seller',
        'badgeColor': Colors.orange,
        'image': AssetImage('assets/near_me/best-seller.png'),
      },
      {
        'name': 'Sate Kambing Pak Slamet',
        'category': 'Satai, Chicken, Meat',
        'price': 'Rp 10.000',
        'time': '20 min',
        'distance': '1.2 km',
        'rating': '4.7',
        'reviews': '200+ ratings',
        'badge': 'Promo',
        'badgeColor': const Color(0xFFCE181B),
        'image': AssetImage('assets/near_me/promo.png'),
      },
      {
        'name': 'Bakmi Ayam Bangka 78',
        'category': 'Noodle, Chicken',
        'price': 'Rp 12.000',
        'time': '25 min',
        'distance': '2.4 km',
        'rating': '4.6',
        'reviews': '150+ ratings',
        'badge': null,
        'badgeColor': null,
        'image': AssetImage('assets/near_me/bakmi.png'),
      },
    ];

    final restaurant = restaurants[index];

    return Container(
      width: 390.w,
      height: 164.h,
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha((0.05 * 255).toInt()),
            blurRadius: 8.r,
            offset: Offset(0, 2.h),
          ),
        ],
      ),
      child: Row(
        children: [
          // Restaurant Image
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: Container(
              width: 124.w,
              height: 164.h,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                image: DecorationImage(
                  image: restaurant['image'] as ImageProvider,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          SizedBox(width: 12.w),

          // Restaurant Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  restaurant['name'] as String,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  restaurant['category'] as String,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey.shade600,
                  ),
                ),
                SizedBox(height: 14.h),
                Row(
                  children: [
                    Image(
                      image: AssetImage('assets/near_me/two-wheeler.png'),
                      height: 20.h,
                      width: 20.h,
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      restaurant['price'] as String,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 14.h),
                Row(
                  children: [
                    Icon(
                      CupertinoIcons.clock_fill,
                      size: 12.sp,
                      color: const Color(0xFFCE181B),
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      '${restaurant['time']} • ${restaurant['distance']}',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.w),
                Row(
                  children: [
                    Icon(
                      CupertinoIcons.star_fill,
                      size: 12.sp,
                      color: Colors.orange,
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      '${restaurant['rating']} • ${restaurant['reviews']}',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

