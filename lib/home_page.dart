import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:search_map_location/utils/google_search/geo_location.dart';
import 'package:search_map_location/utils/google_search/latlng.dart';
import 'package:search_map_location/utils/google_search/place.dart';
import 'package:search_map_location/widget/search_widget.dart';

import 'Drivers.dart';
import 'util.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var location;
  var logger = Logger();
  double? pickUpLat;
  double? pickUpLong;
  double? dropLat;
  double? dropLong;
  DatabaseReference snapshot1 = FirebaseDatabase.instance.ref('drivers');
  Stream<DatabaseEvent>? stream;
  LatLng? _pickUpLocation, _dropLocation;

  Future<void> _getLocation(Place place) async {
    try {
      print('object');
      Geolocation? geolocation = await place.geolocation;
      logger.d(geolocation);
      location = LatLng(
        latitude: geolocation!.coordinates.latitude,
        longitude: geolocation.coordinates.longitude,
      );

      print('printing long ${geolocation.coordinates.longitude}');
      print('printing lat ${geolocation.coordinates.latitude}');
      print('printing lat $location');
      logger.d(location);
    } catch (e) {
      print('printing error: ${e.toString()}');
    }
  }

  getUsers() async {
    stream = snapshot1.onValue;
    final snapshot = await FirebaseDatabase.instance.ref('drivers').get();
    final map = snapshot.value as Map<dynamic, dynamic>;

    stream!.listen((event) {
      // map.forEach((key, value) {
      // final user = snapshot1.onValue.toList();
      // list.add(user);
      // setState(() {});
      // });
    });
  }

  @override
  void initState() {
    getUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Padding(
          padding: const EdgeInsets.all(48.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SearchLocation(
                    apiKey: '',
                    language: 'en',
                    country: 'NG',
                    onSelected: (Place place) async {
                      final geo = await place.geolocation;
                      _pickUpLocation = geo?.coordinates;
                      setState(() {});
                      logger.d(_pickUpLocation?.latitude);
                      logger.d(_pickUpLocation?.longitude);
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SearchLocation(
                    apiKey: '',
                    language: 'en',
                    country: 'NG',
                    onSelected: (Place place) async {
                      final geo = await place.geolocation;
                      _dropLocation = geo?.coordinates;
                      setState(() {});
                      logger.d(_dropLocation?.latitude);
                      logger.d(_dropLocation?.longitude);
                    },
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(onPressed: () {}, child: const Text('SEND')),
                  const SizedBox(
                    height: 30,
                  ),
                  Text('pick up lat: ${_pickUpLocation?.latitude}'),
                  const SizedBox(
                    height: 30,
                  ),
                  Text('pick up long: ${_pickUpLocation?.latitude}'),
                  const SizedBox(
                    height: 30,
                  ),
                  Text('drop lat: ${_dropLocation?.latitude}'),
                  const SizedBox(
                    height: 30,
                  ),
                  Text('drop long: ${_dropLocation?.latitude}'),
                  const SizedBox(
                    height: 30,
                  ),
                  StreamBuilder(
                      stream: snapshot1.onValue,
                      builder: (_, AsyncSnapshot<DatabaseEvent> snap) {
                        if (snap.data == null || !snap.hasData) {
                          return Container();
                        }
                        final d = Map<dynamic, dynamic>.from(snap
                            .data!.snapshot.value! as Map<dynamic, dynamic>);

                        AvailableDrivers data =
                            AvailableDrivers.fromMap(map: d);

                        final value = DummyUtil.returnClosest(
                            _pickUpLocation, data.driversInformations!);

                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ...value
                                .map((driver) => Column(
                                      children: [
                                        Text(driver.name ?? ''),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(driver.location![0]),
                                        Text(driver.location![1]),
                                      ],
                                    ))
                                .toList()
                          ],
                        );
                      }),
                ],
              ),
            ), // This trailing comma makes auto-formatting nicer for build methods.
          ),
        ));
  }
}
