import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: .04.sw,
              mainAxisSpacing: .04.sh,
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
