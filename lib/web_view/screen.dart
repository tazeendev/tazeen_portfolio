import 'package:flutter/material.dart';

class YogaStudioScreen extends StatelessWidget {
  const YogaStudioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 1. Background Image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://images.unsplash.com/photo-1544367567-0f2fcb009e0b?q=80&w=2120&auto=format&fit=crop'), // Aap apni image yahan laga sakte hain
                fit: BoxFit.cover,
              ),
            ),
          ),

          // 2. Custom Curved Container with Shadow
          ClipPath(
            clipper: CustomShapeClipper(),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(5, 5),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 40, top: 120),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Yoga',
                      style: TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.w300,
                        color: Colors.black87,
                      ),
                    ),
                    const Text(
                      'studio',
                      style: TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'The harmony of your body and soul starts here',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal.shade100,
                        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        'Get free trial lesson',
                        style: TextStyle(color: Colors.black54),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Yeh class custom shape banati hai
class CustomShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    // Path shuru hoga top-left se
    path.lineTo(0, size.height * 0.7); // Neeche aayega

    // Pehla curve
    path.quadraticBezierTo(
      size.width * 0.1,  // Control point X
      size.height * 0.9,  // Control point Y
      size.width * 0.4,  // End point X
      size.height * 0.9,  // End point Y
    );

    // Dusra curve (jo text ke neeche hai)
    path.quadraticBezierTo(
      size.width * 0.9,   // Control point X
      size.height * 0.9,   // Control point Y
      size.width,        // End point X
      size.height * 0.5,   // End point Y
    );

    path.lineTo(size.width, 0); // Wapis top-right tak
    path.close(); // Path ko band karega

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false; // Agar shape static hai to false hi rahega
  }
}