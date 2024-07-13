import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/global/app_sizes.dart';
import '../../../../../../core/global/setup_dependency_injection.dart';
import '../../../view_models/Cubits/Hsn_muslim_cubit/azkari_cubit.dart';
import '../../../view_models/Cubits/Hsn_muslim_cubit/azkari_state.dart';
import 'hsn_muslim_main_card_item_widget.dart';

class HsnMuslimMainScrollingList extends StatelessWidget {
  const HsnMuslimMainScrollingList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AzkariCubit>(
      create: (context) => getIt.get<AzkariCubit>()..readAzkarCategories(),
      child: BlocBuilder<AzkariCubit, AzkariState>(
        builder: (context, state) {
          if (state.azkariIsLoading) {
            //!TODO : Add shimmer effect
            return const CircularProgressIndicator();
          } else {
            return CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverPadding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSizes.horizentalPadding,
                    vertical: AppSizes.verticalPadding,
                  ),
                  sliver: SliverGrid(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: .04.sw,
                      mainAxisSpacing: .04.sh,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (_, index) => HsnMuslimMainCardItem(
                        zekrModel: state.azkarList![index],
                      ),
                      childCount: state.azkarList!.length,
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
