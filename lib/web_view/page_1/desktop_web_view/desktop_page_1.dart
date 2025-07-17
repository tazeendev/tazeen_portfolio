import 'package:flutter/material.dart';
import 'package:tazeen_portfolio/controllers/utills/app_colors/app_colors.dart';
import 'package:tazeen_portfolio/controllers/utills/app_images/app_images.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.whiteText,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.09, // 8% horizontal padding
          vertical: 32,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- Heading ---
              Text(
                'About',
                style: TextStyle(
                  fontSize: screenWidth * 0.025, // ~32 at 1280px
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Castoro',
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 6),
              Container(
                width: screenWidth * 0.06, // ~80 at 1280px
                height: 3,
                color: Colors.brown,
              ),
              SizedBox(height: 10),
              Text(
                'Magnam dolores commodi suscipit. Necessitatibus eius consequuntur ex aliquid fuga eum quidem. Sit sint consectetur velit...',
                style: TextStyle(fontSize: screenWidth * 0.0125), // ~16 at 1280px
              ),
              SizedBox(height: 30),

              // --- Main Row ---
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Left Side Image
                  Expanded(
                    child: Image.asset(
                      AppImages.heroImage,
                      height: screenWidth * 0.35, // ~450 at 1280px
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.02), // ~20 at 1280px

                  // Right Side Text
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),
                        Text(
                          'UI/UX Designer & Web Developer',
                          style: TextStyle(
                            fontSize: screenWidth * 0.015, // ~18 at 1280px
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit...',
                          style: TextStyle(fontSize: screenWidth * 0.0125,fontFamily: 'PublicSans'),
                        ),
                        SizedBox(height: 20),

                        // Info Rows
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildInfoRow(
                              leftIconText: 'Birthday: 1 May 1995',
                              rightIconText: 'Age: 30',
                              screenWidth: screenWidth,
                            ),
                            _buildInfoRow(
                              leftIconText: 'Website: www.example.com',
                              rightIconText: 'Degree: Undergraduate',
                              screenWidth: screenWidth,
                            ),
                            _buildInfoRow(
                              leftIconText: 'Phone: +123 456 7890',
                              rightIconText: 'Email: tazeenzahrabatool@gmail.com',
                              screenWidth: screenWidth,
                            ),
                            _buildInfoRow(
                              leftIconText: 'City: Dera Ismail Khan',
                              rightIconText: 'Freelance: Available',
                              screenWidth: screenWidth,
                            ),
                          ],
                        ),

                        SizedBox(height: 20),
                        Text(
                          'Officiis eligendi itaque labore et dolorum mollitia officiis optio vero...',
                          style: TextStyle(fontSize: screenWidth * 0.0125, fontFamily: 'PublicSans'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow({
    required String leftIconText,
    required String rightIconText,
    required double screenWidth,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Icon(Icons.arrow_forward_ios, color: Colors.brown, size: 10),
          SizedBox(width: 10),
          Text(leftIconText, style: TextStyle(fontSize: screenWidth * 0.0125)),
          SizedBox(width: screenWidth * 0.05), // ~60 at 1280px
          Icon(Icons.arrow_forward_ios, color: Colors.brown, size: 10),
          SizedBox(width: 10),
          Flexible(
            child: Text(rightIconText, style: TextStyle(fontSize: screenWidth * 0.0125)),
          ),
        ],
      ),
    );
  }
}
