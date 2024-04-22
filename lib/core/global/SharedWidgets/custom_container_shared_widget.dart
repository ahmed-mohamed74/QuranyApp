import 'package:flutter/material.dart';

import '../app_sizes.dart';
import 'text_with_background_opacity_widget.dart';

class CustomSectionContainer extends StatelessWidget {
  const CustomSectionContainer({
    super.key,
    required this.image,
    required this.imageHeight,
    required this.positionOfTextFromBottom,
    required this.positionOfTextFromRight,
    this.positionOfTextFromLeft = 0,
    this.positionOfTextFromTop = 0,
    required this.text,
    required this.textFontSize,
    this.isWithBackgroundText = false,
  });
  final String image;
  final double? positionOfTextFromBottom;
  final double? imageHeight;

  final double? positionOfTextFromRight;
  final double? positionOfTextFromLeft;
  final double? positionOfTextFromTop;
  final String text;
  final double textFontSize;
  final bool isWithBackgroundText;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          child: ClipRRect(
            // clipBehavior: Clip.ant      iAliasWithSaveLayer,
            borderRadius: BorderRadius.circular(
              AppSizes.appCircularBorder,
            ),
            child: Image.asset(
              image,
              fit: BoxFit.cover, // cover
              height: imageHeight,
              cacheHeight: 1000,
              cacheWidth: 1000,
            ),
          ),
        ),
        Positioned(
          bottom: positionOfTextFromBottom,
          right: positionOfTextFromRight,
          left: positionOfTextFromLeft,
          top: positionOfTextFromTop,
          child: (isWithBackgroundText)
              ? TextWithOpacityBackGround(
                  text: text,
                  textFontSize: textFontSize,
                  opacityDegree: .399,
                )
              : Text(
                  text,
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        fontSize: textFontSize,
                      ),
                ),
        ),
      ],
    );
  }
}
