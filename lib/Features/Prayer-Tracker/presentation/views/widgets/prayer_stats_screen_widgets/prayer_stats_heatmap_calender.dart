import 'package:flutter/material.dart';

import '../../../constants.dart';

class PrayerStatsHeatMapCalender extends StatefulWidget {
  const PrayerStatsHeatMapCalender({
    super.key,
  });

  @override
  State<PrayerStatsHeatMapCalender> createState() => _PrayerStatsHeatMapCalenderState();
}

class _PrayerStatsHeatMapCalenderState extends State<PrayerStatsHeatMapCalender> {
  // Data structure for tracking prayers
  Map<int, List<bool>> prayerData = {};

  // Initialize prayer data for the current month
  void initializePrayerData(int daysInMonth) {
    for (int i = 1; i <= daysInMonth; i++) {
      prayerData[i] = [
        false,
        false,
        false,
        false,
        false
      ]; // Fajr, Dhuhr, Asr, Maghrib, Isha
    }
  }

  void updatePrayerStatus(int day, int prayerIndex, bool status) {
    if (prayerData.containsKey(day)) {
      prayerData[day]![prayerIndex] = status;
    }
  }

  @override
  Widget build(BuildContext context) {
    int daysInMonth = DateTime.now().month == 2
        ? (DateTime.now().year % 4 == 0 ? 29 : 28)
        : [4, 6, 9, 11].contains(DateTime.now().month)
        ? 30
        : 31;
    initializePrayerData(daysInMonth);
    return Container(
      color: prayerCoLor1,
      width: double.infinity,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              color: prayerCoLor1,
              height: 180,
              width: 300,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: _buildHeatmap(),
                ),
              ),
            ),
          ),
          const Spacer(),
          Container(
            height: 190,
            padding: const EdgeInsets.all(5),
            color: Colors.blue,
            child: const Column(
              children: [
                SizedBox(height: 30),
                Icon(
                  Icons.nightlight_outlined,
                  color: Colors.white,
                ),
                SizedBox(height: 7),
                Icon(
                  Icons.wb_sunny,
                  color: Colors.white,
                ),
                SizedBox(height: 7),
                Icon(
                  Icons.wb_sunny_outlined,
                  color: Colors.white,
                ),
                SizedBox(height: 7),
                Icon(
                  Icons.nights_stay_outlined,
                  color: Colors.white,
                ),
                SizedBox(height: 5),
                Icon(
                  Icons.nightlight,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildHeatmap() {
    List<Widget> rows = [];

    // Create the top row with days of the month
    List<Widget> daysRow = [
      const SizedBox(width: 48)
    ]; // Placeholder for the prayer names column
    for (int day = 1; day <= prayerData.length; day++) {
      daysRow.add(Container(
        width: 20,
        height: 20,
        margin: const EdgeInsets.all(4.0),
        child: Center(
            child: Text(
              '$day',
              style: const TextStyle(color: Colors.white30),
            )),
      ));
    }
    rows.add(Row(children: daysRow));

    // Create the rest of the rows for each prayer
    List<String> prayerNames = ["Fajr", "Dhuhr", "Asr", "Maghrib", "Isha"];
    for (int i = 0; i < 5; i++) {
      List<Widget> prayerRow = [
        Container(
          width: 40,
          height: 22,
          margin: const EdgeInsets.all(4.0),
          child: Center(
              child: Text(
                prayerNames[i],
                style: const TextStyle(color: Colors.white60),
              )),
        )
      ];

      prayerData.forEach((day, prayers) {
        prayerRow.add(
          GestureDetector(
            onTap: () {
              setState(() {
                prayers[i] = !prayers[i];
              });
            },
            child: Container(
              decoration: BoxDecoration(
                color: prayers[i] ? Colors.green : prayerCoLor3,
                borderRadius: BorderRadius.circular(3),
              ),
              width: 20,
              height: 20,
              margin: const EdgeInsets.all(4.0),
            ),
          ),
        );
      });

      rows.add(Row(children: prayerRow));
    }

    return rows;
  }
}
