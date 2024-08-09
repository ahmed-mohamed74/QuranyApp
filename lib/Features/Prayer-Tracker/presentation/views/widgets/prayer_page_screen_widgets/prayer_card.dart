import 'package:flutter/material.dart';

import '../../../constants.dart';

class PrayerCard extends StatelessWidget {
  final IconData icon;
  final bool isSelected;
  final String prayerName;

  const PrayerCard(this.icon, this.isSelected,
      {super.key, required this.prayerName});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) => Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: prayerCoLor2,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.close,
                          size: 30,
                          color: Colors.blue,
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              Colors.grey.withOpacity(0.05)),
                        ),
                      ),
                      const SizedBox(width: 100),
                      Icon(
                        icon,
                        color: Colors.blue,
                        size: 55,
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'How did you pray $prayerName today?',
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: Card(
                        color: prayerCoLor2,
                        shape: RoundedRectangleBorder(
                            side:
                                BorderSide(color: Colors.grey.withOpacity(0.2)),
                            borderRadius: BorderRadius.circular(25)),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10),
                            BottomSheetPrayerState(
                                prayerStateName: 'Not prayed'),
                            Divider(thickness: 0.1),
                            BottomSheetPrayerState(
                                prayerStateName: 'Prayed late'),
                            Divider(thickness: 0.1),
                            BottomSheetPrayerState(
                                prayerStateName: 'Prayed on time'),
                            Divider(thickness: 0.1),
                            BottomSheetPrayerState(
                                prayerStateName: 'Prayed in jamaah'),
                            SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              prayerCoLor1,
              isSelected ? Colors.greenAccent : prayerCoLor3,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: const [0.7, 0.3], // Ensures half and half effect
          ),
          //color: prayerCoLor1,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.blue, size: 30),
            const SizedBox(width: 20),
            Text(
              prayerName,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomSheetPrayerState extends StatelessWidget {
  const BottomSheetPrayerState({
    super.key,
    required this.prayerStateName,
  });

  final String prayerStateName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: TextButton(
        onPressed: () {},
        child: Text(
          prayerStateName,
          style: const TextStyle(color: Colors.white, fontSize: 17),
        ),
      ),
    );
  }
}
