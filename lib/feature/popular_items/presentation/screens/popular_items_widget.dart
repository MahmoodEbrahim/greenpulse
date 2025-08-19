import 'package:flutter/material.dart';
import '../../controller/popular_items_controller.dart';

class PopularItemsWidget extends StatelessWidget {
  final PopularItemsController controller = PopularItemsController();

  PopularItemsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: controller.items.length,
        itemBuilder: (context, index) {
          final item = controller.items[index];
          return GestureDetector(
            onTap: () => controller.goToItemDetails(context, item),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              width: 130,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: Offset(2, 4),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(item.image, width: 80, height: 80, fit: BoxFit.contain),
                  const SizedBox(height: 10),
                  Text(
                    item.text,
                    style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "${item.price} EGP",
                    style: const TextStyle(fontSize: 13, color: Colors.green),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
