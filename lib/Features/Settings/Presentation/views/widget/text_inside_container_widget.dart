import 'package:flutter/material.dart';

class TextInsideContainer extends StatelessWidget {
  const TextInsideContainer({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      child: SizedBox(
        height: 50,
        width: 200,
        child: DecoratedBox(
          decoration: const BoxDecoration(
            color: Color(0xff111E2E),
            borderRadius: BorderRadius.all(
              Radius.circular(11),
            ),
          ),
          child: Center(
            child: Text(
              text,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: Colors.blueAccent,
                  ), //TODO! make it acustom color later
            ),
          ),
        ),
      ),
    );
  }
}
