import 'package:flutter/material.dart';

class CoinWidget extends StatelessWidget {
  final int coins;

  const CoinWidget({
    Key? key,
    required this.coins,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.amber.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(color: Colors.amber, width: 1),
      ),
      child: Row(
        children: [
          Image.asset(
            "aseets/images/profile/coins/coins.png",
            width: screenWidth * 0.12,
            height: screenWidth * 0.12,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              "$coins Coins",
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
