import 'package:flutter/material.dart';

import '../../../../../core/global/app_sizes.dart';
import 'list_tile_switch_item.dart';

class ListTileItemWithBackGroundColor extends StatelessWidget {
  const ListTileItemWithBackGroundColor({
    super.key,
    this.height = 60,
    required this.text,
  });

  final double height;

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColorDark,
        borderRadius: BorderRadius.circular(AppSizes.appCircularBorder),
      ),
      child: ListTileSwitchItem(
        text: text,
      ),
    );
  }
}
