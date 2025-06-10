import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_routes.dart';

class RestaurantDetailsScreen extends StatefulWidget {
  const RestaurantDetailsScreen({super.key});

  @override
  RestaurantDetailsScreenState createState() => RestaurantDetailsScreenState();
}

class RestaurantDetailsScreenState extends State<RestaurantDetailsScreen> {
  int selectedQuantity1 = 2;
  int selectedQuantity2 = 0;

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoPageScaffold(
        backgroundColor: CupertinoColors.systemBackground,
        child: Stack(
          children: [
            CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 350.h,

                    child: Stack(
                      children: [
                        Container(
                          height: 193.h,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/resto/header.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SafeArea(
                          child: Padding(
                            padding: EdgeInsets.all(16.r),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      AppRoutes.home,
                                    );
                                  },
                                  child: Container(
                                    width: 44.r,
                                    height: 44.r,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      CupertinoIcons.chevron_left,
                                      color: Colors.black,
                                      size: 20.sp,
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: 44.r,
                                      height: 44.r,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(
                                        CupertinoIcons.search,
                                        color: Colors.black,
                                        size: 20.sp,
                                      ),
                                    ),
                                    SizedBox(width: 12.w),
                                    Container(
                                      width: 44.r,
                                      height: 44.r,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(
                                        CupertinoIcons.share,
                                        color: Colors.black,
                                        size: 20.sp,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),

                        Positioned(
                          top: 140,
                          child: Stack(
                            children: [
                              Container(
                                width: 390.w,
                                height: 170.h,
                                margin: EdgeInsets.symmetric(horizontal: 18.w),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20.r),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withAlpha(26),
                                      blurRadius: 20.r,
                                      offset: Offset(0, 5.h),
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 18.w,
                                    vertical: 14.h,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              'Sate Kambing Pak Slamet',
                                              style: TextStyle(
                                                fontSize: 20.sp,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 8.h),
                                      Row(
                                        children: [
                                          Icon(
                                            CupertinoIcons.location_solid,
                                            color: Color(0xFFCE181B),
                                            size: 16.sp,
                                          ),
                                          SizedBox(width: 4.w),
                                          Text(
                                            'JL. Sultan Hasanudin No. 123',
                                            style: TextStyle(
                                              fontSize: 14.sp,
                                              color: Colors.grey[600],
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 20.h),
                                      SizedBox(
                                        width: 350.w,
                                        height: 43.h,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Icon(
                                                      CupertinoIcons.star_fill,
                                                      color: Colors.orange,
                                                      size: 16.sp,
                                                    ),
                                                    SizedBox(width: 4.w),
                                                    Text(
                                                      '4.9',
                                                      style: TextStyle(
                                                        fontSize: 14.sp,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 12.h),
                                                Text(
                                                  '200+ ratings',
                                                  style: TextStyle(
                                                    fontSize: 12.sp,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.grey[600],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Icon(
                                                      CupertinoIcons.clock,
                                                      color: Color(0xFFCE181B),
                                                      size: 20.sp,
                                                    ),
                                                    SizedBox(width: 4.w),
                                                    Text(
                                                      '10 - 20 min',
                                                      style: TextStyle(
                                                        fontSize: 14.sp,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 4.h),
                                                Text(
                                                  'Delivery Time',
                                                  style: TextStyle(
                                                    fontSize: 12.sp,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.grey[600],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Image(
                                                      image: AssetImage(
                                                        'assets/near_me/two-wheeler.png',
                                                      ),
                                                      height: 20.r,
                                                      width: 20.r,
                                                    ),
                                                    SizedBox(width: 4.w),
                                                    Text(
                                                      'Rp 10.000',
                                                      style: TextStyle(
                                                        fontSize: 14.sp,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 4.h),
                                                Text(
                                                  'Delivery Fee',
                                                  style: TextStyle(
                                                    fontSize: 12.sp,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.grey[600],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              Positioned(
                                left: 350.w,
                                top: 20.h,
                                child: Container(
                                  width: 43.w,
                                  height: 43.h,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFCE181B),
                                    borderRadius: BorderRadius.circular(30.r),
                                  ),
                                  child: Icon(
                                    CupertinoIcons.map_fill,
                                    size: 20.sp,
                                    color: Colors.white,
                                  ),
                                  // child: Image(
                                  //   image: AssetImage('assets/resto/map24.png'),
                                  //   fit: BoxFit.fill,
                                  //   width: 24.w,
                                  //   height: 24.h,
                                  // ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SliverToBoxAdapter(
                  child: Container(
                    width: 390.w,
                    height: 60.h,
                    margin: EdgeInsets.symmetric(horizontal: 16.w),
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 12.h,
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xFFFFF5F5),
                      borderRadius: BorderRadius.circular(22.r),
                      border: Border.all(color: Colors.grey[200]!),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 40.r,
                          height: 40.r,
                          decoration: BoxDecoration(
                            color: Color(0xFFCE181B),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            CupertinoIcons.tag_fill,
                            color: Colors.white,
                            size: 20.sp,
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: Text(
                            'Your have available promo',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Icon(
                          CupertinoIcons.chevron_right,
                          color: Colors.grey[400],
                          size: 20.sp,
                        ),
                      ],
                    ),
                  ),
                ),

                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 20.h,
                    ),
                    child: Text(
                      'Recommended Menu',
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),

                SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  sliver: SliverGrid(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.75,
                      crossAxisSpacing: 12.w,
                      mainAxisSpacing: 12.h,
                    ),
                    delegate: SliverChildListDelegate([
                      _buildGridMenuItem(
                        'Paket Hemat Sate Kambing',
                        '10 skewers of satay + Rice + Sweet Tea',
                        'Rp 23.000',
                        'assets/resto/kambing.png',
                        selectedQuantity1,
                        (quantity) =>
                            setState(() => selectedQuantity1 = quantity),
                        isBestSeller: true,
                      ),
                      _buildGridMenuItem(
                        'Paket Hemat Sate Ayam',
                        '10 skewers of satay + Rice + Sweet Tea',
                        'Rp 19.000',
                        'assets/resto/ayam.png',
                        selectedQuantity2,
                        (quantity) =>
                            setState(() => selectedQuantity2 = quantity),
                        isBestSeller: true,
                      ),
                      _buildGridMenuItem(
                        'Sate Kambing Special',
                        '15 skewers of premium satay + Rice + Soup',
                        'Rp 35.000',
                        'assets/resto/third.png',
                        0,
                        (quantity) => {},
                      ),
                      _buildGridMenuItem(
                        'Rawon Setan',
                        'Traditional beef soup with rice',
                        'Rp 25.000',
                        'assets/resto/fourth.png',
                        0,
                        (quantity) => {},
                      ),
                    ]),
                  ),
                ),

                SliverToBoxAdapter(child: SizedBox(height: 120.h)),
              ],
            ),

            if (selectedQuantity1 > 0 || selectedQuantity2 > 0)
              Positioned(
                top: 750,
                left: 17,
                child: Container(
                  width: 390.w,

                  height: 61.h,
                  decoration: BoxDecoration(
                    color: Color(0xFFCE181B),
                    borderRadius: BorderRadius.all(Radius.circular(22.r)),
                  ),

                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Total Price',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                'Rp ${((selectedQuantity1 * 23000) + (selectedQuantity2 * 19000)).toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: 117.w,
                            height: 36.h,

                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(25.r),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image(
                                  image: AssetImage(
                                    'assets/resto/shopping-basket-2.png',
                                  ),
                                  height: 20.h,
                                  width: 20.h,
                                ),
                                SizedBox(width: 8.w),
                                Text(
                                  'Add to cart',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildGridMenuItem(
    String title,
    String description,
    String price,
    String imagePath,
    int quantity,
    Function(int) onQuantityChanged, {
    bool isBestSeller = false,
  }) {
    return Container(
      width: 185.w,
      height: 266.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(13),
            blurRadius: 10.r,
            offset: Offset(0, 2.h),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.r),
                topRight: Radius.circular(16.r),
              ),
              child: Image.asset(
                imagePath,
                width: 185.w,
                height: 132.h,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.all(12.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[600],
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Text(
                        price,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w800,
                          color: Colors.black,
                        ),
                      ),
                      Spacer(),
                      if (quantity > 0) ...[
                        GestureDetector(
                          onTap: () => onQuantityChanged(quantity - 1),
                          child: Container(
                            width: 24.r,
                            height: 24.r,
                            decoration: BoxDecoration(
                              color: Color(0xFFFFF5F5),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              CupertinoIcons.minus,
                              size: 14.sp,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.w),
                          child: Text(
                            quantity.toString(),
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                      GestureDetector(
                        onTap: () => onQuantityChanged(quantity + 1),
                        child: Container(
                          width: 24.r,
                          height: 24.r,
                          decoration: BoxDecoration(
                            color: Color(0xFFBD1719),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            CupertinoIcons.plus,
                            size: 14.sp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
