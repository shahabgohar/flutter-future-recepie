import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  String myPosition = '';
  LocationPermission? locationPermission;

  @override
  void initState() {
    // print('init state');
    // print(getPosition.runtimeType);
    // getPosition().then((Position? position) {
    //   myPosition =
    //       'latitude: ${position?.latitude.toString()} longitude: ${position?.longitude.toString()}';
    //   print(myPosition);
    //   setState(() {});
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Current Location !'),
      ),
      body: Center(
        child: FutureBuilder(
          future: this.getTimedPosition(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.connectionState == ConnectionState.done) {
              return Text(snapshot.data.toString());
            } else {
              return Text('');
            }
          },
        ),
      ),
    );
  }

  Future<LocationPermission?> checkForPermission() async {
    this.locationPermission = await Geolocator.checkPermission();
    if (this.locationPermission == LocationPermission.denied) {
      this.locationPermission = await Geolocator.requestPermission();
      if (this.locationPermission == LocationPermission.denied) {
        return this.locationPermission;
      }
    }
    return this.locationPermission;
  }

  Future<Position?> getPosition() async {
    return this.checkForPermission().then((LocationPermission? permission) {
      if (permission! != LocationPermission.denied) {
        return Geolocator.getCurrentPosition();
      }
      return null;
    });
  }

  Future getTimedPosition() async {
    await Future.delayed(Duration(seconds: 3));
    return this.checkForPermission().then((LocationPermission? permission) {
      if (permission! != LocationPermission.denied) {
        return Geolocator.getCurrentPosition();
      }
      return null;
    });
  }
}
