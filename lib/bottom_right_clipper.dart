import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomRightClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.addRRect(
      RRect.fromRectAndCorners(
        Rect.fromLTWH(0, 0, size.width, size.height),
        bottomRight: Radius.circular(30.r),
      ),
    );
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
