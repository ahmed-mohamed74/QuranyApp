//!rebuild according to the specifc card has clicked from user
import 'package:flutter/material.dart';

import '../../../../../core/global/Helpers/extensions.dart';
import '../../../../../core/global/SharedWidgets/card_item_shared_widget.dart';
import '../../../../../core/global/SharedWidgets/custom_app_bar_widget.dart';
import '../../../../../core/global/app_sizes.dart';
import '../../../../../core/global/app_strings.dart';
import '../../../../Azkari/Presentation/views/hsn_muslim_card_result_Page.dart';

class ShowSahehMuslimCardResultPage extends StatelessWidget {
  const ShowSahehMuslimCardResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        title: "اذكار الصباح والمساء",
      ),
      body: SahehMuslimCardResultPageBody(),
    );
  }
}

class SahehMuslimCardResultPageBody extends StatelessWidget {
  const SahehMuslimCardResultPageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      //TODO:to change later
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.horizentalPadding,
          vertical: AppSizes.verticalPadding,
        ),
        child: Column(
          children: [
            ...List.generate(
              10,
              (index) => InkWell(
                onTap: () {
                  // Navigator.pushNamed(context, AppRouter.pageViewBuilderEx);
                  Navigator.push(
                    //TODO : to change
                    context,
                    MaterialPageRoute(
                      builder: (_) {
                        return SizedBox();
                        //   const HsnMuslimCardResultPage();
                      },
                    ),
                  );
                },
                child: const CardItem(
                  listTileTitle: AppStrings.azkarElsabah,
                  subTitle: 'عدد الاذكار : 0',
                  iconsInRowMainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.share,
                    ),
                  ],
                ),
              ),
            ),
          ].paddingFrom(
            bottom: 10,
          ),
        ),
      ),
    );
  }
}
