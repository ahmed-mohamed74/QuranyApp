import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qurany_analytics_app/models/day_prayers_state.dart';
import 'package:qurany_analytics_app/view_models/prayer_cubit.dart';

import 'prayer_page_screen_widgets/prayer_page_header_section.dart';
import 'prayer_page_screen_widgets/prayers_section.dart';

class PrayerPageScreen extends StatelessWidget {
  const PrayerPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PrayerCubit,PrayerState>(
      builder: (context, state) {
        return SafeArea(
          child: Column(
            children: [
              PrayerPageHeaderSection(),
              const SizedBox(height: 10),
              PrayersSection(
                selectedDateTime: state.dateTime,
              ),
            ],
          ),
        );
      },
    );
  }
}
