import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:tirando_factos/routing/app_routes.dart';

import '../ui/core/view/splash_view.dart';

class AppPages {
  static const INITIAL = AppRoutes.SPLASH;

  static final routes = [
    GetPage(name: AppRoutes.SPLASH, page: () => const SplashView()),
  ];
}
