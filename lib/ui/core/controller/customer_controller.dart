import 'package:get/get_rx/src/rx_types/rx_types.dart';

class CustomerController {
  var currentIndex = 0.obs;

  void changePage(int index) {
    currentIndex.value = index;
  }
}