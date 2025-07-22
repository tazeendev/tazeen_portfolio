import 'package:flutter/material.dart';
import 'package:tazeen_portfolio/web_view/desktop_web_view/main_desktop_web_pages/main_desktop_web_pages_screen.dart';
import 'package:tazeen_portfolio/web_view/mobile_web_view/main_mobile_web_pages/main_mobile_web_pages_screen.dart';
import 'package:tazeen_portfolio/web_view/tablet_web_view/main_tablets_web_pages/main_tablets_web_pages_screen.dart';

import '../../core/constants/components/responsive_layout_widegt.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      desktop: MainPage(),
      tablet: MainTabletsWebPagesScreen(),
      mobile: MainMobileWebPagesScreen(),
    );
  }
}
