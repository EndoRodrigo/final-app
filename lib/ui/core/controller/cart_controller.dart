import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/model/item_model.dart';

class CartItem {
  final ItemModel item;
  RxInt quantity;

  CartItem({required this.item, int quantity = 1}) : quantity = quantity.obs;
}

class CartController extends GetxController {
  var cartItems = <CartItem>[].obs;

  void addToCart(ItemModel item) {
    var existingItem = cartItems.firstWhereOrNull((element) => element.item.id == item.id);
    if (existingItem != null) {
      existingItem.quantity.value++;
    } else {
      cartItems.add(CartItem(item: item));
    }
    Get.snackbar(
      'Carrito', 
      '${item.name} agregado al carrito', 
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.orange.withOpacity(0.9),
      colorText: Colors.white,
    );
  }

  void removeFromCart(String id) {
    cartItems.removeWhere((element) => element.item.id == id);
  }

  void updateQuantity(String id, bool increase) {
    var item = cartItems.firstWhereOrNull((element) => element.item.id == id);
    if (item != null) {
      if (increase) {
        item.quantity.value++;
      } else if (item.quantity.value > 1) {
        item.quantity.value--;
      }
    }
  }

  double get subtotal => cartItems.fold(0, (sum, item) => sum + (item.item.price * item.quantity.value));
  int get totalItems => cartItems.fold(0, (sum, item) => sum + item.quantity.value);
}
