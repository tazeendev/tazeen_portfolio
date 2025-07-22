import 'package:flutter/material.dart';
import '../../../core/utills/app_colors/app_colors.dart';
import '../../../core/utills/app_images/app_images.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 60),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /// ✅ Left Decorative Line
          Column(
            children: [
              _buildVerticalLineWithCircle(),
            ],
          ),

          const SizedBox(width: 40),

          /// ✅ Main Hero Content
          Expanded(
            flex: 6,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// ✅ Left Text Section
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Hi There",
                        style: TextStyle(color: Color(0xffF58B54), fontSize: 35),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        height: 3,
                        width: 110,
                        color: AppColors.primary,
                        margin: const EdgeInsets.only(bottom: 16),
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
                      const SizedBox(height: 20),
                      const Text(
                        "Flutter Developer | UI/UX Designer\n"
                            "Building responsive apps for mobile & web using Flutter & Firebase.\n"
                            "Passionate about crafting modern UI experiences.",
                        style: TextStyle(color: Colors.white70, fontSize: 16, height: 1.6),
                      ),
                      const SizedBox(height: 30),
                      Container(
                        width: 220,
                        height: 50,
                        decoration: BoxDecoration(
                          color: const Color(0xffF58B54),
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.orangeAccent.withOpacity(0.5),
                              blurRadius: 12,
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
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: 60),

                /// ✅ Image with Frame (Open Left + Circles)
                Expanded(
                  flex: 2,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        height: 420,
                        width: 420,
                        child: CustomPaint(
                          painter: FrameOpenLeftWithThreeCirclesPainter(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(25),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            AppImages.image3,
                            height: 350,
                            width: 380,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 40),

          /// ✅ Right Decorative Line
          Column(
            children: [
              _buildVerticalLineWithCircle(),
            ],
          ),
        ],
      ),
    );
  }

  /// ✅ Vertical Line with Circle
  Widget _buildVerticalLineWithCircle() {
    return Column(
      children: [
        Container(
          width: 2,
          height: 300,
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
}

/// ✅ Frame Painter (Open Left + Circles at Top-left, Top-right, Bottom-left)
class FrameOpenLeftWithThreeCirclesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final borderPaint = Paint()
      ..color = Colors.white70
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;

    /// ✅ Top Line
    canvas.drawLine(const Offset(0, 0), Offset(size.width, 0), borderPaint);

    /// ✅ Right Line
    canvas.drawLine(Offset(size.width, 0), Offset(size.width, size.height), borderPaint);

    /// ✅ Bottom Line
    canvas.drawLine(Offset(size.width, size.height), Offset(0, size.height), borderPaint);

    /// ✅ Circles with Glow
    final circlePaint = Paint()..color = AppColors.primary;

    // Top-left
    canvas.drawCircle(const Offset(0, 0), 6, circlePaint);

    // Bottom-left
    canvas.drawCircle(Offset(0, size.height), 6, circlePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
