import 'package:flutter/material.dart';

class ProfileLanguageSelector extends StatelessWidget {
  final String selectedLanguage;
  final ValueChanged<String> onChanged;

  const ProfileLanguageSelector({
    super.key,
    required this.selectedLanguage,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        _buildLanguageOption(screenWidth, 'Arabic'),
        SizedBox(height: screenWidth * 0.02),
        _buildLanguageOption(screenWidth, 'English'),
      ],
    );
  }

  Widget _buildLanguageOption(double screenWidth, String language) {
    return Container(
      padding: EdgeInsets.all(screenWidth * 0.03),
      decoration: BoxDecoration(
        color: Colors.white70,
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.language, size: screenWidth * 0.06, color: Colors.green),
              SizedBox(width: screenWidth * 0.03),
              Text(
                language,
                style: TextStyle(
                  fontSize: screenWidth * 0.04,
                  color: Colors.grey.shade700,
                ),
              ),
            ],
          ),
          Radio<String>(
            value: language,
            groupValue: selectedLanguage,
            onChanged: (value) => onChanged(value!),
            activeColor: Colors.green,
          ),
        ],
      ),
    );
  }
}
