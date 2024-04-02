import 'package:flutter/material.dart';

import '../../../../../../core/global/app_sizes.dart';
import 'hsn_muslim_main_card_item_widget.dart';

class HsnMuslimMainScrollingList extends StatelessWidget {
  const HsnMuslimMainScrollingList({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const ClampingScrollPhysics(),
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.horizentalPadding,
            vertical: AppSizes.verticalPadding,
          ),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 30,
              mainAxisSpacing: 30,
            ),
            delegate: SliverChildBuilderDelegate(
              (_, index) => const HsnMuslimMainCardItem(),
              childCount: 10,
            ),
          ),
        ),
      ],
    );
  }
}
