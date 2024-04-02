import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomCachingForImage extends StatelessWidget {
  const CustomCachingForImage({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      //! need To be handled more and more and addding fading to it
      imageUrl: imageUrl,
    );
  }
}
