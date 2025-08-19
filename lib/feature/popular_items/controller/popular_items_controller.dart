import 'package:flutter/material.dart';
import '../models/popular_item.dart';
import '../presentation/screens/item_details_screen.dart';

class PopularItemsController {
  final List<PopularItem> items = [
    PopularItem(
      text: 'Cooking Oil',
      image: 'aseets/images/homescreen/PopularItems/oil-removebg-preview.png',
      price: 10,
    ),
    PopularItem(
      text: 'Carton Packs',
      image: 'aseets/images/homescreen/PopularItems/boxs.png',
      price: 5,
    ),
    PopularItem(
      text: 'Plastic',
      image: 'aseets/images/homescreen/PopularItems/palsric-removebg-preview.png',
      price: 8,
    ),
    PopularItem(
      text: 'Paper',
      image: 'aseets/images/homescreen/PopularItems/poster-mock-up-removebg-preview.png',
      price: 2,
    ),
  ];

  void goToItemDetails(BuildContext context, PopularItem item) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => ItemDetailScreen(item: item),
        transitionsBuilder: (_, animation, __, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.easeInOut;
          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          return SlideTransition(position: animation.drive(tween), child: child);
        },
      ),
    );
  }
}
