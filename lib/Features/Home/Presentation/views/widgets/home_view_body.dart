import 'package:flutter/material.dart';

import '../../../../../core/global/SharedWidgets/custom_sliver_app_bar_widget.dart';
import '../../../../../core/global/app_strings.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        CustomSliverAppBar(
          title: AppStrings.ra2esy,
        ),
      ],
    );
  }
}
