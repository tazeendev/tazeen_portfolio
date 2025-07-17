import 'package:flutter/material.dart';
import 'package:tazeen_portfolio/controllers/utills/app_colors/app_colors.dart';
import 'package:timeline_tile/timeline_tile.dart';

class AboutSection extends StatefulWidget {
  const AboutSection({super.key});

  @override
  State<AboutSection> createState() => _AboutSectionState();
}

class _AboutSectionState extends State<AboutSection> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 40),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.black, Color(0xFF1E1E2C)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// ✅ Left Side (Heading + Glow Line + Description + Timeline)
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// ✅ Gradient Heading
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
                      fontFamily: 'Inter',
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),

                const SizedBox(height: 8),

                /// ✅ Glowing Line
                Container(
                  height: 3,
                  width: 120,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(4),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withOpacity(0.6),
                        blurRadius: 12,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                /// ✅ Intro Text
                RichText(
                  textAlign: TextAlign.start,
                  text: const TextSpan(
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                      height: 1.5,
                      fontFamily: 'Inter',
                    ),
                    children: [
                      TextSpan(text: "I'm "),
                      TextSpan(
                        text: "Tazeen Zahra",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xffF58B54),
                        ),
                      ),
                      TextSpan(
                        text:
                        ", a passionate Flutter developer with a love for creating modern, responsive, and high-performing applications. I specialize in building beautiful UIs and delivering seamless user experiences using Flutter and Dart. Always curious, always learning!",
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                /// ✅ Timeline
                Column(
                  children: [
                    buildTimelineTile("Gomal University", true, false),
                    buildTimelineTile("Dera Ismail Khan, Pakistan", false, true),
                  ],
                ),

                const SizedBox(height: 30),
                MouseRegion(
                onEnter: (_) => setState(() => isHovered = true),
    onExit: (_) => setState(() => isHovered = false),
    child: AnimatedContainer(
    duration: const Duration(milliseconds: 250),
    transform: Matrix4.identity()..scale(isHovered ? 1.05 : 1.0),
    decoration: BoxDecoration(
    color: Colors.transparent, // ✅ Always transparent background
    borderRadius: BorderRadius.circular(30),
    border: Border.all(
    color: AppColors.primary, // ✅ Border stays same
    width: 2,
    ),
    ),
    padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
    child: AnimatedDefaultTextStyle(
    duration: const Duration(milliseconds: 250),
    style: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: isHovered ? AppColors.brownColor : AppColors.primary, // ✅ Text color changes only
    decoration: TextDecoration.none,
    ),
    child: const Text("Download CV"),
    ),
    ),
    ),

    ],
            ),
          ),

          /// ✅ Middle Divider with Circle
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 30),
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(width: 2, height: 150, color: Colors.white30),
                Container(
                  width: 14,
                  height: 14,
                  decoration: BoxDecoration(color: AppColors.primary, shape: BoxShape.circle),
                ),
              ],
            ),
          ),

          /// ✅ Right Side (Skill Icons)
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                buildIconCircle(Icons.flutter_dash, Colors.blue),
                const SizedBox(height: 20),
                buildIconCircle(Icons.android, Colors.green),
                const SizedBox(height: 20),
                buildIconCircle(Icons.web, Colors.orange),
                const SizedBox(height: 20),
                buildIconCircle(Icons.code, Colors.purple),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTimelineTile(String text, bool isFirst, bool isLast) {
    return TimelineTile(
      alignment: TimelineAlign.start,
      isFirst: isFirst,
      isLast: isLast,
      indicatorStyle: IndicatorStyle(
        width: 8,
        color: AppColors.primary,
        padding: const EdgeInsets.all(4),
      ),
      beforeLineStyle: const LineStyle(color: AppColors.primary, thickness: 2.3),
      endChild: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
        child: Text(
          text,
          style: const TextStyle(color: AppColors.primary, fontSize: 10, decoration: TextDecoration.none),
        ),
      ),
    );
  }

  Widget buildIconCircle(IconData icon, Color color) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        shape: BoxShape.circle,
        border: Border.all(color: color, width: 2),
      ),
      child: Icon(icon, color: color, size: 24),
    );
  }
}
