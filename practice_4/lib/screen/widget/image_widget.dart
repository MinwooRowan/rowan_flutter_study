import 'package:flutter/material.dart';

class CustomImageWidget extends StatelessWidget {
  final double opacity;
  final bool isFliped;
  final String imagePath;
  const CustomImageWidget({
    super.key,
    this.opacity = 1.0,
    this.isFliped = false,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    if (isFliped) {
      return Transform.flip(
        flipY: true,
        child: Opacity(
          opacity: opacity,
          child: Image.asset(
            imagePath,
          ),
        ),
      );
    } else {
      return Opacity(
        opacity: opacity,
        child: Image.asset(
          imagePath,
        ),
      );
    }
  }
}
