import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fudies/bottom_right_clipper.dart';

import 'app_routes.dart';
import 'custom_arc.dart';

class FoodHomeScreen extends StatefulWidget {
  const FoodHomeScreen({super.key});

  @override
  State<FoodHomeScreen> createState() => _FoodHomeScreenState();
}

class _FoodHomeScreenState extends State<FoodHomeScreen> {
  int _currentIndex = 0;
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    const Color primaryRed = Color(0xFFE53935);

    return CupertinoPageScaffold(
      child: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          activeColor: primaryRed,
          iconSize: 24.sp,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Image(
                image: AssetImage('assets/home_icons/navigation-1.png'),
                width: 24.w,
                height: 24.h,
              ),
              label: 'Explore',
            ),
            BottomNavigationBarItem(
              icon: Image(
                image: AssetImage('assets/home_icons/navigation-2.png'),
                width: 24.w,
                height: 24.h,
              ),
              label: 'Chart',
            ),
            BottomNavigationBarItem(
              icon: Image(
                image: AssetImage('assets/home_icons/navigation-3.png'),
                width: 24.w,
                height: 24.h,
              ),
              label: 'History',
            ),
            BottomNavigationBarItem(
              icon: Image(
                image: AssetImage('assets/home_icons/navigation-4.png'),
                width: 24.w,
                height: 24.h,
              ),
              label: 'Profile',
            ),
          ],
        ),
        tabBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return CupertinoPageScaffold(
              child: CustomScrollView(
                slivers: <Widget>[
                  //Header section
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 300.h + MediaQuery.of(context).padding.top,
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
                              color: Color(0xFFCE181B),

                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withAlpha(26),
                                  blurRadius: 8.r,
                                  offset: Offset(0, 4.h),
                                ),
                              ],
                            ),
                          ),

                          // Red Arc Background Layer (behind other widgets)
                          Positioned(
                            top: MediaQuery.of(context).padding.top,
                            right: 0,
                            child: SizedBox(
                              width: 280.w,
                              height: 250.h,
                              child: Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(30.r),
                                    ),
                                    child: CustomPaint(
                                      size: Size(280.w, 250.h),
                                      painter: ArcPainter(
                                        controlX: 0.1,
                                        controlY: 0.1,
                                        endX: 0.1,
                                        start: 0,
                                      ),
                                    ),
                                  ),

                                  Positioned(
                                    top: 50,
                                    left: 15,
                                    child: ClipPath(
                                      clipper: BottomRightClipper(),
                                      child: SizedBox(
                                        width: 265.w,
                                        height: 200.h,
                                        child: Image.asset(
                                          'assets/home_icons/banner-food.png',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          // Location and Notification Row
                          Positioned(
                            top: 20.h + MediaQuery.of(context).padding.top,
                            left: 20.w,
                            right: 20.w,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Location Container
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Current Location',
                                      style: TextStyle(
                                        color: Colors.white.withAlpha(230),
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(height: 6.h),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 12.w,
                                        vertical: 6.h,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(
                                          20.r,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withAlpha(26),
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
                                            color: Color(0xFFCE181B),
                                          ),
                                          SizedBox(width: 6.w),
                                          Text(
                                            'JL. Kampung Melon No. 32',
                                            style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: 11.sp,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),

                                // Notification Icon Container
                                Container(
                                  padding: EdgeInsets.all(8.r),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15.r),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withAlpha(26),
                                        blurRadius: 4.r,
                                        offset: Offset(0, 2.h),
                                      ),
                                    ],
                                  ),
                                  child: Icon(
                                    CupertinoIcons.bell_fill,
                                    size: 20.sp,
                                    color: Color(0xFFCE181B),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // Promotional Text
                          Positioned(
                            top: 100.h + MediaQuery.of(context).padding.top,
                            left: 20.w,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Hungry? We've Got",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.w800,
                                    height: 1.2,
                                    shadows: [
                                      Shadow(
                                        blurRadius: 4.r,
                                        color: Colors.black.withAlpha(77),
                                        offset: Offset(1.w, 2.h),
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                  "You Covered!",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.w800,
                                    height: 1.2,
                                    shadows: [
                                      Shadow(
                                        blurRadius: 4.r,
                                        color: Colors.black.withAlpha(77),
                                        offset: Offset(1.w, 2.h),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // Overlapping Search Bar (Half outside)
                          Positioned(
                            bottom: 20,
                            left: 20.w,
                            right: 20.w,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.r),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withAlpha(38),
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
                                  borderRadius: BorderRadius.circular(16.r),
                                  border: Border.all(
                                    color: Colors.grey.shade200,
                                    width: 1,
                                  ),
                                ),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 16.w,
                                  vertical: 16.h,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Categories Grid
                  SliverPadding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 8.h,
                    ),
                    sliver: SliverGrid(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        crossAxisSpacing: 12.w,
                        mainAxisSpacing: 12.h,
                        childAspectRatio: 0.9,
                      ),
                      delegate: SliverChildListDelegate([
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, AppRoutes.nearMe);
                          },
                          child: _buildCategoryItem(
                            'Near Me',
                            AssetImage('assets/home_icons/near_me.png'),
                          ),
                        ),
                        _buildCategoryItem(
                          'Big Promo',
                          AssetImage('assets/home_icons/big_promo.png'),
                        ),
                        _buildCategoryItem(
                          'Best Seller',
                          AssetImage('assets/home_icons/star-1.png'),
                        ),
                        _buildCategoryItem(
                          'Budget Meal',
                          AssetImage('assets/home_icons/food-tray-1.png'),
                        ),
                        _buildCategoryItem(
                          'Healthy Food',
                          AssetImage('assets/home_icons/salad-1.png'),
                        ),
                        _buildCategoryItem(
                          'Open 24 Hours',
                          AssetImage('assets/home_icons/24-hours-1.png'),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              AppRoutes.restaurantDetails,
                            );
                          },
                          child: _buildCategoryItem(
                            'Popular Restaurant',
                            AssetImage('assets/home_icons/restaurant-1.png'),
                          ),
                        ),
                        _buildCategoryItem(
                          'More',
                          AssetImage('assets/home_icons/more.png'),
                        ),
                      ]),
                    ),
                  ),

                  // Cuisines Section
                  _buildSectionHeader('Cuisines', primaryRed),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 110.h,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        children: [
                          _buildCuisineItem(
                            'Chicken',
                            AssetImage('assets/home_icons/chicken.png'),
                          ),
                          _buildCuisineItem(
                            'Burger',
                            AssetImage('assets/home_icons/burger.png'),
                          ),
                          _buildCuisineItem(
                            'Pizza',
                            AssetImage('assets/home_icons/pizza.png'),
                          ),
                          _buildCuisineItem(
                            'Bakery',
                            AssetImage('assets/home_icons/bakery.png'),
                          ),
                          _buildCuisineItem(
                            'Salad',
                            AssetImage('assets/home_icons/salad.png'),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Special For You Section
                  _buildSectionHeader('Special For You', primaryRed),
                  SliverList(
                    delegate: SliverChildBuilderDelegate((
                      BuildContext context,
                      int index,
                    ) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: CupertinoListTile(
                          leading: Container(
                            width: 60.w,
                            height: 60.h,
                            decoration: BoxDecoration(
                              color: CupertinoColors.systemGrey5,
                              borderRadius: BorderRadius.circular(8.r),
                              image: DecorationImage(
                                image: NetworkImage(
                                  'https://placehold.co/100x100/CCCCCC/000000?text=Item+${index + 1}',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          title: Text(
                            'Special Item ${index + 1}',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15.sp,
                            ),
                          ),
                          subtitle: Text(
                            'Delicious and recommended for you',
                            style: TextStyle(fontSize: 13.sp),
                          ),
                          trailing: Icon(
                            CupertinoIcons.right_chevron,
                            color: CupertinoColors.inactiveGray,
                            size: 20.sp,
                          ),
                          onTap: () {},
                        ),
                      );
                    }, childCount: 3),
                  ),
                  SliverToBoxAdapter(child: SizedBox(height: 30.h)),
                ],
              ),
            );
          }
          return CupertinoPageScaffold(
            child: Center(
              child: Text(
                'Tab ${index + 1}',
                style: TextStyle(fontSize: 16.sp),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildCategoryItem(String label, ImageProvider imageProvider) {
    return Container(
      height: 86.h,
      width: 97.5.w,
      decoration: BoxDecoration(shape: BoxShape.circle),
      child: Column(
        children: [
          Image(
            image: imageProvider,
            width: 56.w,
            height: 56.h,
            fit: BoxFit.contain,
          ),
          SizedBox(height: 6.r),
          SizedBox(
            width: 72.w,
            height: 18.h,
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.sp,
                color: CupertinoColors.darkBackgroundGray,
                fontFamily: 'PlusJarkataSans',
                fontWeight: FontWeight.w600,
              ),
              maxLines: 2,
              overflow: TextOverflow.visible,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCuisineItem(String label, ImageProvider imageProvider) {
    return Padding(
      padding: EdgeInsets.only(right: 12.w),
      child: Container(
        width: 70.w,
        height: 78.h,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.r)),
        child: Column(
          children: [
            Image(
              image: imageProvider,
              width: 48,
              height: 48,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 6.h),
            Text(
              label,
              style: TextStyle(
                fontSize: 13.sp,
                color: CupertinoColors.darkBackgroundGray,
                fontFamily: 'PlusJakartaSans',
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title, Color primaryRed) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(
          left: 16.w,
          right: 16.w,
          top: 20.h,
          bottom: 8.h,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: CupertinoColors.black,
              ),
            ),
            CupertinoButton(
              padding: EdgeInsets.zero,
              child: Text(
                'View All',
                style: TextStyle(fontSize: 13.sp, color: primaryRed),
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
