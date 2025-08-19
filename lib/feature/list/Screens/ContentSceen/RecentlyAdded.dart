import 'package:flutter/material.dart';

class RecentlyAdded extends StatefulWidget {
  const RecentlyAdded({super.key});

  @override
  State<RecentlyAdded> createState() => _RecentlyAddedState();
}

class _RecentlyAddedState extends State<RecentlyAdded> {
  int _currentPage = 0;

  // List of items (15 items: 5 pages, 3 items per page)
  static const List<Map<String, String>> _items = [
    {'name': 'Aluminum', 'price': '80 L.E / KG', 'image': 'aseets/images/appicon.png'},
    {'name': 'Mixer', 'price': '15 L.E / Piece', 'image': 'aseets/images/appicon.png'},
    {'name': 'Scooter', 'price': '40 L.E / Piece', 'image': 'aseets/images/appicon.png'},
    {'name': 'Plastic Bottles', 'price': '10 L.E / KG', 'image': 'assets/images/plastic_bottles.png'},
    {'name': 'Glass Jars', 'price': '5 L.E / Piece', 'image': 'assets/images/glass_jars.png'},
    {'name': 'Cardboard', 'price': '20 L.E / KG', 'image': 'assets/images/cardboard.png'},
    {'name': 'Steel Cans', 'price': '30 L.E / KG', 'image': 'assets/images/steel_cans.png'},
    {'name': 'Old Books', 'price': '8 L.E / KG', 'image': 'assets/images/old_books.png'},
    {'name': 'Wooden Pallets', 'price': '25 L.E / Piece', 'image': 'assets/images/wooden_pallets.png'},
    {'name': 'Copper Wire', 'price': '100 L.E / KG', 'image': 'assets/images/copper_wire.png'},
    {'name': 'Bicycle', 'price': '50 L.E / Piece', 'image': 'assets/images/bicycle.png'},
    {'name': 'Tin Cans', 'price': '12 L.E / KG', 'image': 'assets/images/tin_cans.png'},
    {'name': 'Plastic Bags', 'price': '7 L.E / KG', 'image': 'assets/images/plastic_bags.png'},
    {'name': 'Old Shoes', 'price': '15 L.E / Pair', 'image': 'assets/images/old_shoes.png'},
    {'name': 'Metal Scrap', 'price': '35 L.E / KG', 'image': 'assets/images/metal_scrap.png'},
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recently Added ',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontSize: screenWidth * 0.045, // 4.5% of screen width
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: screenHeight * 0.02),
        SizedBox(
          height: screenHeight * 0.35, // Adjust height to fit 3 items
          child: PageView.builder(
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemCount: 5, // 5 pages
            itemBuilder: (context, pageIndex) {
              // Calculate the start index for the current page
              final startIndex = pageIndex * 3;
              return ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 3, // 3 items per page
                itemBuilder: (context, index) {
                  final itemIndex = startIndex + index;
                  if (itemIndex >= _items.length) return const SizedBox.shrink();
                  final item = _items[itemIndex];
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
                    child: Container(
                      padding: EdgeInsets.all(screenWidth * 0.03),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 3,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              item['image']!,
                              width: screenWidth * 0.2, // 20% of screen width
                              height: screenWidth * 0.2,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return const Icon(
                                  Icons.error,
                                  color: Colors.red,
                                  size: 40,
                                );
                              },
                            ),
                          ),
                          SizedBox(width: screenWidth * 0.03),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item['name']!,
                                  style: TextStyle(
                                    fontSize: screenWidth * 0.04,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: screenHeight * 0.005),
                                Text(
                                  item['price']!,
                                  style: TextStyle(
                                    fontSize: screenWidth * 0.035,
                                    color: Colors.green,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: screenWidth * 0.02),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: screenWidth * 0.03,
                                vertical: screenHeight * 0.015,
                              ),
                            ),
                            child: Text(
                              'Add to Bin',
                              style: TextStyle(fontSize: screenWidth * 0.035),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
        SizedBox(height: screenHeight * 0.02),
        // Page Indicators (Dots)
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(5, (index) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
              width: _currentPage == index ? 12 : 8,
              height: _currentPage == index ? 12 : 8,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentPage == index ? Colors.green : Colors.grey,
              ),
            );
          }),
        ),
      ],
    );
  }
}