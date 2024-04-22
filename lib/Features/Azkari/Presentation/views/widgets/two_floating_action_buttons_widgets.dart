import 'package:flutter/material.dart';

import '../../../../../core/global/Helpers/generate_random_strings.dart';
import '../../../../../core/global/themes/AppColors/app_colors_dark.dart';

class FloatingActionButtons extends StatelessWidget {
  const FloatingActionButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        FloatingActionButton(
          backgroundColor: AppColorsDark.buttonColor,
          heroTag: generateRandomNumber(),
          onPressed: () {},
          child: Icon(Icons.adaptive.arrow_forward_outlined),
        ),
        const SizedBox(
          width: 40,
        ),
        FloatingActionButton(
          backgroundColor: AppColorsDark.buttonColor,
          heroTag: generateRandomNumber(),
          onPressed: () {},
          child: Icon(Icons.adaptive.arrow_back_rounded),
        ),
      ],
    );
  }
}
