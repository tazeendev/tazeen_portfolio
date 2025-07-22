import 'package:flutter/material.dart';
import '../../../core/utills/app_colors/app_colors.dart';

class HeaderScreen extends StatefulWidget {
  const HeaderScreen({super.key});

  @override
  State<HeaderScreen> createState() => _HeaderScreenState();
}

class _HeaderScreenState extends State<HeaderScreen> {
  final List<String> leftMenu = ["Home", "Services", "Blog"];
  final List<String> rightMenu = ["About", "Projects", "Contact", "Freelance"];
  String hoverMenu = "";
  bool isButtonHovered = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              _buildMenu(leftMenu),
              const SizedBox(width: 20),
              _buildDecorativeLineWithCircle(
                length: 100,
                isCircleAtEnd: true,
              ), // left line
            ],
          ),
          Image.asset('assets/logu/logo.png', height: 55),
          Row(
            children: [
              _buildDecorativeLineWithCircle(
                length: 100,
                isCircleAtEnd: false,
              ), // right line
              const SizedBox(width: 20),
              _buildMenu(rightMenu),
              const SizedBox(width: 16),
              _buildGetStartedButton(),
            ],
          ),
        ],
      ),
    );
  }
  Widget _buildMenu(List<String> menuItems) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: menuItems.map((item) => _buildHoverMenu(item)).toList(),
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
  Widget _buildDecorativeLineWithCircle({
    required double length,
    required bool isCircleAtEnd,
  }) {
    return Row(
      children: isCircleAtEnd
          ? [
              Container(width: length, height: 2, color: AppColors.primary),
              _buildCircle(),
            ]
          : [
              _buildCircle(),
              Container(width: length, height: 2, color: AppColors.primary),
            ],
    );
  }
  Widget _buildCircle() {
    return Container(
      width: 12,
      height: 12,
      decoration: BoxDecoration(
        color: AppColors.primary,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.7),
            blurRadius: 12,
            spreadRadius: 3,
          ),
        ],
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
            backgroundColor: isButtonHovered
                ? AppColors.secondary
                : AppColors.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
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
}
