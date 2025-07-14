import 'package:flutter/material.dart';
import 'package:tazeen_portfolio/controllers/utills/app_colors/app_colors.dart';
import 'package:tazeen_portfolio/controllers/utills/app_images/app_images.dart';
class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteText,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'About',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Castoro', // or 'PublicSans'
                      color: Colors.black,   // or AppColors.primaryWhite
                    ),
                  ),
                  SizedBox(height: 6),
                  Container(
                    width: 80,
                    height: 3,
                    color: Colors.brown, // Or use any highlight color you prefer
                  ),
                  Text(
                    'Magnam dolores commodi suscipit. Necessitatibus eius consequuntur ex aliquid fuga eum quidem. Sit sint consectetur velit. Quisquam quos quisquam cupiditate. Et nemo qui impedit suscipit alias ea. Qui fugit sit in iste officiis commodi quidem hic quas.',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Image.asset(
                      AppImages.heroImage,
                      height:450,
                      width: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),
                        Text(
                          'UI/UX Designer & Web Developer',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.arrow_forward_ios,color: Colors.brown,size: 10,),
                                SizedBox(width: 10,),
                                Text('Birthday: 1 May 1995'),
                                SizedBox(width: 100,),
                                Icon(Icons.arrow_forward_ios,color: Colors.brown,size: 10,),
                                SizedBox(width: 10,),
                                Text('Age: 30'),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.arrow_forward_ios,color: Colors.brown,size: 10,),
                                SizedBox(width: 10,),
                                Text('Website: www.example.com'),
                                SizedBox(width: 100,),
                                Icon(Icons.arrow_forward_ios,color: Colors.brown,size: 10,),
                                Text('Degree:Undergraduate'),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.arrow_forward_ios,color: Colors.brown,size: 10,),
                                SizedBox(width: 10,),
                                Text('Phone: +123 456 7890'),
                                SizedBox(width: 100,),
                                Icon(Icons.arrow_forward_ios,color: Colors.brown,size: 10,),
                                SizedBox(width: 10,),
                                Text('Email:tazeenzahrabatool@gmail.com'),
                              ],
                            ),
                            Row(
                              children: [
                                Text('City: New York, USA'),
                              ],
                            ),
                            Row(
                              children: [
                                Text('Degree: Master'),
                              ],
                            ),
                            Row(
                              children: [
                                Text('Email: email@example.com'),
                              ],
                            ),
                            Text('Freelance: Available'),
                          ],
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Officiis eligendi itaque labore et dolorum mollitia officiis optio vero. Quisquam sunt adipisci omnis et ut. Nulla accusantium dolor incidunt officia tempore. Et eius omnis. Cupiditate ut dicta maxime officiis quidem quia. Sed et consectetur qui quia repellendus itaque neque.',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}