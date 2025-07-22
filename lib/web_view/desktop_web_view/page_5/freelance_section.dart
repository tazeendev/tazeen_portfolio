import 'package:flutter/material.dart';

class FreelanceHireMeSection extends StatefulWidget {
  const FreelanceHireMeSection({super.key});

  @override
  State<FreelanceHireMeSection> createState() => _FreelanceHireMeSectionState();
}

class _FreelanceHireMeSectionState extends State<FreelanceHireMeSection> {
  int hoveredIndex = -1;

  final List<Map<String, dynamic>> platforms = [
    {"name": "Fiverr", "color": Colors.green, "icon": Icons.work, "url": "https://www.fiverr.com"},
    {"name": "Upwork", "color": Colors.teal, "icon": Icons.work_outline, "url": "https://www.upwork.com"},
    {"name": "Guru", "color": Colors.blueAccent, "icon": Icons.person, "url": "https://www.guru.com"},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent, // ✅ No extra background
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 60),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /// ✅ Heading with Gradient Text
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
                decoration: TextDecoration.none,
              ),
            ),
          ),
          const SizedBox(height: 10),

          /// ✅ Subtitle
          const Text(
            "Available on top platforms for your projects",
            style: TextStyle(color: Colors.white70, fontSize: 16, decoration: TextDecoration.none),
          ),
          const SizedBox(height: 30),

          /// ✅ Platform Buttons
          Wrap(
            spacing: 20,
            children: List.generate(platforms.length, (index) {
              final platform = platforms[index];
              return MouseRegion(
                onEnter: (_) => setState(() => hoveredIndex = index),
                onExit: (_) => setState(() => hoveredIndex = -1),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  transform: Matrix4.identity()
                    ..scale(hoveredIndex == index ? 1.1 : 1.0),
                  padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                  decoration: BoxDecoration(
                    color: hoveredIndex == index
                        ? platform["color"].withOpacity(0.3)
                        : platform["color"].withOpacity(0.2),
                    border: Border.all(color: platform["color"], width: 2),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: hoveredIndex == index
                        ? [
                      BoxShadow(
                        color: platform["color"].withOpacity(0.6),
                        blurRadius: 18,
                        spreadRadius: 4,
                      ),
                    ]
                        : [],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(platform["icon"], color: platform["color"]),
                      const SizedBox(width: 8),
                      Text(
                        platform["name"],
                        style: TextStyle(
                          color: platform["color"],
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
          const SizedBox(height: 30),

          /// ✅ Tagline
          const Text(
            "Expert in Flutter Apps | UI/UX Design | Full-Stack Development",
            style: TextStyle(color: Colors.white, fontSize: 14, decoration: TextDecoration.none),
          ),
          const SizedBox(height: 30),

          /// ✅ Contact Button
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
            onPressed: () {
              // TODO: Add email/contact link using url_launcher
            },
            child: const Text(
              "Contact Me",
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
