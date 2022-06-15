import 'package:flutter_location/core/instance.dart';
import 'package:geolocator/geolocator.dart';
import 'package:search_map_location/utils/google_search/latlng.dart';
import 'Drivers.dart';

class DummyUtil {
  static List<DriversInformations> returnClosest(
      LatLng? pickUpLoc, List<DriversInformations> driver) {
    final List<DriversInformations> value = [];

    if (pickUpLoc == null) return driver;

    for (var d in driver) {
      double distanceInMeters = Geolocator.distanceBetween(
          pickUpLoc.latitude,
          pickUpLoc.longitude,
          double.parse(d.location![0]),
          double.parse(d.location![1]));

      logger.d(distanceInMeters);

      if (distanceInMeters <= 1000000) value.add(d);
    }
    return value;
  }
}
