import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../view_model/cubit/prayer_time_cubit.dart';
import 'widgets/prayer_time_view_body.dart';

class PrayerTimesPage extends StatelessWidget {
  const PrayerTimesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PrayerTimeCubit()..fetchLocationAndLoadPrayerTimes(),
      child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'مواقيت الصلاة',
            ),
          ),
          body: const PrayerTimeViewBlocBuilder()),
    );
  }
}
