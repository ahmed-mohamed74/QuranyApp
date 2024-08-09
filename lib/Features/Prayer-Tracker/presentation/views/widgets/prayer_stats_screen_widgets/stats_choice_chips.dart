
import 'package:flutter/material.dart';

import '../../../constants.dart';

class StatsChoiceChips extends StatefulWidget {
  const StatsChoiceChips({super.key});

  @override
  State<StatsChoiceChips> createState() => _StatsChoiceChipsState();
}

class _StatsChoiceChipsState extends State<StatsChoiceChips> {
  int _selectedTimeFrame = 0;
  final List<String> _timeFrames = ["Weeks", "Months", "Years", "All time"];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 0.0,
      children: [
        ChoiceChip(
          shape: const RoundedRectangleBorder(
            side: BorderSide.none,
            borderRadius: BorderRadius.horizontal(
                left: Radius.circular(10)),
          ),
          backgroundColor: _selectedTimeFrame == 0
              ? Colors.grey
              : prayerCoLor1,
          selectedColor: prayerCoLor1.withOpacity(0.7),
          label: Text(
            _timeFrames[0],
            style: const TextStyle(color: Colors.white),
          ),
          selected: _selectedTimeFrame == 0,
          showCheckmark: false,
          onSelected: (bool selected) {
            setState(() {
              _selectedTimeFrame = 0;
            });
          },
          elevation: 0,
        ),
        ChoiceChip(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
          backgroundColor: _selectedTimeFrame == 1
              ? Colors.grey
              : prayerCoLor1,
          selectedColor: prayerCoLor1.withOpacity(0.7),
          label: Text(
            _timeFrames[1],
            style: const TextStyle(color: Colors.white),
          ),
          selected: _selectedTimeFrame == 1,
          showCheckmark: false,
          onSelected: (bool selected) {
            setState(() {
              _selectedTimeFrame = 1;
            });
          },
        ),
        ChoiceChip(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
          backgroundColor: _selectedTimeFrame == 2
              ? Colors.grey
              : prayerCoLor1,
          selectedColor: prayerCoLor1.withOpacity(0.7),
          label: Text(
            _timeFrames[2],
            style: const TextStyle(color: Colors.white),
          ),
          selected: _selectedTimeFrame == 2,
          showCheckmark: false,
          onSelected: (bool selected) {
            setState(() {
              _selectedTimeFrame = 2;
            });
          },
        ),
        ChoiceChip(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.horizontal(
                right: Radius.circular(10)),
          ),
          backgroundColor: _selectedTimeFrame == 3
              ? Colors.grey
              : prayerCoLor1,
          selectedColor: prayerCoLor1.withOpacity(0.7),
          label: Text(
            _timeFrames[3],
            style: const TextStyle(color: Colors.white),
          ),
          selected: _selectedTimeFrame == 3,
          showCheckmark: false,
          onSelected: (bool selected) {
            setState(() {
              _selectedTimeFrame = 3;
            });
          },
        ),
      ],
    );
  }
}
