import 'package:flutter/material.dart';

import 'widgets/sebha_page_floating_button.dart';
import 'widgets/sebha_view_body.dart';

class SebhaView extends StatelessWidget {
  const SebhaView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SebhaPageFloatingActionbutton(),
      body: SebhaViewBody(),
    );
  }
}
