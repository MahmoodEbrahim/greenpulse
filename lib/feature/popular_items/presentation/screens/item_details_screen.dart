import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'MapScreen.dart';
import '../../models/popular_item.dart';

class ItemDetailScreen extends StatefulWidget {
  final PopularItem item;

  const ItemDetailScreen({super.key, required this.item});

  @override
  State<ItemDetailScreen> createState() => _ItemDetailScreenState();
}

class _ItemDetailScreenState extends State<ItemDetailScreen> {
  int quantity = 1;
  LatLng? selectedLocation;
  final TextEditingController detailsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double pricePerUnit = widget.item.price.toDouble();
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

            // التحكم في الكمية
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    if (quantity > 1) setState(() => quantity--);
                  },
                  icon: const Icon(Icons.remove_circle),
                ),
                Text(quantity.toString(),
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                IconButton(
                  onPressed: () => setState(() => quantity++),
                  icon: const Icon(Icons.add_circle),
                ),
              ],
            ),
            const SizedBox(height: 20),

            Text("Total Price: ${totalPrice.toStringAsFixed(2)} EGP",
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Text(
                    selectedLocation != null
                        ? "Lat: ${selectedLocation!.latitude}, Lng: ${selectedLocation!.longitude}"
                        : "No location selected",
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.location_on, color: Colors.red),
                  onPressed: () async {
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MapScreen()),
                    );
                    if (result != null) {
                      setState(() {
                        selectedLocation = result;
                      });
                    }
                  },
                ),
              ],
            ),

            const SizedBox(height: 20),

            TextField(
              controller: detailsController,
              maxLines: 3,
              decoration: InputDecoration(
                labelText: "Enter details about the item",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
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
                  SnackBar(
                    content: Text(
                      "Order Confirmed:\n"
                          "$quantity x ${widget.item.text} (${widget.item.price} EGP each)\n"
                          "Total: $totalPrice EGP\n"
                          "Location: Lat:${selectedLocation!.latitude}, Lng:${selectedLocation!.longitude}\n"
                          "Details: ${detailsController.text}",
                    ),
                  ),
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
