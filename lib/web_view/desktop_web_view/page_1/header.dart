import 'package:flutter/material.dart';
import '../../../core/utills/app_colors/app_colors.dart';

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
    return Container(
      height:90,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 14),

      /// ✅ Prevent overflow by enabling horizontal scroll
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /// ✅ Left Menu (No vertical line now)
            _buildMenu(leftMenu),

            const SizedBox(width: 20),

            /// ✅ Logo
            Image.asset('assets/logu/logo.png', height: 50),

            const SizedBox(width: 20),

            /// ✅ Right Menu + Button
            Row(
              children: [
                _buildMenu(rightMenu),
                const SizedBox(width: 16),
                _buildGetStartedButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// ✅ Menu Builder (Hover effect only)
  Widget _buildMenu(List<String> menuItems) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: menuItems.map((item) => _buildHoverMenu(item)).toList(),
    );
  }

  /// ✅ Hover Effect for Menu Items
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

  /// ✅ Get Started Button
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
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8)),
            padding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          ),
          child: Text(
            "Get Started",
            style: TextStyle(
              color:
              isButtonHovered ? AppColors.primary : AppColors.DarkGrey,
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
