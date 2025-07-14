import 'package:flutter/material.dart';
import 'package:tazeen_portfolio/controllers/constants/components/responsive_layout_widegt.dart';
import 'package:tazeen_portfolio/views/screen_views/home_screen/desktop_home_screen/desktop_home_screen.dart';
import 'package:tazeen_portfolio/views/screen_views/home_screen/mobile_home_screen/mobile_home_screen.dart';
import 'package:tazeen_portfolio/views/screen_views/home_screen/tablet_home_screen/tablet_home_screen.dart';
class MainHomeScreen extends StatelessWidget {
  const MainHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(desktop: DesktopHomeScreen(),
        mobile: MobileHomeScreen(), tablet: TabletHomeScreen());
  }
}
