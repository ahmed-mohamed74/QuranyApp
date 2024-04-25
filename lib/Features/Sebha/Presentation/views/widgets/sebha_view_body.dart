import 'package:flutter/material.dart';

import '../../../../../core/global/Helpers/extensions.dart';
import '../../../../../core/global/SharedWidgets/custom_sliver_app_bar_widget.dart';
import '../../../../../core/global/app_sizes.dart';
import '../../../../../core/global/localization/generated/l10n.dart';
import 'tasbeha_card_widget.dart';

class SebhaViewBody extends StatelessWidget {
  const SebhaViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      slivers: [
        CustomSliverAppBar(
          title: S.of(context).sebhaPageTitle,
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSizes
                .horizentalPadding, // TODO!: make them statis in appStrings later
            vertical: AppSizes.verticalPadding,
          ),
          sliver: SliverList(
            delegate: SliverChildListDelegate(
              [
                ...List.generate(
                  10,
                  (index) => const AddedTasbehaItem(),
                ),
              ].paddingFrom(
                bottom: 10,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
