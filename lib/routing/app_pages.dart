import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:tirando_factos/routing/app_routes.dart';
import 'package:tirando_factos/ui/core/binding/ItemBinding.dart';
import 'package:tirando_factos/ui/core/view/customer_detail_view.dart';
import 'package:tirando_factos/ui/core/view/customer_view.dart';
import 'package:tirando_factos/ui/core/view/home_view.dart';
import 'package:tirando_factos/ui/core/view/item_view.dart';
import 'package:tirando_factos/ui/core/view/items_detail_view.dart';
import 'package:tirando_factos/ui/core/view/login_view.dart';
import 'package:tirando_factos/ui/core/view/register_wiew.dart';

import '../ui/core/binding/customer_binding.dart';
import '../ui/core/view/information_product.dart';
import '../ui/core/view/splash_view.dart';

class AppPages {
  static const INITIAL = AppRoutes.SPLASH;

  static final routes = [
    GetPage(name: AppRoutes.SPLASH, page: () =>  SplashView()),
    GetPage(name: AppRoutes.REGISTER, page: () =>  RegisterWiew()),
    GetPage(name: AppRoutes.LOGIN, page: () =>  LoginView()),
    GetPage(name: AppRoutes.HOME, page: () =>  HomeView()),
    GetPage(name: AppRoutes.CUSTOMER, page: () =>  CustomerView(), binding: CustomerBinding()),
    GetPage(name: AppRoutes.CUSTOMERDETAIL, page: () =>  CustomerDetailView()),
    GetPage(name: AppRoutes.ITEM, page: () =>  ItemView(), binding: Itembinding()),
    GetPage(name: AppRoutes.ITEMDETAIL, page: () =>  ItemsDetailView()),
    GetPage(name: AppRoutes.INFO, page: () =>  InformationProduct()),
  ];
}
