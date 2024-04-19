import 'package:flutter/material.dart';

import '../../../../../core/global/SharedWidgets/custom_container_shared_widget.dart';
import '../../../../../core/global/SharedWidgets/custom_sliver_app_bar_widget.dart';
import '../../../../../core/global/app_sizes.dart';
import '../../../../../core/global/app_strings.dart';
import '../../../../../core/global/image_assets.dart';
import '../../../../../core/global/localization/generated/l10n.dart';

class DalelkViewBody extends StatelessWidget {
  const DalelkViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      slivers: [
        CustomSliverAppBar(
          isPinned: true,
          title: S.of(context).settingTitle,
        ),
        SliverPadding(
          padding: const EdgeInsets.only(
            left: AppSizes
                .horizentalPadding, // TODO!: make them statis in appStrings later\
            right: AppSizes.horizentalPadding,
            bottom: 100, // AppSizes.verticalPadding,
          ),
          sliver: SliverList(
            delegate: SliverChildListDelegate(
              [
                const CustomSectionContainer(
                  imageHeight: 600,
                  textFontSize: 30,
                  text: AppStrings.dalelkFelSeyam,
                  positionOfTextFromBottom: 5,
                  positionOfTextFromRight: 20,
                  image: Assets.imagesKa3ba,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
