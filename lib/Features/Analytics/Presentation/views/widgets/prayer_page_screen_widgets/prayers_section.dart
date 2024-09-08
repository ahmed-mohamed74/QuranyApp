import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qurany_analytics_app/view_models/prayer_cubit.dart';

import '../../../constants.dart';
import '../../../models/day_prayers_state.dart';
import '../../../models/prayer_status_model_enum.dart';
import 'prayer_card.dart';

class PrayersSection extends StatefulWidget {
  PrayersSection({
    super.key,
    required this.selectedDateTime,
  });

  DateTime selectedDateTime;

  @override
  State<PrayersSection> createState() => _PrayersSectionState();
}

class _PrayersSectionState extends State<PrayersSection> {
  getData() {
    final cubit = context.read<PrayerCubit>();
    final data = cubit.getPrayerDataForSelectedDate(widget.selectedDateTime);
    cubit.fajrCheckBoxState.prayerStateValue =
        data?.fajrState ?? PrayerStatus.none;
    cubit.dhuhrCheckBoxState.prayerStateValue =
        data?.dhuhrState ?? PrayerStatus.none;
    cubit.asrCheckBoxState.prayerStateValue =
        data?.asrState ?? PrayerStatus.none;
    cubit.maghribCheckBoxState.prayerStateValue =
        data?.maghribState ?? PrayerStatus.none;
    cubit.ishaCheckBoxState.prayerStateValue =
        data?.ishaState ?? PrayerStatus.none;
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant PrayersSection oldWidget) {
    getData();
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<PrayerCubit>();
    return Expanded(
      child: Container(
        color: prayerCoLor2,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 5),
                child: Text(
                  'PRAYERS',
                  style: TextStyle(color: Colors.white54),
                ),
              ),
              PrayerCard(
                Icons.nightlight_round,
                tempPrayerCardState: cubit.fajrCheckBoxState,
              ),
              PrayerCard(
                Icons.wb_sunny,
                tempPrayerCardState: cubit.dhuhrCheckBoxState,
              ),
              PrayerCard(
                Icons.wb_sunny_outlined,
                tempPrayerCardState: cubit.asrCheckBoxState,
              ),
              PrayerCard(
                Icons.nights_stay_outlined,
                tempPrayerCardState: cubit.maghribCheckBoxState,
              ),
              PrayerCard(
                Icons.nightlight,
                tempPrayerCardState: cubit.ishaCheckBoxState,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
