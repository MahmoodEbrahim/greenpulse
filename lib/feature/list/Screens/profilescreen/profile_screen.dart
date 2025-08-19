import 'package:flutter/material.dart';
import '../../../../config/theme/theme.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // Define the opacity for the white overlay
  static const double overlayOpacity = 0.77;

  // Variable to track selected language
  String _selectedLanguage = 'English';

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            // Background Image
            Positioned.fill(
              child: Image.asset(
                'aseets/images/chat2screen.jpeg',
                fit: BoxFit.cover,
              ),
            ),
            // White Overlay with Opacity
            Positioned.fill(
              child: Container(
                color: Colors.blueGrey.withOpacity(overlayOpacity),
              ),
            ),
            // Content
            SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.02,
                vertical: screenHeight * 0.02,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Welcome Section
                  Row(
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
                            style: AppTheme.headingStyle.copyWith(
                              fontSize: screenWidth * 0.06,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.03),

                  // About GreenPulse Section
                  Text(
                    'About GreenPulse',
                    style: TextStyle(
                      fontSize: screenWidth * 0.05,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.primaryColor,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),

                  // Options List
                  _buildOptionTile(
                    context,
                    icon: Icons.info,
                    title: 'About Us',
                    onTap: () {
                      // Navigate to About Us screen (to be implemented)
                    },
                  ),
                  _buildOptionTile(
                    context,
                    icon: Icons.description,
                    title: 'Terms & Conditions',
                    onTap: () {
                      // Navigate to Terms & Conditions screen
                    },
                  ),
                  _buildOptionTile(
                    context,
                    icon: Icons.security,
                    title: 'Privacy Policy',
                    onTap: () {
                      // Navigate to Privacy Policy screen
                    },
                  ),
                  _buildOptionTile(
                    context,
                    icon: Icons.email,
                    title: 'Contact Us',
                    onTap: () {
                      // Navigate to Contact Us screen (already implemented as ChatScreen)
                      Navigator.pushNamed(context, '/chat');
                    },
                  ),
                  SizedBox(height: screenHeight * 0.03),

                  // Language Selection
                  Text(
                    'Language',
                    style: TextStyle(
                      fontSize: screenWidth * 0.05,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.primaryColor,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Container(
                    padding: EdgeInsets.all(screenWidth * 0.03),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.language,
                              size: screenWidth * 0.06,
                              color: Colors.green,
                            ),
                            SizedBox(width: screenWidth * 0.03),
                            Text(
                              'Arabic',
                              style: TextStyle(
                                fontSize: screenWidth * 0.04,
                                color: Colors.grey.shade700,
                              ),
                            ),
                          ],
                        ),
                        Radio<String>(
                          value: 'Arabic',
                          groupValue: _selectedLanguage,
                          onChanged: (value) {
                            setState(() {
                              _selectedLanguage = value!;
                            });
                          },
                          activeColor: Colors.green,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.021),
                  Container(
                    padding: EdgeInsets.all(screenWidth * 0.03),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.language,
                              size: screenWidth * 0.06,
                              color: Colors.green,
                            ),
                            SizedBox(width: screenWidth * 0.03),
                            Text(
                              'English',
                              style: TextStyle(
                                fontSize: screenWidth * 0.04,
                                color: Colors.grey.shade700,
                              ),
                            ),
                          ],
                        ),
                        Radio<String>(
                          value: 'English',
                          groupValue: _selectedLanguage,
                          onChanged: (value) {
                            setState(() {
                              _selectedLanguage = value!;
                            });
                          },
                          activeColor: Colors.green,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.034),

                  // Login Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigate to Login screen (to be implemented)
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: screenHeight * 0.02,
                        ),
                      ),
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: screenWidth * 0.04,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionTile(BuildContext context, {required IconData icon, required String title, required VoidCallback onTap}) {
    final screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: screenWidth * 0.02),
        padding: EdgeInsets.all(screenWidth * 0.03),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  size: screenWidth * 0.06,
                  color: Colors.green,
                ),
                SizedBox(width: screenWidth * 0.03),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: screenWidth * 0.04,
                    color: Colors.grey.shade700,
                  ),
                ),
              ],
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: screenWidth * 0.04,
              color: Colors.grey.shade600,
            ),
          ],
        ),
      ),
    );
  }
}
