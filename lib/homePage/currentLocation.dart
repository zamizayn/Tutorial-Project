import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geocode/geocode.dart';
import 'package:geolocator/geolocator.dart';

class CurrentLocation extends StatefulWidget {
  const CurrentLocation({Key? key}) : super(key: key);

  @override
  _CurrentLocationState createState() => _CurrentLocationState();
}

class _CurrentLocationState extends State<CurrentLocation> {
  Position? position;
  Address? address;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 0), () async {
      await _determinePosition();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Current Location"),
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              children: [
                Text(
                  position == null
                      ? "Location will be shown here"
                      : "Coordinates are " +
                          position!.latitude.toString() +
                          "\n" +
                          position!.longitude.toString(),
                ),
                SizedBox(
                  height: 10,
                ),
                address != null
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Your address is " +
                            address!.streetAddress! +
                            " , " +
                            address!.countryName!),
                      )
                    : Text("")
              ],
            ),
          )),
    );
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    log("i have reached here");
    position = await Geolocator.getCurrentPosition();
    log("this is the location" + position!.latitude.toString());

    GeoCode geoCode = GeoCode();
    address = await geoCode.reverseGeocoding(
        latitude: position!.latitude, longitude: position!.longitude);

    setState(() {});
    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }
}