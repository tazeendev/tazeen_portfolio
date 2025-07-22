import 'dart:ui';
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

          /// ✅ Glow Overlay
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
              child: Container(color: Colors.black.withOpacity(0.15)),
            ),
          ),

          /// ✅ Main Content
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
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
                  const SizedBox(height: 30),

                  /// ✅ Timeline + Cards
                  Column(
                    children: List.generate(experiences.length, (index) {
                      final exp = experiences[index];
                      return LayoutBuilder(
                        builder: (context, constraints) {
                          return MouseRegion(
                            onEnter: (_) => setState(() => hoveredIndex = index),
                            onExit: (_) => setState(() => hoveredIndex = -1),
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 30),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  /// ✅ Timeline Column (Dynamic Line Height)
                                  Column(
                                    children: [
                                      Text(
                                        exp["date"],
                                        style: const TextStyle(
                                            color: Colors.white70, fontSize: 14),
                                      ),
                                      const SizedBox(height: 10),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 98.0),
                                        child: Container(
                                          width: 14,
                                          height: 14,
                                          decoration: BoxDecoration(
                                            color: exp["color"],
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                      ),
                                      /// Dynamic height based on card content
                                      Padding(
                                        padding: const EdgeInsets.only(left: 98.0),
                                        child: AnimatedContainer(
                                          duration: const Duration(milliseconds: 200),
                                          height: hoveredIndex == index ? 150 : 130,
                                          width: 2,
                                          color: exp["color"].withOpacity(0.6),
                                        ),
                                      ),
                                    ],
                                  ),

                                  /// ✅ Reduce gap between line & card
                                  const SizedBox(width: 12),

                                  /// ✅ Centered Experience Card
                                  ConstrainedBox(
                                    constraints: const BoxConstraints(maxWidth: 700),
                                    child: AnimatedContainer(
                                      duration: const Duration(milliseconds: 300),
                                      transform: Matrix4.identity()
                                        ..scale(
                                            hoveredIndex == index ? 1.04 : 1.0),
                                      padding: const EdgeInsets.all(18),
                                      decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.5),
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                          color: exp["color"].withOpacity(0.7),
                                          width: 2,
                                        ),
                                        boxShadow: hoveredIndex == index
                                            ? [
                                          BoxShadow(
                                            color: exp["color"]
                                                .withOpacity(0.6),
                                            blurRadius: 18,
                                            spreadRadius: 4,
                                          ),
                                        ]
                                            : [
                                          BoxShadow(
                                            color: Colors.black
                                                .withOpacity(0.3),
                                            blurRadius: 10,
                                            offset: const Offset(4, 4),
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                            style: const TextStyle(
                                                fontSize: 12,
                                                color: Colors.white70,
                                                height: 1.5),
                                          ),
                                          const SizedBox(height: 10),
                                          exp["buttonText"].isNotEmpty
                                              ? Container(
                                            decoration: BoxDecoration(
                                              color: exp["color"],
                                              borderRadius:
                                              BorderRadius.circular(6),
                                            ),
                                            child: const Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 8,
                                                  vertical: 5),
                                              child: Text(
                                                "View Credential",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                    FontWeight.bold),
                                              ),
                                            ),
                                          )
                                              : const SizedBox(),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }),
                  ),

                  /// ✅ Download Resume Button
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 14),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Download Resume",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
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
}
