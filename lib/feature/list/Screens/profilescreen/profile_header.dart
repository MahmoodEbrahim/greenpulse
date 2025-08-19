import 'package:flutter/material.dart';
import 'package:greenpulse/config/theme/app_text_styles.dart';

class ProfileHeader extends StatelessWidget {
  final double screenWidth;

  const ProfileHeader({super.key, required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.person,
          size: screenWidth * 0.1,
          color: Theme.of(context).primaryColor,
        ),
        SizedBox(width: screenWidth * 0.03),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome to GreenPulse,',
              style: TextStyle(
                fontSize: screenWidth * 0.04,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).primaryColor,
              ),
            ),
            Text(
              'Guest',
              style: AppTextStyles.headingStyle.copyWith(
                fontSize: screenWidth * 0.06,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
