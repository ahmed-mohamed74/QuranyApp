import 'package:flutter/material.dart';

import 'widget/setting_view_body.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SettingViewBody(),
    );
  }
}
