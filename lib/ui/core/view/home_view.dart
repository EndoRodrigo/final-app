import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tirando_factos/ui/core/view/customer_detail_view.dart';
import 'package:tirando_factos/ui/core/view/items_detail_view.dart';

import '../../../routing/app_routes.dart';
import '../controller/home_controller.dart';
import 'home_detail_view.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () =>Get.toNamed(AppRoutes.PROFILE), icon: const Icon(Icons.person_2),),
        actions: [
          IconButton(onPressed: () =>Get.toNamed(AppRoutes.CART), icon: const Icon(Icons.shopping_cart),),
        ],
      ),

      body: IndexedStack(
        index: controller.currentPageIndex.value,
        children: [
          HomeDetailView(),
          ItemsDetailView(),   // pestaña 0
          CustomerDetailView(),  // pestaña 2
          const Text('Settings'), // pestaña 3
        ],
      ),
      bottomNavigationBar: NavigationBar(
        indicatorColor: Colors.blue,
        selectedIndex: controller.currentPageIndex.value,
        onDestinationSelected: controller.changePage,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.category), label: 'Product'),
          NavigationDestination(icon: Icon(Icons.person), label: 'Person'),
          NavigationDestination(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    ));
  }
}
