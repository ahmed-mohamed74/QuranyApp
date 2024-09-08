import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import '../constants.dart';
import '../models/day_prayers_state.dart';
import '../view_models/prayer_cubit.dart';
import 'widgets/prayer_stats_screen.dart';
import 'widgets/prayer_page_screen.dart';

class PrayerPage extends StatefulWidget {
  const PrayerPage({super.key});

  @override
  State<PrayerPage> createState() => _PrayerPageState();
}

class _PrayerPageState extends State<PrayerPage> {
  int currentIndex = 0;
  List<Widget> screens = [
    BlocProvider(
      create: (context) => PrayerCubit(),
      child: const PrayerPageScreen(),
    ),
    const PrayerStatsScreen()
  ];
  final EasyInfiniteDateTimelineController _controller =
      EasyInfiniteDateTimelineController();




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: prayerCoLor1,
      body: screens[currentIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: buildNavigationBarFloating(context),
    );
  }

  Container buildNavigationBarFloating(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      decoration: BoxDecoration(
          color: prayerCoLor1.withOpacity(0.5),
          borderRadius: const BorderRadius.all(Radius.circular(50))),
      child: Theme(
        data: Theme.of(context).copyWith(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          selectedIconTheme: const IconThemeData(color: Colors.blue),
          unselectedIconTheme: const IconThemeData(color: Colors.grey),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          backgroundColor: Colors.transparent,
          currentIndex: currentIndex,
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          elevation: 0,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.list,
                size: 35,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.bar_chart,
                size: 30,
              ),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
