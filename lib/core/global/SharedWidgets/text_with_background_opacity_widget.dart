import 'package:flutter/material.dart';

class TextWithOpacityBackGround extends StatelessWidget {
  const TextWithOpacityBackGround({
    super.key,
    required this.text,
    required this.textFontSize,
    this.color = Colors.black,
    required this.opacityDegree,
  });

  final String text;
  final double textFontSize;

  ///0 to 1
  final double opacityDegree;

  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        // effect entire content of the container
        right: 2,
        bottom: 20,
        left: 20,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: color!.withOpacity(opacityDegree),
      ),
      child: FittedBox(
        /// to ensure always that the text will not be out of container (parent )
        fit: BoxFit.contain,
        child: Text(
          text,
          overflow: TextOverflow.fade,
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                fontSize: textFontSize,
              ),
        ),
      ),
    );
  }
}
