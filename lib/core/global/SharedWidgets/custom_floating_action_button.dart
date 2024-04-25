import 'package:flutter/material.dart';

import '../Helpers/generate_random_strings.dart';
import '../themes/AppColors/app_colors_dark.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({
    super.key,
    required this.onPressed,
    required this.icon,
    this.toolTip,
    this.shape,
  });
  final void Function() onPressed;
  final IconData icon;
  final String? toolTip;
  final ShapeBorder? shape;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: AppColorsDark.buttonColor,
      heroTag: generateRandomNumber(),
      onPressed: onPressed,
      tooltip: toolTip,
      shape: shape,
      child: Icon(icon),
    );
  }
}
