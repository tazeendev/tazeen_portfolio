import 'dart:ui';
import 'package:flutter/material.dart';

import '../../../core/utills/app_colors/app_colors.dart';
import '../../../core/utills/app_images/app_images.dart';

class HeroScreen extends StatelessWidget {
  const HeroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
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

        /// ✅ Hero Section Only
        Positioned.fill(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 80),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /// ✅ Left Intro Text
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
                          "Flutter is an open-source UI toolkit developed by Google\n"
                              "for building beautiful, natively compiled applications for\n"
                              "mobile, web, and desktop from a single codebase.",
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

                  /// ✅ Right Image with Frame + Glow
                  Expanded(
                    flex: 2,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        /// Frame Painter
                        Positioned.fill(child: CustomPaint(painter: DiagonalFramePainter())),

                        /// Image with padding
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              AppImages.image3,
                              height: 350,
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
            ),
          ),
        ),
      ],
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
