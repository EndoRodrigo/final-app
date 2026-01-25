import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/home_controller.dart';
import 'customer_view.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      body: IndexedStack(
        index: controller.currentPageIndex.value,
        children: [
          const Text('Explore'),
          CustomerView(),   // pestaña 0
          const Text('Profile'),  // pestaña 2
          const Text('Settings'), // pestaña 3
        ],
      ),
      bottomNavigationBar: NavigationBar(
        indicatorColor: Colors.blue,
        selectedIndex: controller.currentPageIndex.value,
        onDestinationSelected: controller.changePage,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.explore), label: 'Explore'),
          NavigationDestination(icon: Icon(Icons.person), label: 'Person'),
          NavigationDestination(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    ));
  }
}
