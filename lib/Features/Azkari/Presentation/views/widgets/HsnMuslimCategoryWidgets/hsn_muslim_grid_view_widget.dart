import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/global/app_sizes.dart';
import '../../../../../../core/global/setup_dependency_injection.dart';
import '../../../view_models/Cubits/Hsn_muslim_cubit/hsn_muslim_cubit.dart';
import '../../../view_models/Cubits/Hsn_muslim_cubit/hsn_muslim_state.dart';
import 'hsn_muslim_card_item_widget.dart';

class HsnMuslimGridViewList extends StatelessWidget {
  const HsnMuslimGridViewList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HsnMuslimCubit>(
      create: (context) => getIt.get<HsnMuslimCubit>()..readAzkarCategories(),
      child: BlocBuilder<HsnMuslimCubit, HsnMuslimState>(
        builder: (context, state) {
          if (state.azkariIsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
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
                      (_, index) => HsnMuslimCardItem(
                        zekrSectionModel: state.azkarList![index],
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
