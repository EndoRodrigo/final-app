import 'package:get/get_rx/src/rx_types/rx_types.dart';

class HomeController {
  var currentPageIndex = 0.obs;

  void changePage(int index) {
    currentPageIndex.value = index;
  }
}