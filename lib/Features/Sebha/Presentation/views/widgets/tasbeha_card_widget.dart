import 'package:flutter/material.dart';

import '../../../../../core/global/SharedWidgets/card_item_shared_widget.dart';
import '../../../../../core/global/app_sizes.dart';
import '../../../../../core/global/app_strings.dart';

class AddedTasbehaItem extends StatelessWidget {
  const AddedTasbehaItem({super.key});

  @override
  Widget build(BuildContext context) {
    return CardItem(
      listTileTitle: AppStrings.taf3eelSala3alaElnapy,
      subTitle: 'عدد التكرار : 1000',
      height: 135,
      iconsInRowMainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Icon(
          Icons.edit,
          color: Theme.of(context).iconTheme.color,
          size: AppSizes.appIconsSize,
        ),
        const Icon(
          Icons.do_disturb_on_outlined,
          color: Colors.redAccent,
          size: AppSizes.appIconsSize,
        ),
      ],
    );
  }
}
