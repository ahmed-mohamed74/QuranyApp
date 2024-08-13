import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/global/Helpers/extensions.dart';
import '../../view_model/cubit/prayer_time_cubit.dart';

class PrayerTimeViewBlocBuilder extends StatelessWidget {
  const PrayerTimeViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PrayerTimeCubit, PrayerTimeState>(
      builder: (context, state) {
        if (state is PrayerTimeInitial) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is PrayerTimeLoaded) {
          return ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              _buildPrayerTimeTile('فجر', state.fajr, Icons.wb_sunny),
              _buildPrayerTimeTile('ضهر', state.dhuhr, Icons.sunny),
              _buildPrayerTimeTile('عصر', state.asr, Icons.brightness_5),
              _buildPrayerTimeTile('مغرب', state.maghrib, Icons.brightness_6),
              _buildPrayerTimeTile('عشاء', state.isha, Icons.brightness_2),
            ],
          );
        } else {
          return const Center(
              child: Text('فشل في تحميل مواقيت الصلاة',
                  style: TextStyle(color: Colors.white)));
        }
      },
    );
  }

  Widget _buildPrayerTimeTile(
      String prayerName, DateTime prayerTime, IconData icon) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        gradient: LinearGradient(
          colors: [Colors.grey[800]!, Colors.grey[900]!],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black54,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        trailing: Icon(icon, color: Colors.amber, size: 30),
        title: Text(
          prayerName,
          style: const TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        leading: Text(
          prayerTime.formatTime(),
          style: const TextStyle(
              color: Colors.amber, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
