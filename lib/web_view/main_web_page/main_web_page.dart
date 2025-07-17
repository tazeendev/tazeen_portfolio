import 'package:flutter/material.dart';
import 'package:tazeen_portfolio/web_view/page_1/desktop_web_view/header_screen.dart';

import '../page_2/desktop_about_page/desktop_about_page.dart';
class MainWebPage extends StatefulWidget {
  const MainWebPage({super.key});

  @override
  State<MainWebPage> createState() => _MainWebPageState();
}

class _MainWebPageState extends State<MainWebPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderScreen(),
           // AboutHeader(),
        
          ],
        ),
      )
    );
  }
}
