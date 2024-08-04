import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key, this.thickness = 0.4});
  final double thickness;
  @override
  Widget build(BuildContext context) {
    return Divider(
      indent: 20,
      endIndent: 20,
      color: Colors.grey.shade600,
      height: 20,
      thickness: thickness,
    );
  }
}
