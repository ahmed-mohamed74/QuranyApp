import 'package:flutter/material.dart';

import '../../../../../../app_router.dart';
import '../../../../../../core/global/SharedWidgets/custom_container_shared_widget.dart';
import '../../../../../../core/global/image_assets.dart';
import '../../../../data/models/azkari_model.dart';

class HsnMuslimMainCardItem extends StatelessWidget {
  final ZekrSectionModel zekrModel;
  const HsnMuslimMainCardItem({
    super.key,
    required this.zekrModel,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(
          context,
          rootNavigator: true,
        ).pushNamed(
          AppRouter.hsnMuslimCardResultPage,
          arguments: zekrModel
        );
      },
      child: CustomSectionContainer(
        textFontSize: 40,
        image: Assets.imagesKa3ba, //TODO: Add image to json
        isWithBackgroundText: true,
        positionOfTextFromBottom: 100,
        positionOfTextFromRight: 10,
        positionOfTextFromLeft: 100,
        positionOfTextFromTop: 10,
        text: zekrModel.category,
        imageHeight: 183,
      ),
    );
  }
}
