import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:greenpulse/feature/list/Screens/ContentSceen/popular_items.dart';
import '../../../../config/theme/app_colors.dart';
import '../../../../config/theme/app_text_styles.dart';
import '../../../../config/theme/theme.dart';
import 'RecentlyAdded.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.02,
            vertical: screenHeight * 0.02,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  height: screenHeight * 0.3,
                  viewportFraction: 0.9,
                  enlargeCenterPage: true,
                  autoPlay: true,
                ),
                items: [
                  'aseets/images/homescreen/_5b8aba30-73d6-4e59-8697-39fde023efaa.jpeg',
                  'aseets/images/homescreen/_99b4072a-07a4-4f6a-bdf3-33bf6f07747c.jpeg',
                  'aseets/images/homescreen/_b44f232a-23c9-495e-b187-fe48488cb351.jpeg',
                ].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: screenWidth * 0.9,
                        margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            i,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              SizedBox(height: screenHeight * 0.03),
              Text(
                'Recycle & Reuse',
                style: AppTextStyles.headingStyle.copyWith(
                  fontSize: screenWidth * 0.06,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: screenHeight * 0.03),
              DottedLine(
                dashLength: screenWidth * 0.1,
                dashGapLength: screenWidth * 0.03,
                lineThickness: 4.0,
                dashColor: Theme.of(context).primaryColor,
              ),
              SizedBox(height: screenHeight * 0.03),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Popular',
                    style: AppTextStyles.headingStyle.copyWith(
                      fontSize: screenWidth * 0.04,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.015),
              const PopularItems(),
              SizedBox(height: screenHeight * 0.03),
              const RecentlyAdded(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryContainer(BuildContext context,
      {required IconData icon, required String label}) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        color: AppColors.accentColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: screenWidth * 0.12,
            color: AppColors.primaryColor,
          ),
          SizedBox(height: screenWidth * 0.025),
          Text(
            label,
            style: AppTextStyles.bodyTextStyle.copyWith(
              fontSize: screenWidth * 0.045,
            ),
          ),
        ],
      ),
    );
  }
}