import 'package:flutter/material.dart';

import '../../../../../../core/global/SharedWidgets/card_item_shared_widget.dart';
import '../../../../../../core/global/app_sizes.dart';
import '../../../../../../core/global/app_strings.dart';

class AzkarModafaItem extends StatelessWidget {
  const AzkarModafaItem({super.key});

  @override
  Widget build(BuildContext context) {
    return CardItem(
      listTileTitle: AppStrings.taf3eelSala3alaElnapy,
      children: [
        ...List.generate(
          3,
          (index) => Icon(
            iconList[index],
            color:
                (index != 2) ? Theme.of(context).iconTheme.color : Colors.red,
            size: AppSizes.appIconsSize,
          ),
        ),
      ],
    );
  }
}

List<IconData> iconList = [
  Icons.share,
  Icons.edit,
  Icons.do_disturb_on_outlined,
];
