import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'list_tile_shared_widget.dart';

class CardItem extends StatelessWidget {
  const CardItem({
    super.key,
    required this.children,
    this.subTitle = '',
    this.height = 185,
    this.iconsInRowMainAxisAlignment = MainAxisAlignment.spaceBetween,
    required this.listTileTitle,
  });
  final List<Widget> children;
  final String subTitle;
  final String listTileTitle;

  final double height;
  final MainAxisAlignment? iconsInRowMainAxisAlignment;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: Card(
        elevation: 1,
        // clipBehavior: Clip.antiAliasWithSaveLayer,
        color: Theme.of(context).primaryColorDark,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTileSharedWidget(
              title: listTileTitle,
              leadingIcon: Icons.ac_unit,
              subTitle: subTitle,
            ),
            const Gap(10),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Row(
                mainAxisAlignment: iconsInRowMainAxisAlignment!, //spaceBetween
                mainAxisSize: MainAxisSize.max,
                children: children,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
