import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:tazeen_portfolio/web_view/desktop_web_view/page_3/project_screen.dart';
import 'package:tazeen_portfolio/web_view/desktop_web_view/page_4/experience_section.dart';
import 'package:tazeen_portfolio/web_view/desktop_web_view/page_5/freelance_section.dart';
import 'package:tazeen_portfolio/web_view/desktop_web_view/page_6/footer_section.dart';
import '../../practice_screens/header_screen.dart';
import '../page_1/desktop_page_1.dart';
import '../../../core/utills/app_colors/app_colors.dart';
import '../page_1/header.dart';
import '../page_1/hero.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// ✅ Background Gradient
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black, Color(0xFF1E1E2C)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),

          /// ✅ Glow Overlay
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
              child: Container(color: Colors.black.withOpacity(0.15)),
            ),
          ),

          /// ✅ Scrollable Content
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 120), // Space for header
                const HeroSection(),
                const SizedBox(height: 50),
                const AboutScreen(),
                const SizedBox(height: 50),
                const ProjectScreen(),
                const SizedBox(height: 50),
                const ExperienceScreen(),
                const SizedBox(height: 50),
                const FreelanceHireMeSection(),
                const SizedBox(height: 50),
                FooterScreen(),
              ],
            ),
          ),

          /// ✅ Fixed Glassmorphic Header
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.zero,
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                child: Container(
                  height: 90,
                  color: Colors.black.withOpacity(0.5),
                  child: const HeaderScreen(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
