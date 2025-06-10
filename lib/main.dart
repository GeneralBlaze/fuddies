import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_routes.dart';

void main() {
  runApp(const FuddiesApp());
}

class FuddiesApp extends StatelessWidget {
  const FuddiesApp({super.key});

  static const Color _primaryRed = Color(0xFFE53935);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder:
          (_, child) => CupertinoApp(
            debugShowCheckedModeBanner: false,
            title: 'Fuddies',
            theme: const CupertinoThemeData(
              primaryColor: _primaryRed,
              scaffoldBackgroundColor: CupertinoColors.white,
              textTheme: CupertinoTextThemeData(
                textStyle: TextStyle(fontFamily: 'PlusJakartaSans'),
                navTitleTextStyle: TextStyle(
                  fontFamily: 'PlusJakartaSans',
                  fontWeight: FontWeight.w600,
                ),
                actionTextStyle: TextStyle(
                  fontFamily: 'PlusJakartaSans',
                  fontWeight: FontWeight.w500,
                ),
                pickerTextStyle: TextStyle(fontFamily: 'PlusJakartaSans'),
              ),
            ),
            initialRoute: AppRoutes.home,
            routes: AppRoutes.routes,
          ),
    );
  }
}
