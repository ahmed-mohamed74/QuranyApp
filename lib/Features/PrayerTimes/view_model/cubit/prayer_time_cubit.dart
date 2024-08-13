import 'package:adhan/adhan.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

import '../../service/loaction_service.dart';
part 'prayer_time_state.dart';

class PrayerTimeCubit extends Cubit<PrayerTimeState> {
  PrayerTimeCubit() : super(PrayerTimeInitial());
  final LocationService _locationService = LocationService();

  void loadPrayerTimes(double latitude, double longitude) {
    final coordinates = Coordinates(latitude, longitude);
    final params = CalculationMethod.muslim_world_league.getParameters();
    params.madhab = Madhab.hanafi;

    // Calculate prayer times
    final prayerTimes = PrayerTimes.today(coordinates, params);

    // Emit the prayer times state
    emit(PrayerTimeLoaded(
      fajr: prayerTimes.fajr,
      dhuhr: prayerTimes.dhuhr,
      asr: prayerTimes.asr,
      maghrib: prayerTimes.maghrib,
      isha: prayerTimes.isha,
    ));
  }

  Future<void> fetchLocationAndLoadPrayerTimes() async {
    Position? position = await _locationService.fetchLocation();

    if (position != null) {
      loadPrayerTimes(position.latitude, position.altitude);
    } else {
      // Handle the case where the location is null, e.g., show an error message
    }
  }
}
