import 'package:flutter/material.dart';

class ImageWithAspectRatio extends StatelessWidget {
  const ImageWithAspectRatio({
    super.key,
    required this.image,
    required this.aspectRatio,
  });
  final String image;
  final double aspectRatio;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1 / 1,
      child: Image.asset(image),
    );
  }
}
