import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:tirando_factos/routing/app_routes.dart';
import 'package:tirando_factos/ui/core/Binding/customer_binding.dart';
import 'package:tirando_factos/ui/core/Binding/home_binding.dart';
import 'package:tirando_factos/ui/core/view/customer_view.dart';
import 'package:tirando_factos/ui/core/view/home_view.dart';
import 'package:tirando_factos/ui/core/view/login_view.dart';
import 'package:tirando_factos/ui/core/view/register_wiew.dart';

import '../ui/core/view/splash_view.dart';

class AppPages {
  static const INITIAL = AppRoutes.SPLASH;

  static final routes = [
    GetPage(name: AppRoutes.SPLASH, page: () => const SplashView()),
    GetPage(name: AppRoutes.REGISTER, page: () => const RegisterWiew()),
    GetPage(name: AppRoutes.LOGIN, page: () => const LoginView()),
    GetPage(name: AppRoutes.HOME, page: () =>  HomeView(), binding: HomeBinding()),
    GetPage(name: AppRoutes.CUSTOMER, page: () =>  CustomerView(), binding: CustomerBinding())
  ];
}
