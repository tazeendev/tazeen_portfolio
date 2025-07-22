// import 'dart:ui';
// import 'package:flutter/material.dart';
// import 'package:tazeen_portfolio/web_view/desktop_web_view/page_3/project_screen.dart';
// import 'package:tazeen_portfolio/web_view/desktop_web_view/page_4/experience_section.dart';
// import 'package:tazeen_portfolio/web_view/desktop_web_view/page_5/freelance_section.dart';
// import 'package:tazeen_portfolio/web_view/desktop_web_view/page_6/footer_section.dart';
// import '../../practice_screens/header_screen.dart';
// import '../page_1/desktop_page_1.dart';
// import '../../../core/utills/app_colors/app_colors.dart';
//
// class MainPage extends StatelessWidget {
//   const MainPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           /// ✅ Background Gradient
//           Container(
//             decoration: const BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [Colors.black, Color(0xFF1E1E2C)],
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight,
//               ),
//             ),
//           ),
//
//           /// ✅ Glow Overlay
//           Positioned.fill(
//             child: BackdropFilter(
//               filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
//               child: Container(color: Colors.black.withOpacity(0.15)),
//             ),
//           ),
//
//           /// ✅ Scrollable Content
//           SingleChildScrollView(
//             child: Column(
//               children: [
//                 const SizedBox(height: 120), // Space for header
//                 const HeroSection(),
//                 const SizedBox(height: 50),
//                 const AboutScreen(),
//                 const SizedBox(height: 50),
//                 const ProjectScreen(),
//                 const SizedBox(height: 50),
//                 const ExperienceScreen(),
//                 const SizedBox(height: 50),
//                 const FreelanceHireMeSection(),
//                 const SizedBox(height: 50),
//                 FooterScreen(),
//               ],
//             ),
//           ),
//
//           /// ✅ Fixed Glassmorphic Header
//           Positioned(
//             top: 0,
//             left: 0,
//             right: 0,
//             child: ClipRRect(
//               borderRadius: BorderRadius.zero,
//               child: BackdropFilter(
//                 filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
//                 child: Container(
//                   height: 90,
//                   color: Colors.black.withOpacity(0.5),
//                   child: const HeaderScreen(),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:tazeen_portfolio/web_view/desktop_web_view/page_2/desktop_about_page/desktop_about_page.dart';
import '../../../controllers/app_animations/animated_cursor/animated_cursor.dart';
import '../../../core/utills/app_colors/app_colors.dart';
import '../page_1/desktop_headear_section.dart';
import '../page_1/desktop_hero_section.dart';
import '../page_1/desktop_page_1.dart';
import '../page_3/project_screen.dart';
import '../page_4/experience_section.dart';
import '../page_5/freelance_section.dart';
import '../page_6/footer_section.dart';
import '../../practice_screens/header_screen.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final ScrollController _scrollController = ScrollController();

  // ✅ Global Keys for Navigation
  final homeKey = GlobalKey();
  final servicesKey = GlobalKey();
  final blogKey = GlobalKey();
  final aboutKey = GlobalKey();
  final projectsKey = GlobalKey();
  final contactKey = GlobalKey();
  final freelanceKey = GlobalKey();

  String _activeSection = "Home";

  void _scrollTo(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 700),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedCursor(
      color: AppColors.primary,
      child: Scaffold(
        body: Stack(
          children: [
            /// ✅ Background
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
                filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                child: Container(color: Colors.black.withOpacity(0.15)),
              ),
            ),

            /// ✅ Scroll Content
            SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  const SizedBox(height: 120),
                  Container(key: homeKey, child: const HeroSection()),
                  const SizedBox(height: 50),
                  Container(key: servicesKey, child: const Text("Services Section", style: TextStyle(color: Colors.white))),
                  const SizedBox(height: 50),
                  Container(key: blogKey, child: const Text("Blog Section", style: TextStyle(color: Colors.white))),
                  const SizedBox(height: 50),
                AboutScreen(),
                  const SizedBox(height: 50),
                  Container(key: projectsKey, child: const ProjectScreen()),
                  const SizedBox(height: 50),
                  Container(key: contactKey, child: const Text("Contact Section", style: TextStyle(color: Colors.white))),
                  const SizedBox(height: 50),
                  Container(key: freelanceKey, child: const FreelanceHireMeSection()),
                  const SizedBox(height: 50),
                  const FooterScreen(),
                ],
              ),
            ),

            /// ✅ Header with Navigation
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                  child: Container(
                    height: 90,
                    color: Colors.black.withOpacity(0.5),
                    child: HeaderScreen(
                      activeSection: _activeSection,
                      onNavTap: (section) {
                        if (section == "Home") _scrollTo(homeKey);
                        if (section == "Services") _scrollTo(servicesKey);
                        if (section == "Blog") _scrollTo(blogKey);
                        if (section == "About") _scrollTo(aboutKey);
                        if (section == "Projects") _scrollTo(projectsKey);
                        if (section == "Contact") _scrollTo(contactKey);
                        if (section == "Freelance") _scrollTo(freelanceKey);
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

