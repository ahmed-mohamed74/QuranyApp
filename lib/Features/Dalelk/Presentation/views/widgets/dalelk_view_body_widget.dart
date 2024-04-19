import 'package:flutter/material.dart';

import '../../../../../core/global/Helpers/extensions.dart';
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
        //TODO: Take Aya General AppBar When it push its changes
        //TODO: make ascroll from under the app bar and app bar static
        CustomSliverAppBar(
          isPinned: true,
          title: S.of(context).settingTitle,
        ),
        SliverPadding(
          padding: EdgeInsets.only(
            left: AppSizes
                .horizentalPadding, // TODO!: make them statis in appStrings later\
            right: AppSizes.horizentalPadding,
            bottom: context.screenHeight / 9, // AppSizes.verticalPadding,
            top: context.screenHeight / 9,
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
