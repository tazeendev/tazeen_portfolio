import 'package:flutter/material.dart';
import '../../../core/utills/app_colors/app_colors.dart';

class ProjectScreen extends StatefulWidget {
  const ProjectScreen({super.key});

  @override
  State<ProjectScreen> createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {
  int hoveredIndex = -1;

  final List<Map<String, dynamic>> projects = [
    {
      "icon": Icons.flutter_dash,
      "title": "Flutter UI Design",
      "description": "Built responsive mobile & web UIs with animations using Flutter.",
      "color": Colors.blue,
    },
    {
      "icon": Icons.web,
      "title": "Web Development",
      "description": "Developed modern responsive websites using HTML, CSS & Flutter Web.",
      "color": Colors.orange,
    },
    {
      "icon": Icons.code,
      "title": "Python & C++ Projects",
      "description": "Worked on problem-solving apps, algorithms & backend logic.",
      "color": Colors.green,
    },
    {
      "icon": Icons.design_services,
      "title": "UI/UX Design",
      "description": "Designed modern, user-friendly interfaces with Figma & Canva.",
      "color": Colors.purpleAccent,
    },
    {
      "icon": Icons.brush,
      "title": "Graphic Designing",
      "description": "Created creative posters, logos, and social media designs.",
      "color": Colors.pinkAccent,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.transparent, // ✅ Transparent so MainPage background shows
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /// ✅ Title Section
          ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(
              colors: [Color(0xffF58B54), Colors.purpleAccent],
            ).createShader(bounds),
            child: const Text(
              "PROJECTS",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 45,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: 'Inter',
                decoration: TextDecoration.none,
              ),
            ),
          ),
          const SizedBox(height: 10),

          /// ✅ Horizontal Glowing Line
          Container(
            height: 3,
            width: 120,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(4),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withOpacity(0.8),
                  blurRadius: 18,
                  spreadRadius: 4,
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),

          /// ✅ Description
          const Text(
            "Here are some of my featured projects, showcasing my expertise in Flutter development,\n UI/UX design, web technologies, and creative design solutions.",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white70,
              fontSize: 12,
              height: 1.6,
              decoration: TextDecoration.none,
            ),
          ),
          const SizedBox(height: 40),

          /// ✅ Projects Grid
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 40,
            runSpacing: 30,
            children: List.generate(projects.length, (index) {
              final project = projects[index];
              return MouseRegion(
                onEnter: (_) => setState(() => hoveredIndex = index),
                onExit: (_) => setState(() => hoveredIndex = -1),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  transform: Matrix4.identity()
                    ..scale(hoveredIndex == index ? 1.08 : 1.0),
                  padding: const EdgeInsets.all(18),
                  width: 290,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: project["color"].withOpacity(0.7),
                      width: 2,
                    ),
                    boxShadow: hoveredIndex == index
                        ? [
                      BoxShadow(
                        color: project["color"].withOpacity(0.6),
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
                      /// ✅ Icon + Button
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(project["icon"], color: project["color"], size: 36),
                          Container(
                            decoration: BoxDecoration(
                              color: project["color"],
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                              child: Text(
                                "View",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),

                      /// ✅ Project Title
                      Text(
                        project["title"],
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      const SizedBox(height: 8),

                      /// ✅ Project Description
                      Expanded(
                        child: Text(
                          project["description"],
                          style: const TextStyle(
                            fontSize: 13,
                            color: Colors.white70,
                            decoration: TextDecoration.none,
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
