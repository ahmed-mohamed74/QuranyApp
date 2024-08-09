import 'package:flutter/material.dart';

import 'prayer_page_screen_widgets/prayer_page_header_section.dart';
import 'prayer_page_screen_widgets/prayers_section.dart';

class PrayerPageScreen extends StatelessWidget {
  const PrayerPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Column(
        children: [
          PrayerPageHeaderSection(),
          SizedBox(height: 10),
          PrayersSection(),
        ],
      ),
    );
  }
}
