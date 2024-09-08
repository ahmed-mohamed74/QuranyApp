import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jhijri/jHijri.dart';
import 'package:qurany_analytics_app/models/day_prayers_state.dart';
import 'package:qurany_analytics_app/view_models/prayer_cubit.dart';

import '../../../constants.dart';

class PrayerPageHeaderSection extends StatelessWidget {
  PrayerPageHeaderSection({
    super.key,
  });

  var hijriCalendar = HijriDate.dateToHijri(DateTime.now());

  String getHijriFormattedDate() {
    /*setState(() {
      hijriCalendar = HijriDate.dateToHijri(DateTime.now());
      print('header hijri: $hijriCalendar');
    });*/
    String hijriDate =
        '${hijriCalendar.year} ${hijriCalendar.day} ${hijriCalendar.monthName}';

    return hijriDate;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          color: prayerCoLor1,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 5),
              Text(
                getHijriFormattedDate(),
                style: const TextStyle(fontSize: 15, color: Colors.white70),
              ),
              EasyDateTimeLine(
                initialDate: DateTime.now(),
                onDateChange: (DateTime dateTime) {
                  context.read<PrayerCubit>().onDayChanged(dateTime);
                },
                activeColor: Colors.blue,
                headerProps: const EasyHeaderProps(
                  dateFormatter: DateFormatter.custom('d MMMM'),
                  selectedDateStyle:
                      TextStyle(fontSize: 20, color: Colors.white),
                  centerHeader: true,
                  showMonthPicker: false,
                  showHeader: true,
                ),
                dayProps: const EasyDayProps(
                    height: 60.0,
                    width: 50.0,
                    dayStructure: DayStructure.dayStrDayNum,
                    inactiveDayStyle: DayStyle(
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.zero),
                      //borderRadius: 20.0,
                      dayNumStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                    activeDayStyle: DayStyle(
                      dayStrStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 12.0,
                      ),
                      dayNumStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    todayStyle: DayStyle(
                      dayNumStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
              ),
            ],
          ),
        ));
  }
}
