import 'package:flutter/material.dart';

import '../../../../app_router.dart';
import '../../../../core/global/Helpers/extensions.dart';
import '../../../../core/global/Helpers/generate_random_strings.dart';
import '../../../../core/global/SharedWidgets/custom_sliver_app_bar_widget.dart';
import '../../../../core/global/app_sizes.dart';
import '../../../../core/global/app_strings.dart';
import '../../../../core/global/localization/generated/l10n.dart';
import '../../../../core/global/themes/AppColors/app_colors_dark.dart';
import 'widgets/tasbeha_card_widget.dart';

class SebhaView extends StatelessWidget {
  const SebhaView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: const SebhaPageFloatingActionbutton(),
      body: CustomScrollView(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        slivers: [
          CustomSliverAppBar(
            title: S.of(context).settingTitle,
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSizes
                  .horizentalPadding, // TODO!: make them statis in appStrings later
              vertical: AppSizes.verticalPadding,
            ),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  ...List.generate(
                    10,
                    (index) => const AddedTasbehaItem(),
                  ),
                ].paddingFrom(
                  bottom: 10,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SebhaPageFloatingActionbutton extends StatelessWidget {
  const SebhaPageFloatingActionbutton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 60, left: context.screenWidth / 50),
      child: SizedBox(
        width: 150,
        height: 50,
        child: FloatingActionButton(
          heroTag: generateRandomNumber(),
          onPressed: () {
            //* rootNavigator: true , to remove nav bar from pushed page
            Navigator.of(context, rootNavigator: true).pushNamed(
              AppRouter.edafetZekrPage,
            );
          },
          backgroundColor: AppColorsDark.buttonColor,
          elevation: 30,
          clipBehavior: Clip.antiAlias,
          hoverElevation: 50,
          enableFeedback: true,
          child: Text(
            AppStrings.edafaZekr,
            style: context.theme.textTheme.titleLarge!
                .copyWith(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
