import 'package:flutter/material.dart';

import '../../../../../core/global/app_sizes.dart';

class ListTileIcon extends StatelessWidget {
  const ListTileIcon({
    super.key,
    required this.icon,
    required this.onTap,
    required this.child,
  });
  final IconData icon;

  final void Function()? onTap;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 100,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColorDark,
          borderRadius: const BorderRadius.all(
            Radius.circular(AppSizes.appCircularBorder),
          ),
        ),
        child: Center(
          child: child,
        ),
      ),
    );
  }
}
