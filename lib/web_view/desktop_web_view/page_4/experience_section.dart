import 'package:flutter/material.dart';

class ExperienceScreen extends StatefulWidget {
  const ExperienceScreen({super.key});

  @override
  State<ExperienceScreen> createState() => _ExperienceScreenState();
}

class _ExperienceScreenState extends State<ExperienceScreen> {
  int hoveredIndex = -1;

  final List<Map<String, dynamic>> experiences = [
    {
      "date": "Feb 2024 – May 2024",
      "role": "Flutter App Dev Intern",
      "company": "Cody Tech Software House",
      "description":
      "Gained practical experience building Flutter mobile apps, working on client projects. Strengthened UI/UX, Firebase integration, & debugging skills.",
      "color": Colors.blue,
      "buttonText": "View Credential"
    },
    {
      "date": "July 2025 – Nov 2025",
      "role": "Flutter App Dev Intern (Ongoing)",
      "company": "Apidocore",
      "description":
      "Currently enhancing skills in Flutter app development through a real-world project internship.",
      "color": Colors.orange,
      "buttonText": "View Credential"
    },
    {
      "date": "Sept 2023 – Present",
      "role": "Comp. Subject Mentor (Online)",
      "company": "Self-employed",
      "description":
      "Taught Flutter frontend & Firebase online to students, helping them grasp software dev concepts.",
      "color": Colors.purpleAccent,
      "buttonText": ""
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent, // ✅ Keep background handled by MainPage
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /// ✅ Title
          ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(
              colors: [Color(0xffF58B54), Colors.purpleAccent],
            ).createShader(bounds),
            child: const Text(
              "MY JOURNEY",
              style: TextStyle(
                fontSize: 45,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                decoration: TextDecoration.none,
              ),
            ),
          ),
          const SizedBox(height: 10),

          /// ✅ Glowing Line
          Container(
            height: 3,
            width: 120,
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(4),
              boxShadow: [
                BoxShadow(
                  color: Colors.orange.withOpacity(0.8),
                  blurRadius: 18,
                  spreadRadius: 4,
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),

          /// ✅ Timeline Cards
          Column(
            children: List.generate(experiences.length, (index) {
              final exp = experiences[index];
              return MouseRegion(
                onEnter: (_) => setState(() => hoveredIndex = index),
                onExit: (_) => setState(() => hoveredIndex = -1),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  transform: Matrix4.identity()..scale(hoveredIndex == index ? 1.03 : 1.0),
                  margin: const EdgeInsets.only(bottom: 30),
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: exp["color"].withOpacity(0.7), width: 2),
                    boxShadow: hoveredIndex == index
                        ? [
                      BoxShadow(
                        color: exp["color"].withOpacity(0.6),
                        blurRadius: 18,
                        spreadRadius: 4,
                      ),
                    ]
                        : [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 10,
                        offset: const Offset(4, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        exp["role"],
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        exp["company"],
                        style: TextStyle(
                          color: exp["color"],
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        exp["description"],
                        style: const TextStyle(fontSize: 12, color: Colors.white70, height: 1.5),
                      ),
                      const SizedBox(height: 10),
                      if (exp["buttonText"].isNotEmpty)
                        MouseRegion(
                          onEnter: (_) => setState(() {}),
                          onExit: (_) => setState(() {}),
                          child: Container(
                            decoration: BoxDecoration(
                              color: exp["color"],
                              borderRadius: BorderRadius.circular(6),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                            child: Text(
                              exp["buttonText"],
                              style: const TextStyle(
                                  color: Colors.black, fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              );
            }),
          ),

          const SizedBox(height: 40),

          /// ✅ Download Resume Button
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            onPressed: () {},
            child: const Text(
              "Download Resume",
              style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
