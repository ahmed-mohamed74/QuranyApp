//! refactor it later
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class NamedIcon extends StatelessWidget {
  const NamedIcon({
    super.key,
    required this.icon,
    required this.text,
    this.areInRow = true,
    this.haveSubtitle = false,
    this.subtitleText = '', //! recheck it again later !
  });
  final IconData icon;
  final String text;
  // final CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center;
  // final MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start;
  final bool areInRow;
  final bool haveSubtitle;
  final String subtitleText;
  @override
  Widget build(BuildContext context) {
    if (areInRow) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: Theme.of(context).iconTheme.color,
          ),
          const Gap(
            10,
          ),
          if (haveSubtitle)
            Column(
              children: [
                Text(
                  subtitleText,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const Gap(5),
                Text(
                  // counter goes here
                  text,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
          Text(
            text,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ],
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Theme.of(context).iconTheme.color,
          ),
          const Gap(
            10,
          ),
          Text(
            text,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ],
      );
    }
  }
}
