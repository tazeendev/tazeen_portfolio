import 'dart:ui';
import 'package:flutter/material.dart';

class FreelanceHireMeSection extends StatelessWidget {
  const FreelanceHireMeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// Background Gradient
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black, Color(0xFF1E1E2C)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(color: Colors.black.withOpacity(0.2)),
            ),
          ),

          /// Main Content
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /// Title
                  ShaderMask(
                    shaderCallback: (bounds) => const LinearGradient(
                      colors: [Colors.orange, Colors.purpleAccent],
                    ).createShader(bounds),
                    child: const Text(
                      "HIRE ME FOR FREELANCE WORK",
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),

                  /// Subtitle
                  const Text(
                    "Available on top platforms for your projects",
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                  const SizedBox(height: 30),

                  /// Platform Buttons (Fiverr, Upwork, Guru)
                  Wrap(
                    spacing: 20,
                    children: [
                      _platformButton("Fiverr", Colors.green, Icons.work, "https://www.fiverr.com"),
                      _platformButton("Upwork", Colors.teal, Icons.work_outline, "https://www.upwork.com"),
                      _platformButton("Guru", Colors.blueAccent, Icons.person, "https://www.guru.com"),
                    ],
                  ),
                  const SizedBox(height: 30),

                  /// Tagline
                  const Text(
                    "Expert in Flutter Apps | UI/UX Design | Full-Stack Development",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  const SizedBox(height: 30),

                  /// Contact Me Button
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    onPressed: () {
                      // TODO: Add your contact or email link
                    },
                    child: const Text(
                      "Contact Me",
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
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

  /// ✅ Platform Button Widget
  Widget _platformButton(String name, Color color, IconData icon, String url) {
    return InkWell(
      onTap: () {
        // TODO: Add launch URL functionality (Use url_launcher package)
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
        decoration: BoxDecoration(
          color: color.withOpacity(0.2),
          border: Border.all(color: color, width: 2),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: color),
            const SizedBox(width: 8),
            Text(
              name,
              style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
