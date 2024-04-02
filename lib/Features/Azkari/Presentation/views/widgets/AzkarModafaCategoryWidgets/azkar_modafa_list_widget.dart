import 'package:flutter/material.dart';

import '../../../../../../core/global/Helpers/extensions.dart';
import '../../../../../../core/global/app_sizes.dart';
import 'azkar_moadafa_item_widget.dart';

class AzkarModafaMainScrollingList extends StatelessWidget {
  const AzkarModafaMainScrollingList({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSizes.horizentalPadding,
                vertical: AppSizes.verticalPadding,
              ),
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  [
                    ...List.generate(
                      4,
                      (index) => const AzkarModafaItem(),
                    ),
                  ].paddingFrom(
                    top: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
        // SizedBox(
        //   height: 23,
        //   width: 20,
        //   child: Positioned(
        //     // bottom: 300,
        //     // top: 750,
        //     // right: 400,
        //     // left: context.mediaQuery.height * 0.166,
        //     child: ElevatedButton.icon(
        //       onPressed: () {},
        //       icon: const Icon(
        //         Icons.add,
        //       ),
        //       label: Text(
        //         AppStrings.edafaZekr,
        //         style: context.theme.textTheme.headlineMedium!
        //             .copyWith(color: Colors.black),
        //       ),
        //       style: ButtonStyle(
        //         iconColor: Theme.of(context).iconButtonTheme.style!.iconColor,
        //         shape: const MaterialStatePropertyAll(
        //           RoundedRectangleBorder(
        //             borderRadius: BorderRadius.all(
        //               Radius.circular(15),
        //             ),
        //           ),
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
