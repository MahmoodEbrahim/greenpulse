import 'package:flutter/material.dart';
import 'package:greenpulse/config/theme/app_colors.dart';
import 'package:greenpulse/feature/list/Screens/profilescreen/profile_header.dart';
import 'package:greenpulse/feature/list/Screens/profilescreen/profile_language_selector.dart';
import 'package:greenpulse/feature/list/Screens/profilescreen/profile_login_button.dart';
import 'package:greenpulse/feature/list/Screens/profilescreen/profile_option_tile.dart';

import 'coin_widget.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String _selectedLanguage = 'English';
  int myCoins = 0;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.02,
            vertical: screenHeight * 0.02,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProfileHeader(screenWidth: screenWidth),
              SizedBox(height: screenHeight * 0.03),
              CoinWidget(coins: myCoins),
              SizedBox(height: screenHeight * 0.03),
              Text(
                'About GreenPulse',
                style: TextStyle(
                  fontSize: screenWidth * 0.05,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor,
                ),
              ),
              SizedBox(height: screenHeight * 0.02),

              ProfileOptionTile(
                icon: Icons.info,
                title: 'About Us',
                onTap: () {},
              ),
              ProfileOptionTile(
                icon: Icons.description,
                title: 'Terms & Conditions',
                onTap: () {},
              ),
              ProfileOptionTile(
                icon: Icons.security,
                title: 'Privacy Policy',
                onTap: () {},
              ),


              SizedBox(height: screenHeight * 0.03),

              Text(
                'Language',
                style: TextStyle(
                  fontSize: screenWidth * 0.05,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor,
                ),
              ),
              SizedBox(height: screenHeight * 0.02),

              ProfileLanguageSelector(
                selectedLanguage: _selectedLanguage,
                onChanged: (value) {
                  setState(() => _selectedLanguage = value);
                },
              ),

              SizedBox(height: screenHeight * 0.03),
              ProfileLoginButton(screenWidth: screenWidth, screenHeight: screenHeight),
            ],
          ),
        ),
      ),
    );
  }
}
