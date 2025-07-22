import 'dart:ui';
import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

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

          /// ✅ Blur Overlay
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(color: Colors.black.withOpacity(0.2)),
            ),
          ),

          /// ✅ Main Content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                children: [
                  /// ✅ Title
                  ShaderMask(
                    shaderCallback: (bounds) => const LinearGradient(
                      colors: [Colors.orange, Colors.purpleAccent],
                    ).createShader(bounds),
                    child: const Text(
                      "ABOUT ME",
                      style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  /// ✅ Split Screen into Two Parts
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        /// ✅ Left Section (Profile + Bio)
                        Expanded(child: _profileSection()),

                        /// ✅ Middle Divider with Circle Image
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 2,
                              height: 300,
                              color: Colors.orange.withOpacity(0.6),
                            ),
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                /// Outer Glow Circle
                                Container(
                                  width: 120,
                                  height: 120,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.orange.withOpacity(0.2),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.orange.withOpacity(0.8),
                                        blurRadius: 20,
                                        spreadRadius: 6,
                                      ),
                                    ],
                                  ),
                                ),
                                /// Profile Image Inside Circle
                                Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: Colors.orange, width: 4),
                                    image: const DecorationImage(
                                      image: AssetImage("assets/profile.jpg"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              width: 2,
                              height: 300,
                              color: Colors.orange.withOpacity(0.6),
                            ),
                          ],
                        ),
                        const SizedBox(width: 20),

                        /// ✅ Right Section (Skills)
                        Expanded(child: _skillsCardsSection()),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  /// ✅ Hire Me Button
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Hire Me",
                      style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
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

  /// ✅ Left Section: Profile Info
  Widget _profileSection() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Text(
          "Hi, I'm Tazeen Zahra Batool 👋",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 10),
        Text(
          "Flutter Developer | UI/UX Designer | CS Student\n"
              "Passionate about building modern apps with clean UI & Firebase integration.",
          style: TextStyle(color: Colors.white70, fontSize: 14, height: 1.6),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  /// ✅ Right Section: Skill Cards
  Widget _skillsCardsSection() {
    final skills = [
      {"name": "Flutter", "image": "assets/flutter.png", "color": Colors.blue},
      {"name": "Dart", "image": "assets/dart.png", "color": Colors.teal},
      {"name": "Firebase", "image": "assets/firebase.png", "color": Colors.orange},
      {"name": "UI/UX", "image": "assets/uiux.png", "color": Colors.purpleAccent},
    ];

    return Wrap(
      spacing: 20,
      runSpacing: 20,
      alignment: WrapAlignment.center,
      children: skills.map((skill) {
        return Container(
          width: 150,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.5),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: skill["color"] as Color, width: 2),
            boxShadow: [
              BoxShadow(color: (skill["color"] as Color).withOpacity(0.6), blurRadius: 12),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// Skill Image in Circle
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: skill["color"] as Color, width: 2),
                  image: DecorationImage(
                    image: AssetImage(skill["image"] as String),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                skill["name"] as String,
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
