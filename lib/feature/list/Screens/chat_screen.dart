import 'package:flutter/material.dart';
import '../../../config/theme/app_text_styles.dart';
import '../../../config/theme/theme.dart';
class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  // Define the opacity for the white overlay
  static const double overlayOpacity = 0.77; // You can change this value

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
              child: Container(
                color: Colors.white.withOpacity(overlayOpacity),
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
                  // Title
                  Text(
                    'Chat Us',
                    style: AppTextStyles.headingStyle.copyWith(
                      fontSize: screenWidth * 0.06,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),

                  // Contact Info
                  Text(
                    'You Can Reach Us Saturday – Thursday from 9 AM to 5PM',
                    style: TextStyle(
                      fontSize: screenWidth * 0.035,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),

                  SizedBox(height: screenHeight * 0.04),

                  // Form Fields
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Full Name',
                      hintStyle: TextStyle(
                        fontSize: screenWidth * 0.035,
                        color: Theme.of(context).primaryColor,
                      ),
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.green),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),

                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Email Address',
                      hintStyle: TextStyle(
                        fontSize: screenWidth * 0.035,
                        color: Theme.of(context).primaryColor,
                      ),
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.green),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),

                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Mobile Number',
                      hintStyle: TextStyle(
                        fontSize: screenWidth * 0.035,
                        color: Theme.of(context).primaryColor,
                      ),
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),

                  TextField(
                    maxLines: 4,
                    decoration: InputDecoration(
                      hintText: 'Enter your message',
                      hintStyle: TextStyle(
                        fontSize: screenWidth * 0.035,
                        color: Theme.of(context).primaryColor,
                      ),
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.green),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.08),

                  // Send Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
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
                        'Send Request',
                        style: TextStyle(
                          fontSize: screenWidth * 0.04,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.05),

                  // Phone Numbers
                  Row(
                    children: [
                      Icon(
                        Icons.phone,
                        size: screenWidth * 0.05,
                        color: Theme.of(context).primaryColor,
                      ),
                      SizedBox(width: screenWidth * 0.02),
                      Text(
                        '01125428292',
                        style: TextStyle(
                          fontSize: screenWidth * 0.035,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.05),
                      Icon(
                        Icons.phone,
                        size: screenWidth * 0.05,
                        color: Theme.of(context).primaryColor,
                      ),
                      SizedBox(width: screenWidth * 0.02),
                      Text(
                        '01008526091',
                        style: TextStyle(
                          fontSize: screenWidth * 0.035,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.03),

                  // Email
                  Row(
                    children: [
                      Icon(
                        Icons.email,
                        size: screenWidth * 0.05,
                        color: Theme.of(context).primaryColor,
                      ),
                      SizedBox(width: screenWidth * 0.02),
                      Text(
                        'hello@greenpulse.com',
                        style: TextStyle(
                          fontSize: screenWidth * 0.035,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}