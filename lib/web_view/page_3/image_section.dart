import 'dart:math';
import 'package:flutter/material.dart';
import 'package:tazeen_portfolio/controllers/utills/app_images/app_images.dart';
class ArcImagesScreen extends StatefulWidget {
  const ArcImagesScreen({super.key});

  @override
  State<ArcImagesScreen> createState() => _ArcImagesScreenState();
}

class _ArcImagesScreenState extends State<ArcImagesScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final List<String> imageUrls = [
    AppImages.heroImage,
    AppImages.heroImage,
    AppImages.image4,
    AppImages.heroImage,
    AppImages.image1,
    AppImages.heroImage,
    AppImages.heroImage,
    AppImages.heroImage,
    AppImages.image2,
    AppImages.image3,
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    )..repeat();
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0F2027), Color(0xFF420516), Color(0xFF272121)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Stack(
              alignment: Alignment.center,
              children: List.generate(imageUrls.length, (index) {
                double angle = (pi / (imageUrls.length - 1)) * index;
                double rotation = _controller.value  * pi;
                final double radius = size.width * 0.35;
                return Transform(
                  transform: Matrix4.identity()
                    ..translate(
                      radius * cos(angle + rotation),
                      -radius * sin(angle + rotation),
                    ),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    color: Colors.white.withOpacity(0.15),
                    elevation: 5,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        imageUrls[index],
                        width: 130,
                        height: 170,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              }),
            );
          },
        ),
      ),
    );
  }
}
