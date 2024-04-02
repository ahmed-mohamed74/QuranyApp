import 'package:flutter/material.dart';

import '../Helpers/extensions.dart';
import '../app_strings.dart';

class ElevatedButtonWithIcon extends StatelessWidget {
  const ElevatedButtonWithIcon({
    super.key,
    required this.onPressed,
  });

  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: const Icon(
        Icons.add,
      ),
      label: Text(
        AppStrings.edafaZekr,
        style: context.theme.textTheme.headlineMedium!
            .copyWith(color: Colors.black),
      ),
      style: ButtonStyle(
        iconColor: Theme.of(context).iconButtonTheme.style!.iconColor,
        shape: const MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
        ),
      ),
    );
  }
}
