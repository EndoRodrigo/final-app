import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/model/item_model.dart';
import '../controller/cart_controller.dart';

class InformationProduct extends StatefulWidget {
  const InformationProduct({super.key});

  @override
  State<InformationProduct> createState() => _InformationProductState();
}

class _InformationProductState extends State<InformationProduct> {
  int selectedSize = 1;
  int selectedColor = 0;
  final cartController = Get.put(CartController());

  final List<String> sizes = ["US 6", "US 7", "US 8", "US 9"];

  final List<Color> colors = [
    Colors.orange,
    Colors.deepPurple,
    Colors.black,
    Colors.red,
    Colors.blue,
  ];

  @override
  Widget build(BuildContext context) {
    // Manejo seguro de argumentos
    final dynamic data = Get.arguments;
    ItemModel? item;
    
    String name = "Producto";
    String price = "0.0";
    String image = "https://www.freeiconspng.com/uploads/no-image-icon-6.png"; 

    if (data != null) {
      if (data is ItemModel) {
        item = data;
        name = item.name;
        price = item.price.toString();
        // image = item.imageUrl ?? image; // Si tienes imagen en el modelo
      } else if (data is Map<String, dynamic>) {
        name = data["name"]?.toString() ?? name;
        price = data["price"]?.toString() ?? price;
        image = data["image"]?.toString() ?? image;
        // Intentar crear un ItemModel si es un Map
        try {
          item = ItemModel.fromMap(data['id']?.toString() ?? '', data);
        } catch (_) {}
      }
    }

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Column(
          children: [
            /// 🔹 Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _circleButton(Icons.arrow_back, () => Get.back()),
                  Stack(
                    children: [
                      _circleButton(Icons.shopping_cart_outlined, () => Get.toNamed('/cart')), // Asumiendo ruta /cart
                      Obx(() => cartController.totalItems > 0 
                        ? Positioned(
                            right: 0,
                            top: 0,
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                              child: Text('${cartController.totalItems}', style: const TextStyle(color: Colors.white, fontSize: 10)),
                            ),
                          )
                        : const SizedBox.shrink()),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            /// 🔹 Imagen principal
            SizedBox(
              height: 220,
              child: image.startsWith('http') 
                ? Image.network(image, fit: BoxFit.contain, errorBuilder: (_, __, ___) => const Icon(Icons.broken_image, size: 100))
                : const Icon(Icons.image_not_supported, size: 100),
            ),

            const SizedBox(height: 15),

            /// 🔹 Miniaturas
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                3,
                    (index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: index == 0
                          ? Colors.orange
                          : Colors.transparent,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: image.startsWith('http') 
                    ? Image.network(image, height: 40, errorBuilder: (_, __, ___) => const Icon(Icons.broken_image))
                    : const Icon(Icons.broken_image),
                ),
              ),
            ),

            const SizedBox(height: 20),

            /// 🔹 Contenido
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(30),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Nombre + Precio
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              name.toUpperCase(),
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Text(
                            "\$ $price",
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.orange,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 6),

                      /// Rating
                      Row(
                        children: List.generate(
                          4,
                              (index) => const Icon(
                            Icons.star,
                            color: Colors.orange,
                            size: 18,
                          ),
                        )
                          ..add(const Icon(
                            Icons.star_border,
                            color: Colors.orange,
                            size: 18,
                          )),
                      ),

                      const SizedBox(height: 20),

                      /// Tallas
                      const Text(
                        "Available Sizes",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),

                      Row(
                        children: List.generate(
                          sizes.length,
                              (index) => GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedSize = index;
                              });
                            },
                            child: Container(
                              margin:
                              const EdgeInsets.only(right: 10),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 14, vertical: 8),
                              decoration: BoxDecoration(
                                color: selectedSize == index
                                    ? Colors.orange
                                    : Colors.grey[200],
                                borderRadius:
                                BorderRadius.circular(10),
                              ),
                              child: Text(
                                sizes[index],
                                style: TextStyle(
                                  color: selectedSize == index
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      /// Colores
                      const Text(
                        "Color",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),

                      Row(
                        children: List.generate(
                          colors.length,
                              (index) => GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedColor = index;
                              });
                            },
                            child: Container(
                              margin:
                              const EdgeInsets.only(right: 12),
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: selectedColor == index
                                      ? Colors.orange
                                      : Colors.transparent,
                                  width: 2,
                                ),
                              ),
                              child: CircleAvatar(
                                radius: 12,
                                backgroundColor: colors[index],
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      /// Descripción
                      const Text(
                        "Description",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "Inspired by the energy flows on Earth, "
                            "Nike Air Max 200 combines bold design with comfort. "
                            "The visible Air unit delivers maximum cushioning.",
                        style: TextStyle(color: Colors.grey),
                      ),

                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

      /// 🔹 Botón flotante
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        onPressed: () {
          if (item != null) {
            cartController.addToCart(item);
          } else {
            Get.snackbar('Error', 'No se pudo identificar el producto', backgroundColor: Colors.red, colorText: Colors.white);
          }
        },
        child: const Icon(Icons.shopping_bag),
      ),
    );
  }

  Widget _circleButton(IconData icon, VoidCallback onTap) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      child: IconButton(
        icon: Icon(icon),
        onPressed: onTap,
      ),
    );
  }
}
