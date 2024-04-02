import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      indent: 20,
      endIndent: 20,
      color: Colors.grey[100],
      height: 20,
      thickness: .06,
    );
  }
}
