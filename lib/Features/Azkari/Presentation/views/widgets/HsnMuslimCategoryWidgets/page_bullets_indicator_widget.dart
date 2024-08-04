import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../../core/global/themes/AppColors/app_colors_dark.dart';

class PageBulletsIndicator extends StatelessWidget {
  const PageBulletsIndicator({
    super.key,
    required PageController pageController,
    required this.bulletsCount,
  }) : _pageController = pageController;

  final PageController _pageController;
  final int bulletsCount;
  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: _pageController,
      count: bulletsCount,
      onDotClicked: (index) {
        _pageController.animateToPage(
          index,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      },
      axisDirection: Axis.horizontal,
      effect: const JumpingDotEffect(
        dotColor: AppColorsDark.schemeColor,
        paintStyle: PaintingStyle.fill,
        verticalOffset: 7,
        radius: 5,
        spacing: 8,
        jumpScale: 1,
        activeDotColor: AppColorsDark.primaryColor,
        offset: 10,
      ),
    );
  }
}
