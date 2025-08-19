import 'package:flutter/material.dart';

import '../../models/popular_item.dart';

class ItemDetailScreen extends StatefulWidget {
  final PopularItem item;

  const ItemDetailScreen({super.key, required this.item});

  @override
  State<ItemDetailScreen> createState() => _ItemDetailScreenState();
}

class _ItemDetailScreenState extends State<ItemDetailScreen> {
  int quantity = 1;
  double pricePerUnit = 10;

  String? selectedLocation;

  @override
  Widget build(BuildContext context) {
    double totalPrice = quantity * pricePerUnit;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.item.text),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Image.asset(widget.item.image, height: 120),
            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    if (quantity > 1) {
                      setState(() => quantity--);
                    }
                  },
                  icon: const Icon(Icons.remove_circle),
                ),
                Text(
                  quantity.toString(),
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  onPressed: () => setState(() => quantity++),
                  icon: const Icon(Icons.add_circle),
                ),
              ],
            ),
            const SizedBox(height: 20),

            Text(
              "Total Price: \$${totalPrice.toStringAsFixed(2)}",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),

            const SizedBox(height: 20),

            DropdownButton<String>(
              value: selectedLocation,
              hint: const Text("Select Location"),
              isExpanded: true,
              items: ["Cairo", "Alexandria", "Giza"].map((loc) {
                return DropdownMenuItem(value: loc, child: Text(loc));
              }).toList(),
              onChanged: (val) {
                setState(() {
                  selectedLocation = val;
                });
              },
            ),

            const Spacer(),

            ElevatedButton(
              onPressed: () {
                if (selectedLocation == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Please select a location")),
                  );
                  return;
                }
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Order Confirmed for $quantity ${widget.item.text} at $selectedLocation")),
                );
              },
              child: const Text("Confirm Order"),
            )
          ],
        ),
      ),
    );
  }
}
