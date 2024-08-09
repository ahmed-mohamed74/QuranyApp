import 'package:flutter/material.dart';

import '../../../constants.dart';

class StatusSummarySection extends StatelessWidget {
  StatusSummarySection({
    super.key,
  });

  final List<StatCard> stats = [
    const StatCard(
      title: 'In Jamaah',
      percentage: '100%',
      times: '1 times',
      change: '-50% (-1 times)',
      changeColor: Colors.red,
      indicatorColor: Colors.green,
    ),
    const StatCard(
      title: 'On Time',
      percentage: '0%',
      times: '0 times',
      change: '+0% (+0 times)',
      changeColor: Colors.grey,
      indicatorColor: Colors.yellow,
    ),
    const StatCard(
      title: 'Late',
      percentage: '0%',
      times: '0 times',
      change: '+0% (+0 times)',
      changeColor: Colors.greenAccent,
      indicatorColor: Colors.yellow,
    ),
    const StatCard(
      title: 'Not prayed',
      percentage: '0%',
      times: '0 times',
      change: '+0% (+0 times)',
      changeColor: Colors.greenAccent,
      indicatorColor: Colors.yellow,
    ),
    // Add more StatCards as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'STATUS SUMMARY',
              style: TextStyle(color: Colors.white, letterSpacing: 0.5),
            ),
            Text(
              '4 August',
              style: TextStyle(color: Colors.white, letterSpacing: 0.5),
            ),
          ],
        ),
        SizedBox(
          height: 315,
          child: GridView.builder(
            padding: const EdgeInsets.all(10.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16.0,
              crossAxisSpacing: 16.0,
              childAspectRatio: 1.0, // Adjust the aspect ratio as needed
            ),
            itemCount: stats.length,
            itemBuilder: (context, index) {
              return stats[index];
            },
          ),
        )
      ],
    );
  }
}

class StatCard extends StatelessWidget {
  final String title;
  final String percentage;
  final String times;
  final String change;
  final Color changeColor;
  final Color indicatorColor;

  const StatCard({
    super.key,
    required this.title,
    required this.percentage,
    required this.times,
    required this.change,
    required this.changeColor,
    required this.indicatorColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: prayerCoLor1, // Dark background color
        borderRadius: BorderRadius.circular(15),
      ),
      //padding: const EdgeInsets.all(10.0),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text(
                  percentage,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.bold),
                ),
                //const SizedBox(height: 4),
                Text(
                  times,
                  style: const TextStyle(color: Colors.grey, fontSize: 14),
                ),
                //const SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.arrow_downward, color: changeColor, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      change,
                      style: TextStyle(color: changeColor, fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const StatusCardBar(top: 20, width: 40, color: Colors.greenAccent),
          const StatusCardBar(top: 40, width: 10, color: Colors.greenAccent),
          const StatusCardBar(top: 60, width: 10, color: Colors.greenAccent),
          const StatusCardBar(top: 80, width: 10, color: Colors.greenAccent),
          const StatusCardBar(top: 100, width: 10, color: Colors.greenAccent),
        ],
      ),
    );
  }
}

class StatusCardBar extends StatelessWidget {
  const StatusCardBar({
    super.key,
    required this.top,
    required this.width,
    required this.color,
  });

  final double top;
  final double width;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      right: 0,
      child: Container(
        decoration: BoxDecoration(
          borderRadius:
              const BorderRadius.horizontal(left: Radius.circular(10)),
          color: color,
        ),
        width: width,
        height: 10,
      ),
    );
  }
}
