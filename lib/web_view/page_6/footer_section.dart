import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class FooterScreen extends StatelessWidget {
  FooterScreen({super.key});

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

          /// ✅ Blur Effect Overlay
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
              child: Container(color: Colors.black.withOpacity(0.3)),
            ),
          ),

          /// ✅ Main Footer Content
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
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
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  /// ✅ Circular Social Buttons
                  Wrap(
                    spacing: 18,
                    runSpacing: 18,
                    alignment: WrapAlignment.center,
                    children: socialLinks.keys.map((platform) {
                      return _circleButton(
                        color: socialColors[platform]!,
                        url: socialLinks[platform]!,
                        icon: _getPlatformIcon(platform),
                      );
                    }).toList(),
                  ),

                  const SizedBox(height: 40),

                  /// ✅ Tagline
                  const Text(
                    "Let's build something amazing together!",
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                  const SizedBox(height: 15),

                  /// ✅ Copyright
                  const Text(
                    "© 2025 Your Name | All Rights Reserved",
                    style: TextStyle(color: Colors.white54, fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// ✅ Circular Button Widget
  Widget _circleButton({
    required Color color,
    required String url,
    required IconData icon,
  }) {
    return InkWell(
      onTap: () => _launchURL(url),
      child: MouseRegion(
        onEnter: (_) {},
        onExit: (_) {},
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: color, width: 2),
            color: Colors.black.withOpacity(0.2),
            boxShadow: [
              BoxShadow(color: color.withOpacity(0.5), blurRadius: 10, spreadRadius: 2),
            ],
          ),
          child: Icon(icon, color: color, size: 28),
        ),
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
