import 'package:flutter/material.dart';

import '../../../../core/global/SharedWidgets/custom_app_bar_widget.dart';
import '../../../../core/global/app_strings.dart';
import 'widgets/HsnMuslimCategoryWidgets/hsn_muslim_card_result_page_body.dart';
import 'widgets/two_floating_action_buttons_widgets.dart';

class HsnMuslimCardResultPage extends StatelessWidget {
  const HsnMuslimCardResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButtons(),
      appBar: CustomAppBar(
        title: AppStrings.azkarElsabah,
      ),
      body: HsnMuslimCardResultPageBody(),
    );
  }
}
