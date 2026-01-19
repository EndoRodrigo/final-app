import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tirando_factos/routing/app_pages.dart';
import 'package:tirando_factos/routing/app_routes.dart';
import 'package:tirando_factos/ui/core/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (_, _) {
        return GetMaterialApp(
          title: 'Tirando Factus',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.lightTheme,
          initialRoute: AppRoutes.SPLASH,
          getPages: AppPages.routes,
        );
      },
    );
  }
}
