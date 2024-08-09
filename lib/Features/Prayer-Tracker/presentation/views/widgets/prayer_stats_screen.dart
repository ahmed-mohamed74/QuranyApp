import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../constants.dart';
import 'prayer_stats_screen_widgets/prayer_stats_heatmap_calender.dart';
import 'prayer_stats_screen_widgets/stats_choice_chips.dart';
import 'prayer_stats_screen_widgets/status_summary_section.dart';

class PrayerStatsScreen extends StatefulWidget {
  const PrayerStatsScreen({super.key});

  @override
  State<PrayerStatsScreen> createState() => _PrayerStatsScreenState();
}

class _PrayerStatsScreenState extends State<PrayerStatsScreen> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: prayerCoLor1,
            ),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(height: 5),
                  Text(
                    'Stats',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: prayerCoLor2,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const PrayerStatsHeatMapCalender(),
                    const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: StatsChoiceChips(),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: StatusSummarySection(),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
