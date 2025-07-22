import 'package:flutter/material.dart';
import 'package:tazeen_portfolio/controllers/utills/app_images/app_images.dart';
import '../../../utills/app_colors/app_colors.dart';
class SidebarWidget extends StatefulWidget {
  final Function(int)? onItemTapped; // Reusable callback for navigation

  const SidebarWidget({Key? key, this.onItemTapped}) : super(key: key);

  @override
  _SidebarWidgetState createState() => _SidebarWidgetState();
}

class _SidebarWidgetState extends State<SidebarWidget> {
  int _selectedIndex = -1; // Track selected item
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Responsive width based on screen size
    double sidebarWidth = screenWidth > 1200 ? 300 : (screenWidth > 600 ? 250 : 200);
    return Container(
      width: sidebarWidth,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.black,Colors.brown],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: SingleChildScrollView( // Scrollable
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: MediaQuery.of(context).size.height),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: CircleAvatar(
                  radius: sidebarWidth > 250 ? 40 : 30, // Responsive avatar size
                  backgroundImage: AssetImage(AppImages.heroImage),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min, // Keeps row width compact to text
                children: [
                  Text(
                    'Tazeen',
                    style: TextStyle(
                      color: Colors.brown,
                      fontFamily: 'Castoro',
                      fontSize: sidebarWidth > 250 ? 20 : 16,
                    ),
                  ),
                  Text(
                    ' Zahra',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Castoro',
                      fontSize: sidebarWidth > 250 ? 20 : 16,
                    ),
                  ),
                  Text(
                    ' Batool',
                    style: TextStyle(
                      color: Colors.brown,
                      fontFamily: 'Castoro',
                      fontSize: sidebarWidth > 250 ? 20 : 16,
                    ),
                  ),
                ],
              ),


              // Social Media Row with Hover
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MouseRegion(
                    onHover: (_) => setState(() {}),
                    child: IconButton(
                      icon: Icon(Icons.language, color: AppColors.whiteText),
                      onPressed: () {},
                      color: AppColors.whiteText.withOpacity(0.7),
                      hoverColor: Colors.brown,
                      iconSize: sidebarWidth > 250 ? 24 : 20, // Responsive icon size
                    ),
                  ),
                  MouseRegion(
                    onHover: (_) => setState(() {}),
                    child: IconButton(
                      icon: Icon(Icons.facebook, color: AppColors.whiteText),
                      onPressed: () {},
                      color: AppColors.whiteText.withOpacity(0.7),
                      hoverColor: Colors.brown,
                      iconSize: sidebarWidth > 250 ? 24 : 20,
                    ),
                  ),
                  MouseRegion(
                    onHover: (_) => setState(() {}),
                    child: IconButton(
                      icon: Icon(Icons.camera_alt, color: AppColors.whiteText), // Instagram placeholder
                      onPressed: () {},
                      color: AppColors.whiteText.withOpacity(0.7),
                      hoverColor: Colors.brown,
                      iconSize: sidebarWidth > 250 ? 24 : 20,
                    ),
                  ),
                ],
              ),
              ListTile(
                leading: Icon(Icons.home, color: _selectedIndex == 0 ? Colors.brown : AppColors.whiteText, size: sidebarWidth > 250 ? 24 : 20),
                title: Text('Home', style: TextStyle(color: _selectedIndex == 0 ? Colors.grey : AppColors.whiteText, fontSize: sidebarWidth > 250 ? 16 : 14)),
                onTap: () {
                  setState(() => _selectedIndex = 0);
                  if (widget.onItemTapped != null) widget.onItemTapped!(0);
                },
              ),
              ListTile(
                leading: Icon(Icons.person, color: _selectedIndex == 1 ? Colors.brown : AppColors.whiteText, size: sidebarWidth > 250 ? 24 : 20),
                title: Text('About', style: TextStyle(color: _selectedIndex == 1 ? Colors.grey : AppColors.whiteText, fontSize: sidebarWidth > 250 ? 16 : 14)),
                onTap: () {
                  setState(() => _selectedIndex = 1);
                  if (widget.onItemTapped != null) widget.onItemTapped!(1);
                },
              ),
              ListTile(
                leading: Icon(Icons.description, color: _selectedIndex == 2 ? Colors.brown : AppColors.whiteText, size: sidebarWidth > 250 ? 24 : 20),
                title: Text('Resume', style: TextStyle(color: _selectedIndex == 2 ? Colors.grey : AppColors.whiteText, fontSize: sidebarWidth > 250 ? 16 : 14)),
                onTap: () {
                  setState(() => _selectedIndex = 2);
                  if (widget.onItemTapped != null) widget.onItemTapped!(2);
                },
              ),
              ListTile(
                leading: Icon(Icons.photo, color: _selectedIndex == 3 ? Colors.brown : AppColors.whiteText, size: sidebarWidth > 250 ? 24 : 20),
                title: Text('Portfolio', style: TextStyle(color: _selectedIndex == 3 ? Colors.grey : AppColors.whiteText, fontSize: sidebarWidth > 250 ? 16 : 14)),
                onTap: () {
                  setState(() => _selectedIndex = 3);
                  if (widget.onItemTapped != null) widget.onItemTapped!(3);
                },
              ),
              ListTile(
                leading: Icon(Icons.build, color: _selectedIndex == 4 ? Colors.brown : AppColors.whiteText, size: sidebarWidth > 250 ? 24 : 20),
                title: Text('Services', style: TextStyle(color: _selectedIndex == 4 ? Colors.grey : AppColors.whiteText, fontSize: sidebarWidth > 250 ? 16 : 14)),
                onTap: () {
                  setState(() => _selectedIndex = 4);
                  if (widget.onItemTapped != null) widget.onItemTapped!(4);
                },
              ),
              ListTile(
                leading: Icon(Icons.arrow_drop_down, color: _selectedIndex == 5? Colors.brown : AppColors.whiteText, size: sidebarWidth > 250 ? 24 : 20),
                title: Text('Dropdown', style: TextStyle(color: _selectedIndex == 3 ? Colors.grey : AppColors.whiteText, fontSize: sidebarWidth > 250 ? 16 : 14)),
                onTap: () {
                  setState(() => _selectedIndex = 5);
                  if (widget.onItemTapped != null) widget.onItemTapped!(3);
                },
              ),
              ListTile(
                leading: Icon(Icons.contact_page_outlined, color: _selectedIndex == 6? Colors.brown : AppColors.whiteText, size: sidebarWidth > 250 ? 24 : 20),
                title: Text('Contacts', style: TextStyle(color: _selectedIndex == 4 ? Colors.grey : AppColors.whiteText, fontSize: sidebarWidth > 250 ? 16 : 14)),
                onTap: () {
                  setState(() => _selectedIndex = 6);
                  if (widget.onItemTapped != null) widget.onItemTapped!(4);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}