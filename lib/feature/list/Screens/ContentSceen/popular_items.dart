import 'package:flutter/material.dart';

class PopularItems extends StatelessWidget {
  const PopularItems({super.key});

  // Updated list with corrected image paths
  static const List<Map<String, String>> _items = [
    {'text': 'Cooking Oil', 'image': 'aseets/images/homescreen/PopularItems/oil-removebg-preview.png'},
    {'text': 'Carton Packs', 'image': 'aseets/images/homescreen/PopularItems/boxs.png'},
    {'text': 'Plastic', 'image': 'aseets/images/homescreen/PopularItems/palsric-removebg-preview.png'},
    {'text': 'Paper', 'image': 'aseets/images/homescreen/PopularItems/poster-mock-up-removebg-preview.png'},
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: screenWidth * 0.03, // 3% of screen width
        crossAxisSpacing: screenWidth * 0.03, // 3% of screen width
        childAspectRatio: 3.5, // Increased to make containers wider
      ),
      itemCount: _items.length,
      itemBuilder: (context, index) {
        return AnimatedGridItem(
          index: index,
          text: _items[index]['text']!,
          imagePath: _items[index]['image']!,
        );
      },
    );
  }
}

class AnimatedGridItem extends StatefulWidget {
  final int index;
  final String text;
  final String imagePath;

  const AnimatedGridItem({
    super.key,
    required this.index,
    required this.text,
    required this.imagePath,
  });

  @override
  State<AnimatedGridItem> createState() => _AnimatedGridItemState();
}

class _AnimatedGridItemState extends State<AnimatedGridItem> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  late Animation<double> _opacityAnimation;
  bool _isTapped = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: Duration(milliseconds: 600 + widget.index * 100),
      vsync: this,
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0.0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    _opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          _isTapped = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          _isTapped = false;
        });
      },
      onTapCancel: () {
        setState(() {
          _isTapped = false;
        });
      },
      child: SlideTransition(
        position: _offsetAnimation,
        child: FadeTransition(
          opacity: _opacityAnimation,
          child: AnimatedScale(
            scale: _isTapped ? 0.95 : 1.0,
            duration: const Duration(milliseconds: 200),
            child: Container(
              padding: EdgeInsets.all(screenWidth * 0.02), // 2% of screen width
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      widget.imagePath,
                      width: screenWidth * 0.1, // 10% of screen width
                      height: screenWidth * 0.1,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(
                          Icons.error,
                          color: Colors.red,
                          size: 40,
                        ); // Fallback if image fails to load
                      },
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.02),
                  Expanded(
                    child: Text(
                      widget.text,
                      style: TextStyle(
                        fontSize: screenWidth * 0.035, // 3.5% of screen width
                        fontWeight: FontWeight.w600,
                        color: Colors.black
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}