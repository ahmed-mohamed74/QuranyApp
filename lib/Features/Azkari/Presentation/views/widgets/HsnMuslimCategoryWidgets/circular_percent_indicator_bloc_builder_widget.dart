import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../../../../core/global/themes/AppColors/app_colors_dark.dart';
import '../../../../data/models/zekr_model.dart';
import '../../../view_models/Cubits/Hsn_muslim_cubit/hsn_muslim_cubit.dart';
import '../../../view_models/Cubits/Hsn_muslim_cubit/hsn_muslim_state.dart';

class CircularPercentIndicatorBlocBuilder extends StatelessWidget {
  const CircularPercentIndicatorBlocBuilder({
    super.key,
    required this.zekr,
  });

  final ZekrModel zekr;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HsnMuslimCubit, HsnMuslimState>(
      buildWhen: (previous, current) {
        return previous.zekrCountProgress != current.zekrCountProgress;
      },
      builder: (context, state) {
        return CircularPercentIndicator(
          radius: 30.0,
          curve: Curves.easeIn,
          animation: true,
          footer: Text(
            '${state.zekrCountProgress}/${zekr.count}',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppColorsDark.primaryColor,
                ),
            textAlign: TextAlign.center,
          ),
          animationDuration: 250,
          circularStrokeCap: CircularStrokeCap.round,
          onAnimationEnd: () {
            final pageController =
                context.read<HsnMuslimCubit>().pageController;

            if (state.zekrCountProgress == zekr.count) {
              pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeIn,
              );
              state.zekrCountProgress = 0;
            }
          },
          lineWidth: 8.0,
          percent: calaculateProgressPercent(state),
          backgroundColor: AppColorsDark.primaryColor.withOpacity(.3),
          progressColor: AppColorsDark.primaryColor,
        );
      },
    );
  }

  double calaculateProgressPercent(HsnMuslimState state) {
    int totalCount = zekr.count;
    double percent = state.zekrCountProgress / totalCount;

    return min(1.0, percent);
    //! recheck it later  Ensuring the percent does not exceed 1.0
  }
}
