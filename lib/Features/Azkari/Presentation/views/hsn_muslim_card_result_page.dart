import 'package:flutter/material.dart';

import '../../../../core/global/SharedWidgets/custom_app_bar_widget.dart';
import '../../data/models/azkari_model.dart';
import 'widgets/HsnMuslimCategoryWidgets/hsn_muslim_card_result_page_body.dart';
import 'widgets/two_floating_action_buttons_widgets.dart';

class HsnMuslimCardResultPage extends StatelessWidget {
  const HsnMuslimCardResultPage({
    super.key,
    required this.zekrModel,
  });
  final ZekrSectionModel zekrModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const FloatingActionButtons(),
      appBar: CustomAppBar(
        title: zekrModel.category,
      ),
      body: HsnMuslimCardResultPageBody(
        zekrList: zekrModel.array,
      ),
    );
  }
}
