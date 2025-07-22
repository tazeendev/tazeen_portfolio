import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';
import '../../../core/utills/app_colors/app_colors.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 40),
      color: Colors.transparent, // ✅ Transparent so MainPage background shows
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// ✅ LEFT SIDE (About Me Section)
          Expanded(flex: 2, child: buildLeftSide()),

          /// ✅ MID LINE WITH GLOWING CIRCLE
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 30),
            height: 350,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(width: 2, height: 300, color: Colors.white30),
                Container(
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withOpacity(0.8),
                        blurRadius: 18,
                        spreadRadius: 6,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(flex: 2, child: buildRightSide()),
        ],
      ),
    );
  }

  /// ✅ Left Section
  Widget buildLeftSide() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [Color(0xffF58B54), Colors.purpleAccent],
          ).createShader(bounds),
          child: const Text(
            "About Me",
            style: TextStyle(
              fontSize: 45,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              decoration: TextDecoration.none,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          height: 3,
          width: 120,
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(height: 20),
        RichText(
          text: const TextSpan(
            style: TextStyle(color: Colors.white70, fontSize: 14, height: 1.6),
            children: [
              TextSpan(text: "I'm "),
              TextSpan(
                text: "Tazeen Zahra",
                style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xffF58B54)),
              ),
              TextSpan(
                text:
                ", a passionate Flutter developer with a love for creating modern, responsive, and high-performing applications.",
              ),
            ],
          ),
        ),
        const SizedBox(height: 30),

        /// Timeline
        Column(
          children: [
            buildTimelineTile("Gomal University", true, false),
            buildTimelineTile("Dera Ismail Khan, Pakistan", false, true),
          ],
        ),
        const SizedBox(height: 30),

        /// Hover Button
        MouseRegion(
          onEnter: (_) => setState(() => isHovered = true),
          onExit: (_) => setState(() => isHovered = false),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            transform: Matrix4.identity()..scale(isHovered ? 1.08 : 1.0),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: AppColors.primary, width: 2),
              boxShadow: [
                if (isHovered)
                  BoxShadow(color: AppColors.primary.withOpacity(0.6), blurRadius: 14, spreadRadius: 2),
              ],
            ),
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
            child: AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 250),
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: isHovered ? AppColors.brownColor : AppColors.primary,
              ),
              child: const Text("Download CV"),
            ),
          ),
        ),
      ],
    );
  }

  /// ✅ Right Section
  Widget buildRightSide() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [Color(0xffF58B54), Colors.purpleAccent],
          ).createShader(bounds),
          child: const Text(
            "What I'm Great At",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        const SizedBox(height: 8),
        Container(height: 3, width: 150, color: AppColors.primary),
        const SizedBox(height: 30),

        /// Skills
        Wrap(
          spacing: 20,
          runSpacing: 20,
          children: [
            buildSkillCard(Icons.flutter_dash, "Flutter", Colors.blue),
            buildSkillCard(Icons.android, "Android", Colors.green),
            buildSkillCard(Icons.web, "Web Dev", Colors.orange),
            buildSkillCard(Icons.code, "Clean Code", Colors.purple),
          ],
        ),
      ],
    );
  }

  /// ✅ Skill Card
  Widget buildSkillCard(IconData icon, String title, Color color) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: const EdgeInsets.all(16),
      width: 140,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.5),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.7), width: 2),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color, size: 32),
          const SizedBox(height: 10),
          Text(title, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: color)),
        ],
      ),
    );
  }

  /// ✅ Timeline
  Widget buildTimelineTile(String text, bool isFirst, bool isLast) {
    return TimelineTile(
      alignment: TimelineAlign.start,
      isFirst: isFirst,
      isLast: isLast,
      indicatorStyle: IndicatorStyle(width: 8, color: AppColors.primary),
      beforeLineStyle: const LineStyle(color: AppColors.primary, thickness: 2.3),
      endChild: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
        child: Text(text, style: const TextStyle(color: AppColors.primary, fontSize: 12)),
      ),
    );
  }
}
