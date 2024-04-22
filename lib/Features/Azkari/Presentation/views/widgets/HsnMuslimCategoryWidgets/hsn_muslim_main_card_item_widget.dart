import 'package:flutter/material.dart';

import '../../../../../../app_router.dart';
import '../../../../../../core/global/SharedWidgets/custom_container_shared_widget.dart';
import '../../../../../../core/global/app_strings.dart';
import '../../../../../../core/global/image_assets.dart';

class HsnMuslimMainCardItem extends StatelessWidget {
  const HsnMuslimMainCardItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context, rootNavigator: true).pushNamed(
          AppRouter.hsnMuslimCardResultPage,
        );
      },
      child: const CustomSectionContainer(
        textFontSize: 40,
        image: Assets.imagesKa3ba,
        isWithBackgroundText: true,
        positionOfTextFromBottom: 100,
        positionOfTextFromRight: 10,
        positionOfTextFromLeft: 100,
        positionOfTextFromTop: 10,
        text: AppStrings.azkarSabahWeMasaa,
        imageHeight: 183,
      ),
    );
  }
}
