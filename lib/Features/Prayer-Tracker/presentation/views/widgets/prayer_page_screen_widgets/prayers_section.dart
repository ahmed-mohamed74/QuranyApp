import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'prayer_card.dart';

class PrayersSection extends StatelessWidget {
  const PrayersSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: prayerCoLor2,
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 5),
                child: Text(
                  'PRAYERS',
                  style: TextStyle(color: Colors.white54),
                ),
              ),
              PrayerCard(
                Icons.nightlight_round,
                true,
                prayerName: 'Fajr',
              ),
              PrayerCard(
                Icons.wb_sunny,
                false,
                prayerName: 'Dhuhr',
              ),
              PrayerCard(
                Icons.wb_sunny_outlined,
                false,
                prayerName: 'Asr',
              ),
              PrayerCard(
                Icons.nights_stay_outlined,
                false,
                prayerName: 'Maghrib',
              ),
              PrayerCard(
                Icons.nightlight,
                false,
                prayerName: 'Isha',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
