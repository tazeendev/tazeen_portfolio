import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:tazeen_portfolio/controllers/utills/app_images/app_images.dart';
import '../../../controllers/constants/components/responsive_layout_widegt.dart';
import '../../../controllers/constants/components/sidebar_widget/sidebar_widget_screen.dart';
import '../../../controllers/utills/app_colors/app_colors.dart';
class DesktopPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Row(
        children: [
          /// Sidebar
          SidebarWidget(
            //onItemTapped: (index) {
              // Handle navigation based on index (0=Home, 1=About, 2=Resume, 3=Portfolio, 4=Services, 5=Demo, 6=Contact)
            //  setState(() {
              //  _selectedIndex = index;
              //});
            //},
          ),

          /// Main content area
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  /// Hero Section
                  Container(
                    width: double.infinity,
                    height: screenHeight * 1.8,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(AppImages.heroImage),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 258.0),
                            child: Row(
                              children: [
                                Text(
                                  'Tazeen',
                                  style: TextStyle(
                                    fontFamily: 'Castoro',
                                    fontSize: 43,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.whiteText,
                                  ),
                                ),
                                Text(
                                  ' Zahra',
                                  style: TextStyle(
                                    fontFamily: 'Castoro',
                                    fontSize: 43,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  ' Batool',
                                  style: TextStyle(
                                    fontFamily: 'Castoro',
                                    fontSize: 43,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.whiteText,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 8),
                    SizedBox(
                    height: 32,
                    child: DefaultTextStyle(
                      style: TextStyle(
                        fontFamily: 'PublicSans',
                        fontSize: 30,
                        color: AppColors.whiteText,
                      ),
                      child: AnimatedTextKit(
                        animatedTexts: [
                          FadeAnimatedText("I'm Flutter Developer"),
                          FadeAnimatedText("I'm UI/UX Designer"),
                          FadeAnimatedText("I'm Programmer"),
                        ],
                        repeatForever: true,
                        pause: Duration(milliseconds: 1500),
                        isRepeatingAnimation: true,
                      ),
                    ),
                  )

                ],
                      ),
                    ),
                  ),

                  /// Projects Section
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'My Projects',
                          style: TextStyle(
                            fontFamily: 'Castoro',
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 16),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return Card(
                              margin: EdgeInsets.symmetric(vertical: 8.0),
                              child: ListTile(
                                leading: Icon(Icons.photo, color: AppColors.primaryBlack),
                                title: Text(
                                  'Project ${index + 1}',
                                  style: TextStyle(fontFamily: 'PublicSans', fontSize: 18),
                                ),
                                subtitle: Text(
                                  'Description for Project ${index + 1}',
                                  style: TextStyle(fontFamily: 'PublicSans', fontSize: 14),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),

                  /// Additional Content
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
                    child: Text(
                      'Welcome to my portfolio. Add more content here... ' * 5,
                      style: TextStyle(fontFamily: 'PublicSans', fontSize: 16),
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
