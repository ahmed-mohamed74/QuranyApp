import 'package:flutter/material.dart';

import '../../../../../core/global/Helpers/extensions.dart';
import '../../../../../core/global/SharedWidgets/custom_floating_action_button.dart';

class FloatingActionButtons extends StatelessWidget {
  const FloatingActionButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        CustomFloatingActionButton(
          icon: Icons.adaptive.arrow_back_rounded,
          onPressed: () {},
        ),
        Expanded(child: Container()),
        CustomFloatingActionButton(
          icon: Icons.adaptive.arrow_forward,
          onPressed: () {},
        ),
      ],
    ).paddingAll(40);
  }
}
