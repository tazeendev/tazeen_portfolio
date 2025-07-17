import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:tazeen_portfolio/controllers/utills/app_colors/app_colors.dart';
import 'package:tazeen_portfolio/controllers/utills/app_images/app_images.dart';

class HeaderScreen extends StatefulWidget {
  const HeaderScreen({super.key});

  @override
  State<HeaderScreen> createState() => _HeaderScreenState();
}

class _HeaderScreenState extends State<HeaderScreen> {
  final List<String> leftMenu = ["Home", "Services", "Blog"];
  final List<String> rightMenu = ["About", "Contact", "Projects", "Resume"];
  String hoverMenu = "";
  bool isButtonHovered = false;

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

          /// ✅ Left Vertical Line
          Positioned(
            left: 20,
            top: 5,
            bottom: 0,
            child: _buildVerticalLineWithCircle(),
          ),

          /// ✅ Right Vertical Line
          Positioned(
            right: 20,
            top: 5,
            bottom: 0,
            child: _buildVerticalLineWithCircle(),
          ),

          /// ✅ Main Content
          Positioned.fill(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildHeader(),
                  _buildHeroSection(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// ✅ Header Section
  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 14),
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildDecoratedMenu(leftMenu),
          Image.asset('assets/logu/logo.png', height: 50),
          _buildDecoratedMenu(rightMenu, isRight: true),
        ],
      ),
    );
  }

  Widget _buildDecoratedMenu(List<String> menuItems, {bool isRight = false}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (isRight) _buildLineWithCircle(),
        Row(children: menuItems.map((item) => _buildHoverMenu(item)).toList()),
        if (!isRight) _buildLineWithCircle(),
        if (isRight) ...[
          const SizedBox(width: 16),
          _buildGetStartedButton(),
        ]
      ],
    );
  }

  Widget _buildLineWithCircle() {
    return Row(
      children: [
        Container(width: 60, height: 2, color: AppColors.primary),
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: AppColors.primary,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withOpacity(0.6),
                blurRadius: 12,
                spreadRadius: 3,
              ),
            ],
          ),
        ),
        const SizedBox(width: 10),
      ],
    );
  }

  /// ✅ Vertical Line Widget
  Widget _buildVerticalLineWithCircle() {
    return Column(
      children: [
        Container(
          width: 2,
          height: MediaQuery.of(context).size.height * 0.8,
          color: AppColors.primary.withOpacity(0.6),
        ),
        Container(
          width: 14,
          height: 14,
          decoration: BoxDecoration(
            color: AppColors.primary,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withOpacity(0.8),
                blurRadius: 20,
                spreadRadius: 5,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildHoverMenu(String text) {
    bool isHovered = hoverMenu == text;
    return MouseRegion(
      onEnter: (_) => setState(() => hoverMenu = text),
      onExit: (_) => setState(() => hoverMenu = ""),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        margin: const EdgeInsets.symmetric(horizontal: 14),
        transform: Matrix4.identity()..scale(isHovered ? 1.2 : 1.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 200),
              style: TextStyle(
                color: isHovered ? AppColors.primary : Colors.white70,
                fontSize: 15,
                letterSpacing: isHovered ? 1.2 : 0,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
              ),
              child: Text(text),
            ),
            const SizedBox(height: 4),
            AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              height: 2,
              width: isHovered ? 25 : 0,
              color: AppColors.primary,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGetStartedButton() {
    return MouseRegion(
      onEnter: (_) => setState(() => isButtonHovered = true),
      onExit: (_) => setState(() => isButtonHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          boxShadow: isButtonHovered
              ? [
            BoxShadow(
              color: AppColors.primary.withOpacity(0.7),
              blurRadius: 15,
              spreadRadius: 4,
            ),
          ]
              : [],
        ),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor:
            isButtonHovered ? AppColors.secondary : AppColors.primary,
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          ),
          child: Text(
            "Get Started",
            style: TextStyle(
              color: isButtonHovered ? AppColors.primary : AppColors.DarkGrey,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }

  /// ✅ Hero Section
  Widget _buildHeroSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 40),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /// Left Intro Text
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Hi There",
                  style: TextStyle(color: Color(0xffF58B54), fontSize: 35),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  height: 2,
                  width: 110,
                  color: AppColors.primary,
                ),
                ShaderMask(
                  shaderCallback: (bounds) => const LinearGradient(
                    colors: [Color(0xffF58B54), Colors.purpleAccent],
                  ).createShader(bounds),
                  child: const Text(
                    "I am Tazeen",
                    style: TextStyle(
                      fontSize: 80,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const Text(
                  "Flutter is an open-source UI toolkit developed by Google\nfor building beautiful, natively compiled applications for\nmobile, web, and desktop from a single codebase.",
                  style: TextStyle(color: Colors.white70, fontSize: 15),
                ),
                const SizedBox(height: 20),
                Container(
                  width: 220,
                  height: 45,
                  decoration: BoxDecoration(
                    color: const Color(0xffF58B54),
                    borderRadius: BorderRadius.circular(6),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.orangeAccent.withOpacity(0.5),
                        blurRadius: 10,
                        spreadRadius: 3,
                      ),
                    ],
                  ),
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Explore More",
                      style: TextStyle(
                        color: AppColors.darkBrown,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 60),

          /// Right Image with Frame + Glow
          Expanded(
            flex: 2,
            child: Stack(
              alignment: Alignment.center,
              children: [
                /// Frame Painter
                Positioned.fill(child: CustomPaint(painter: DiagonalFramePainter())),

                /// Image with padding
                Padding(
                  padding: const EdgeInsets.all(20), // ✅ Added padding inside frame
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      AppImages.image3,
                      height: 350, // ✅ Increased height
                      width: 380,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// ✅ Frame Painter with smaller circles
class DiagonalFramePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final borderPaint = Paint()
      ..color = Colors.white70
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    // Top border
    canvas.drawLine(const Offset(0, 0), Offset(size.width, 0), borderPaint);
    // Right border
    canvas.drawLine(Offset(size.width, 0), Offset(size.width, size.height), borderPaint);
    // Bottom border
    canvas.drawLine(Offset(0, size.height), Offset(size.width, size.height), borderPaint);

    // ✅ Smaller circles
    final circlePaint = Paint()..color = AppColors.primary;
    canvas.drawCircle(Offset(0, size.height), 6, circlePaint);
    canvas.drawCircle(const Offset(0, 0), 6, circlePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
