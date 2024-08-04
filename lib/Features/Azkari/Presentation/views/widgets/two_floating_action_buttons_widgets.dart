import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/global/Helpers/extensions.dart';
import '../../../../../core/global/SharedWidgets/custom_floating_action_button.dart';
import '../../view_models/Cubits/Hsn_muslim_cubit/hsn_muslim_cubit.dart';

class FloatingActionButtons extends StatelessWidget {
  const FloatingActionButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        CustomFloatingActionButton(
          icon: Icons.adaptive.arrow_back_rounded,
          onPressed: () {
            context.read<HsnMuslimCubit>().goToPreviousPage();
          },
        ),
        const Expanded(child: SizedBox()),
        CustomFloatingActionButton(
          icon: Icons.adaptive.arrow_forward,
          onPressed: () {
            context.read<HsnMuslimCubit>().goToNextPage();
          },
        ),
      ],
    ).paddingAll(40);
  }
}
