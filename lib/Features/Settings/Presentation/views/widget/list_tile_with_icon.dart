import 'package:flutter/material.dart';

import '../../../../../core/global/app_sizes.dart';

class ListTileTextWithIcon extends StatelessWidget {
  const ListTileTextWithIcon({
    super.key,
    required this.text,
    required this.icon,
  });

  final String text;

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColorDark,
        borderRadius: const BorderRadius.all(
          Radius.circular(AppSizes.appCircularBorder),
        ),
      ),
      child: ListTile(
        title: Text(
          text,
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                fontSize: AppSizes.bodyTextSize,
              ),
        ),
        trailing: Icon(
          icon,
          color: Theme.of(context).iconTheme.color,
        ),
      ),
    );
  }
}
