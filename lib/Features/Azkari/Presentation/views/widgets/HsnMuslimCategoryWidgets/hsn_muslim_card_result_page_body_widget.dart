import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/global/Helpers/extensions.dart';
import '../../../../../../core/global/SharedWidgets/main_divider_widget.dart';
import '../../../../../../core/global/app_sizes.dart';
import '../../../../../../core/global/themes/AppColors/app_colors_dark.dart';
import '../../../../data/models/zekr_model.dart';
import '../../../../data/models/zekr_section_model.dart';
import '../../../view_models/Cubits/Hsn_muslim_cubit/hsn_muslim_cubit.dart';
import '../../../view_models/Cubits/Hsn_muslim_cubit/hsn_muslim_state.dart';
import 'circular_percent_indicator_bloc_builder_widget.dart';
import 'page_bullets_indicator_widget.dart';

class HsnMuslimCardResultPageBody extends StatelessWidget {
  final ZekrSectionModel zekrSectionModel;

  const HsnMuslimCardResultPageBody({
    super.key,
    required this.zekrSectionModel,
  });

  @override
  Widget build(BuildContext context) {
    final pageController = context.read<HsnMuslimCubit>().pageController;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: AppSizes.pageViewBuildervertical,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            PageBulletsIndicator(
              pageController: pageController,
              bulletsCount: zekrSectionModel.array.length,
            ),
            InkWell(
              onTap: () {
                //TODO: add more logic here to handle the incrementing of zekr count later
                context.read<HsnMuslimCubit>().incrementZekrCount();
              },
              child: SizedBox(
                height: MediaQuery.of(context).size.height * .825,
                child: PageView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  onPageChanged: (currentPageIdex) {},
                  controller: pageController,
                  itemCount: zekrSectionModel.array.length,
                  itemBuilder: (context, index) {
                    return ZekrDetailsPage(
                      zekrIndex: index,
                      zekrSectionModel: zekrSectionModel,
                    );
                  },
                ),
              ),
            ),
          ].paddingFrom(bottom: .001.sh),
        ),
      ),
    );
  }
}

class ZekrDetailsPage extends StatelessWidget {
  const ZekrDetailsPage({
    super.key,
    required this.zekrIndex,
    required this.zekrSectionModel,
  });

  final ZekrSectionModel zekrSectionModel;

  final int zekrIndex;

  ZekrModel get zekr => zekrSectionModel.array[zekrIndex];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HsnMuslimCubit, HsnMuslimState>(
      builder: (context, state) {
        if (state.azkariIsLoading) {
          return const CircularProgressIndicator();
        } else {
          return Container(
            height: context.screenHeight - context.screenHeight * .2,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 20,
            ),
            decoration: const BoxDecoration(
              color: AppColorsDark.schemeColor,
              borderRadius: BorderRadius.all(
                Radius.circular(
                  AppSizes.appCircularBorder,
                ),
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    zekr.text,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  CircularPercentIndicatorBlocBuilder(
                    zekr: zekr,
                  ),
                  const CustomDivider(
                    thickness: 2,
                  ),
                  const Center(
                    child: Icon(
                      Icons.share,
                    ),
                  ),
                ].paddingFrom(
                  left: 20,
                  right: 20,
                  top: 20,
                  bottom: 30,
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
