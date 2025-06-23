import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fudies/bottom_right_clipper.dart';

import 'bloc/restaurant/near_me_bloc.dart';
import 'bloc/restaurant/near_me_event.dart';
import 'bloc/restaurant/near_me_state.dart';
import 'bloc/restaurant/restaurant_model.dart';
import 'bloc/restaurant/restaurant_repository.dart';
import 'custom_arc.dart';

class NearMeScreen extends StatelessWidget {
  const NearMeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              NearMeBloc(repository: RestaurantRepository())
                ..add(const LoadRestaurants()),
      child: const NearMeView(),
    );
  }
}

class NearMeView extends StatefulWidget {
  const NearMeView({super.key});

  @override
  State<NearMeView> createState() => _NearMeViewState();
}

class _NearMeViewState extends State<NearMeView> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemGroupedBackground,
      child: BlocListener<NearMeBloc, NearMeState>(
        listener: (context, state) {
          if (state.status == NearMeStatus.failure) {
            showCupertinoDialog(
              context: context,
              builder:
                  (context) => CupertinoAlertDialog(
                    title: const Text('Error'),
                    content: Text(state.errorMessage ?? 'Something went wrong'),
                    actions: [
                      CupertinoDialogAction(
                        child: const Text('OK'),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ],
                  ),
            );
          }
        },
        child: CustomScrollView(
          slivers: [_buildHeader(), _buildFilters(), _buildRestaurantList()],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return SliverToBoxAdapter(
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
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: Container(
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
            _buildIllustration(),

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
                  onChanged: (value) {
                    context.read<NearMeBloc>().add(SearchRestaurants(value));
                  },
                  onSubmitted: (value) {
                    context.read<NearMeBloc>().add(SearchRestaurants(value));
                  },
                  style: TextStyle(fontSize: 16.sp, color: Colors.black87),
                  placeholderStyle: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.grey.shade600,
                  ),
                  itemSize: 24.sp,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25.r),
                    border: Border.all(color: Colors.grey.shade200, width: 1),
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
    );
  }

  Widget _buildIllustration() {
    return Positioned(
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
                child: Image.asset('assets/near_me/Character.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilters() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: BlocBuilder<NearMeBloc, NearMeState>(
          builder: (context, state) {
            return SingleChildScrollView(
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
                  GestureDetector(
                    onTap: () => _showCuisineFilter(context, state),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 12.h,
                      ),
                      constraints: BoxConstraints(minHeight: 40.h),
                      decoration: BoxDecoration(
                        color:
                            state.selectedCuisine != null
                                ? const Color(0xFFCE181B).withOpacity(0.1)
                                : Colors.white,
                        borderRadius: BorderRadius.circular(18.r),
                        border: Border.all(
                          color:
                              state.selectedCuisine != null
                                  ? const Color(0xFFCE181B)
                                  : Colors.grey.shade300,
                        ),
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
                            state.selectedCuisine ?? 'Cuisines',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color:
                                  state.selectedCuisine != null
                                      ? const Color(0xFFCE181B)
                                      : Colors.black87,
                            ),
                          ),
                          SizedBox(width: 6.w),
                          Icon(
                            CupertinoIcons.chevron_down,
                            size: 14.sp,
                            color:
                                state.selectedCuisine != null
                                    ? const Color(0xFFCE181B)
                                    : Colors.black87,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w),

                  // Rated filter
                  GestureDetector(
                    onTap: () {
                      final newRating = state.minRating == null ? 4.5 : null;
                      context.read<NearMeBloc>().add(
                        FilterRestaurants(
                          cuisine: state.selectedCuisine,
                          minRating: newRating,
                          hasPromo: state.hasPromo,
                        ),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 12.h,
                      ),
                      constraints: BoxConstraints(minHeight: 40.h),
                      decoration: BoxDecoration(
                        color:
                            state.minRating != null
                                ? const Color(0xFFCE181B).withOpacity(0.1)
                                : Colors.white,
                        borderRadius: BorderRadius.circular(18.r),
                        border: Border.all(
                          color:
                              state.minRating != null
                                  ? const Color(0xFFCE181B)
                                  : Colors.grey.shade300,
                        ),
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
                          color:
                              state.minRating != null
                                  ? const Color(0xFFCE181B)
                                  : Colors.black87,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w),

                  // Promo filter
                  GestureDetector(
                    onTap: () {
                      final newPromo = state.hasPromo == null ? true : null;
                      context.read<NearMeBloc>().add(
                        FilterRestaurants(
                          cuisine: state.selectedCuisine,
                          minRating: state.minRating,
                          hasPromo: newPromo,
                        ),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 12.h,
                      ),
                      constraints: BoxConstraints(minHeight: 40.h),
                      decoration: BoxDecoration(
                        color:
                            state.hasPromo != null
                                ? const Color(0xFFCE181B).withOpacity(0.1)
                                : Colors.white,
                        borderRadius: BorderRadius.circular(18.r),
                        border: Border.all(
                          color:
                              state.hasPromo != null
                                  ? const Color(0xFFCE181B)
                                  : Colors.grey.shade300,
                        ),
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
                          color:
                              state.hasPromo != null
                                  ? const Color(0xFFCE181B)
                                  : Colors.black87,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w),

                  // Clear filters button (only show when filters are active)
                  if (state.selectedCuisine != null ||
                      state.minRating != null ||
                      state.hasPromo != null)
                    GestureDetector(
                      onTap: () {
                        context.read<NearMeBloc>().add(const ClearFilters());
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 12.h,
                        ),
                        constraints: BoxConstraints(minHeight: 40.h),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(18.r),
                          border: Border.all(color: Colors.grey.shade300),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withAlpha(
                                (0.05 * 255).toInt(),
                              ),
                              blurRadius: 4.r,
                              offset: Offset(0, 2.h),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              CupertinoIcons.xmark,
                              size: 12.sp,
                              color: Colors.black54,
                            ),
                            SizedBox(width: 4.w),
                            Text(
                              'Clear',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildRestaurantList() {
    return BlocBuilder<NearMeBloc, NearMeState>(
      builder: (context, state) {
        if (state.status == NearMeStatus.loading) {
          return SliverToBoxAdapter(
            child: Container(
              height: 200.h,
              alignment: Alignment.center,
              child: const CupertinoActivityIndicator(),
            ),
          );
        }

        if (state.status == NearMeStatus.failure) {
          return SliverToBoxAdapter(
            child: Container(
              height: 200.h,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    CupertinoIcons.exclamationmark_triangle,
                    size: 48.sp,
                    color: Colors.grey.shade400,
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'Failed to load restaurants',
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  CupertinoButton(
                    onPressed: () {
                      context.read<NearMeBloc>().add(const LoadRestaurants());
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
            ),
          );
        }

        if (state.filteredRestaurants.isEmpty) {
          return SliverToBoxAdapter(
            child: Container(
              height: 200.h,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    CupertinoIcons.search,
                    size: 48.sp,
                    color: Colors.grey.shade400,
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'No restaurants found',
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  if (state.searchQuery.isNotEmpty ||
                      state.selectedCuisine != null ||
                      state.minRating != null ||
                      state.hasPromo != null) ...[
                    SizedBox(height: 8.h),
                    CupertinoButton(
                      onPressed: () {
                        _searchController.clear();
                        context.read<NearMeBloc>().add(
                          const SearchRestaurants(''),
                        );
                        context.read<NearMeBloc>().add(const ClearFilters());
                      },
                      child: const Text('Clear search and filters'),
                    ),
                  ],
                ],
              ),
            ),
          );
        }

        return SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            final restaurant = state.filteredRestaurants[index];
            return _buildRestaurantCard(restaurant);
          }, childCount: state.filteredRestaurants.length),
        );
      },
    );
  }

  Widget _buildRestaurantCard(Restaurant restaurant) {
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
                  image: AssetImage(restaurant.imagePath),
                  fit: BoxFit.contain,
                ),
              ),
              child:
                  restaurant.badge != null
                      ? Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          margin: EdgeInsets.all(8.r),
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.w,
                            vertical: 4.h,
                          ),
                          decoration: BoxDecoration(
                            color: restaurant.badgeColor ?? Colors.orange,
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Text(
                            restaurant.badge!,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      )
                      : null,
            ),
          ),
          SizedBox(width: 12.w),

          // Restaurant Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  restaurant.name,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  restaurant.category,
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
                      image: const AssetImage('assets/near_me/two-wheeler.png'),
                      height: 20.h,
                      width: 20.h,
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      restaurant.price,
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
                      '${restaurant.deliveryTime} • ${restaurant.distance}',
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
                      '${restaurant.rating} • ${restaurant.reviews}',
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

  void _showCuisineFilter(BuildContext context, NearMeState state) {
    final List<String> cuisines = [
      'Indonesian',
      'Chinese',
      'Grilled',
      'Porridge',
      'Chicken',
      'Meat',
      'Noodles',
    ];

    showCupertinoModalPopup(
      context: context,
      builder:
          (context) => CupertinoActionSheet(
            title: const Text('Select Cuisine'),
            actions:
                cuisines.map((cuisine) {
                  final isSelected = state.selectedCuisine == cuisine;
                  return CupertinoActionSheetAction(
                    onPressed: () {
                      Navigator.pop(context);
                      context.read<NearMeBloc>().add(
                        FilterRestaurants(
                          cuisine: isSelected ? null : cuisine,
                          minRating: state.minRating,
                          hasPromo: state.hasPromo,
                        ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(cuisine),
                        if (isSelected)
                          const Icon(
                            CupertinoIcons.check_mark,
                            color: Color(0xFFCE181B),
                          ),
                      ],
                    ),
                  );
                }).toList(),
            cancelButton: CupertinoActionSheetAction(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
          ),
    );
  }
}
