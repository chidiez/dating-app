import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

/*
class UserGpsLocation extends StatefulWidget {
  const UserGpsLocation({Key? key}) : super(key: key);

  @override
  State<UserGpsLocation> createState() => _UserGpsLocationState();
}

class _UserGpsLocationState extends State<UserGpsLocation> {
  String currentLocation = 'Current Location';
  late Position currentPosition;

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Fluttertoast.showToast(msg: 'Please turn on your location.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied){
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied){
        Fluttertoast.showToast(msg: 'Location blocked.');
      }
    }
    if (permission == LocationPermission.deniedForever){
      Fluttertoast.showToast(msg: 'Location blocked permanently');
    }
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high
    );
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
          position.latitude, position.longitude
      );
      Placemark place = placemarks[0];
      setState(() {
        currentPosition = position;
        currentLocation = "${place.locality}, ${place.country}";
      });
    } catch(e) {
      print (e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Text(
            currentLocation,
            style: const TextStyle(
              fontSize: 14,
              height: 1.5,
              color: Colors.black,
          ),),
          TextButton(
              onPressed: _determinePosition,
              child: const Text('RELOAD',
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 16),
              ),
          ),
        ],
      ),
    );
  }
}
*/
