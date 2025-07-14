import 'package:flutter/material.dart';
import 'package:tazeen_portfolio/web_view/page_1/tablet_page_1/tablet_page_1.dart';
import 'desktop_web_view/desktop_page_1.dart';
import 'mobile_page_1/mobile_page_1.dart';
import '../../controllers/constants/components/responsive_layout_widegt.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      desktop: DesktopPage1(),
      tablet: TabletPage1(),
      mobile: MobilePage1(),
    );
  }
}
