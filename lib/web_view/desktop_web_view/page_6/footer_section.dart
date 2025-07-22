import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class FooterScreen extends StatefulWidget {
  const FooterScreen({super.key});

  @override
  State<FooterScreen> createState() => _FooterScreenState();
}

class _FooterScreenState extends State<FooterScreen> {
  /// ✅ Social Links
  final Map<String, String> socialLinks = {
    "Instagram": "https://www.instagram.com/",
    "GitHub": "https://github.com/",
    "LinkedIn": "https://www.linkedin.com/",
    "WhatsApp": "https://wa.me/your_number", // Replace with your number
    "Email": "mailto:youremail@example.com"
  };

  /// ✅ Colors for each platform
  final Map<String, Color> socialColors = {
    "Instagram": Colors.pinkAccent,
    "GitHub": Colors.white,
    "LinkedIn": Colors.blueAccent,
    "WhatsApp": Colors.green,
    "Email": Colors.orange
  };

  int hoveredIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.black, Color(0xFF1E1E2C)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /// ✅ Title
          ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(
              colors: [Colors.orange, Colors.purpleAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ).createShader(bounds),
            child: const Text(
              "CONNECT WITH ME",
              style: TextStyle(
                fontSize: 38,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                decoration: TextDecoration.none,
              ),
            ),
          ),
          const SizedBox(height: 30),

          /// ✅ Circular Social Buttons with Hover Effect
          Wrap(
            spacing: 18,
            runSpacing: 18,
            alignment: WrapAlignment.center,
            children: List.generate(socialLinks.length, (index) {
              String platform = socialLinks.keys.elementAt(index);
              return MouseRegion(
                onEnter: (_) => setState(() => hoveredIndex = index),
                onExit: (_) => setState(() => hoveredIndex = -1),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: hoveredIndex == index ? 70 : 60,
                  height: hoveredIndex == index ? 70 : 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black.withOpacity(0.2),
                    border: Border.all(color: socialColors[platform]!, width: 2),
                    boxShadow: [
                      BoxShadow(
                        color: socialColors[platform]!.withOpacity(0.6),
                        blurRadius: hoveredIndex == index ? 20 : 10,
                        spreadRadius: hoveredIndex == index ? 4 : 2,
                      ),
                    ],
                  ),
                  child: IconButton(
                    icon: Icon(_getPlatformIcon(platform),
                        color: socialColors[platform], size: 28),
                    onPressed: () => _launchURL(socialLinks[platform]!),
                  ),
                ),
              );
            }),
          ),

          const SizedBox(height: 40),

          /// ✅ Tagline
          const Text(
            "Let's build something amazing together!",
            style: TextStyle(color: Colors.white70, fontSize: 16),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 15),

          /// ✅ Copyright
          const Text(
            "© 2025 Your Name | All Rights Reserved",
            style: TextStyle(color: Colors.white54, fontSize: 14),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  /// ✅ Get Icons for Social Platforms
  IconData _getPlatformIcon(String platform) {
    switch (platform) {
      case "Instagram":
        return Icons.camera_alt;
      case "GitHub":
        return Icons.code;
      case "LinkedIn":
        return Icons.work;
      case "WhatsApp":
        return Icons.chat;
      case "Email":
        return Icons.email;
      default:
        return Icons.link;
    }
  }

  /// ✅ Open URL
  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }
}
