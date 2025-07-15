import 'dart:ui';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:tazeen_portfolio/controllers/utills/app_images/app_images.dart';
import '../../../controllers/constants/components/sidebar_widget/sidebar_widget_screen.dart';
import '../../../controllers/utills/app_colors/app_colors.dart';

class DesktopPage1 extends StatefulWidget {
  @override
  State<DesktopPage1> createState() => _DesktopPage1State();
}

class _DesktopPage1State extends State<DesktopPage1> {
  bool isHoverHire = false;

  bool isHoverProjects = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Row(
        children: [
          SidebarWidget(),
          Expanded(
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  Container(
                    width: screenWidth * 1.0,
                    height: screenHeight * 1.5,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(AppImages.heroImage),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: ClipRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                        child: Container(
                          color: Colors.black.withOpacity(0.01), // Dark tint
                        ),
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 80,
                        vertical: 200,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                       // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Tazeen ',
                                  style: TextStyle(
                                    fontSize: 60,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Zahra ',
                                  style: TextStyle(
                                    fontSize: 60,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.primaryBlack,
                                  ),
                                ),
                                // TextSpan(
                                //   text: 'Batool',
                                //   style: TextStyle(
                                //     fontSize: 50,
                                //     fontWeight: FontWeight.bold,
                                //     color: Colors.white,
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                          SizedBox(height: 16),

                          /// Animated Text (Typewriter)
                          SizedBox(
                            height: 40,
                            child: DefaultTextStyle(
                              style: TextStyle(
                                fontFamily: 'PublicSans',
                                fontSize: 30,
                                color: Colors.white70,
                                fontWeight: FontWeight.w600,
                              ),
                              child: AnimatedTextKit(
                                animatedTexts: [
                                  TypewriterAnimatedText(
                                    "I'm Flutter Developer",
                                    speed: Duration(milliseconds: 100),
                                  ),
                                  TypewriterAnimatedText(
                                    "I'm UI/UX Designer",
                                    speed: Duration(milliseconds: 100),
                                  ),
                                  TypewriterAnimatedText(
                                    "I'm Programmer",
                                    speed: Duration(milliseconds: 100),
                                  ),
                                ],
                                repeatForever: true,
                              ),
                            ),
                          ),
                          SizedBox(height: 28),
                          Row(
                            children: [
                              /// HIRE ME Button
                              MouseRegion(
                                onEnter: (_) =>
                                    setState(() => isHoverHire = true),
                                onExit: (_) =>
                                    setState(() => isHoverHire = false),
                                child: AnimatedContainer(
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                  decoration: BoxDecoration(
                                    color: isHoverHire
                                        ? Colors.black
                                        : Colors.brown,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors
                                          .transparent, // handled by container
                                      shadowColor: Colors
                                          .transparent, // remove default shadow
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 30,
                                        vertical: 18,
                                      ),
                                    ),
                                    child: Text(
                                      'Hire Me',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 20),
                              MouseRegion(
                                onEnter: (_) =>
                                    setState(() => isHoverProjects = true),
                                onExit: (_) =>
                                    setState(() => isHoverProjects = false),
                                child: AnimatedContainer(
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                  decoration: BoxDecoration(
                                    color: isHoverProjects
                                        ? Colors.brown
                                        : Colors.transparent,
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: TextButton(
                                    onPressed: () {},
                                    style: TextButton.styleFrom(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 30,
                                        vertical: 18,
                                      ),
                                    ),
                                    child: Text(
                                      'View Projects',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
