import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qurany_analytics_app/models/day_prayers_state.dart';

import '../../../constants.dart';
import '../../../models/prayer_status_model_enum.dart';
import '../../../view_models/prayer_cubit.dart';

class PrayerCard extends StatefulWidget {
  final IconData icon;
  PrayerCardStateModel tempPrayerCardState;

  PrayerCard(
    this.icon, {
    super.key,
    required this.tempPrayerCardState,
  });

  @override
  State<PrayerCard> createState() => _PrayerCardState();
}

class _PrayerCardState extends State<PrayerCard> {
  @override
  Widget build(BuildContext context) {
    final prayerCubit = context.read<PrayerCubit>();
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
                        widget.icon,
                        color: Colors.blue,
                        size: 55,
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'How did you pray ${widget.tempPrayerCardState.prayerName.name} today?',
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 10),
                            BottomSheetPrayerStateButton(
                              onTab: () {
                                setState(() {
                                  widget.tempPrayerCardState.prayerStateValue =
                                      PrayerStatus.notPrayed;

                                  prayerCubit.updatePrayerState();

                                  Navigator.pop(context);
                                });
                              },
                              prayerStateName: 'Not prayed',
                            ),
                            const Divider(thickness: 0.1),
                            BottomSheetPrayerStateButton(
                                onTab: () {
                                  setState(() {
                                    widget.tempPrayerCardState
                                        .prayerStateValue = PrayerStatus.late;
                                    prayerCubit.updatePrayerState(
                                    );
                                    Navigator.pop(context);
                                  });
                                },
                                prayerStateName: 'Prayed late'),
                            const Divider(thickness: 0.1),
                            BottomSheetPrayerStateButton(
                                onTab: () {
                                  setState(() {
                                    widget.tempPrayerCardState
                                        .prayerStateValue = PrayerStatus.onTime;
                                    prayerCubit.updatePrayerState(
                                    );
                                    Navigator.pop(context);
                                  });
                                },
                                prayerStateName: 'Prayed on time'),
                            const Divider(thickness: 0.1),
                            BottomSheetPrayerStateButton(
                                onTab: () {
                                  setState(() {
                                    widget.tempPrayerCardState
                                            .prayerStateValue =
                                        PrayerStatus.onJamaah;
                                    prayerCubit.updatePrayerState(
                                    );
                                    Navigator.pop(context);
                                  });
                                },
                                prayerStateName: 'Prayed in jamaah'),
                            const SizedBox(height: 10),
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
              widget.tempPrayerCardState.prayerStateValue ==
                      PrayerStatus.notPrayed
                  ? Colors.black
                  : widget.tempPrayerCardState.prayerStateValue ==
                          PrayerStatus.late
                      ? Colors.redAccent
                      : widget.tempPrayerCardState.prayerStateValue ==
                              PrayerStatus.onTime
                          ? Colors.yellowAccent
                          : widget.tempPrayerCardState.prayerStateValue ==
                                  PrayerStatus.onJamaah
                              ? Colors.greenAccent
                              : prayerCoLor3,
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
            Icon(widget.icon, color: Colors.blue, size: 30),
            const SizedBox(width: 20),
            Text(
              widget.tempPrayerCardState.prayerName.name,
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

class BottomSheetPrayerStateButton extends StatelessWidget {
  const BottomSheetPrayerStateButton({
    super.key,
    required this.prayerStateName,
    required this.onTab,
  });

  final String prayerStateName;
  final VoidCallback onTab;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: InkWell(
        borderRadius: BorderRadius.circular(5),
        onTap: onTab,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
          child: Text(
            prayerStateName,
            style: const TextStyle(color: Colors.white, fontSize: 17),
          ),
        ),
      ),
    );
  }
}
