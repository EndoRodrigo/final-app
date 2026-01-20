

import 'package:get/get.dart';
import 'package:tirando_factos/routing/app_routes.dart';

class SplashController extends GetxController{
  
  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration(seconds: 3),(){
      Get.offAllNamed(AppRoutes.REGISTER);
    });
    
  }
}