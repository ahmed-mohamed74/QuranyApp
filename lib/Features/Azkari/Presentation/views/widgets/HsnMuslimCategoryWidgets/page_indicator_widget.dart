import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../../core/global/themes/AppColors/app_colors_dark.dart';

class PageIndicator extends StatelessWidget {
  const PageIndicator({
    super.key,
    required PageController pageController,
  }) : _pageController = pageController;

  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: _pageController,
      count: 5,
      axisDirection: Axis.horizontal,
      effect: const JumpingDotEffect(
        dotColor: AppColorsDark.schemeColor,
        paintStyle: PaintingStyle.fill,
        verticalOffset: 7,
        radius: 5,
        spacing: 10,
        jumpScale: 1,
        activeDotColor: AppColorsDark.primaryColor,
        offset: 10,
      ),
    );
  }
}
