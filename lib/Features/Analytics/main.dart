import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:qurany_analytics_app/view_models/simple_bloc_observer.dart';

import 'constants.dart';
import 'models/day_prayers_state.dart';
import 'models/prayer_status_model_enum.dart';
import 'screens/prayer_page.dart';

void main() async {
  await Hive.initFlutter();
  Bloc.observer = SimpleBlocObserver();
  Hive.registerAdapter(PrayerStatusAdapter());
  Hive.registerAdapter(DayPrayerStateModelAdapter());
  await Hive.openBox<DayPrayerStateModel>(kDayPrayerStateBox);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const PrayerPage(),
    );
  }
}
