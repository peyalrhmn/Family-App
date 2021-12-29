import 'dart:async';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';


class Locations extends StatefulWidget{
  const Locations ({Key? key}) : super(key: key);
  @override
  _LocationsState createState() => _LocationsState();
}
class _LocationsState extends State<Locations> {
  Set<Marker> _marker = {};
  LatLng iniLoc = LatLng(23.815521706161224, 90.42551504825647);
  Location _locationTracker = Location();
  late BitmapDescriptor myMarker;
  late GoogleMapController _controller;

  @override
  void initState() {
    super.initState();
    setCustomMarker();
    updateLocation();
  }

  void setCustomMarker() async {
    myMarker = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(), 'assets/images/human_logo.png');
  }

  @override
  Widget build(BuildContext context) {
    CameraPosition initialCameraPosition = CameraPosition(
      target: iniLoc,
      zoom: 16,
      tilt: 0,
      bearing: 30,
    );

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            title: Text('Family Location: ')
        ),
        body: GoogleMap(
          zoomControlsEnabled: false,
          onMapCreated: (GoogleMapController controller) {
            _controller = controller;
          },
          mapType: MapType.normal,
          initialCameraPosition: initialCameraPosition,
          markers: _marker,
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(right: 10, bottom: 10),
          child: SpeedDial(
            icon: Icons.person_search,
            children: [
              SpeedDialChild(
                child: Icon(Icons.location_on),
                label: 'My Location',
                onTap: () {
                  getCurrentLocation();
                },
              ),
              SpeedDialChild(
                  child: Icon(Icons.account_circle_rounded),
                  label: 'Family Member #1 Location'
              ),
            ],
          ),
        ),
      ),
    );
  }

  void getCurrentLocation() async {
    var location = await _locationTracker.getLocation();
    double lat1 = location.latitude!;
    double long1 = location.longitude!;
    _controller.animateCamera(CameraUpdate.newCameraPosition(new CameraPosition(
      bearing: 30,
      target: LatLng(lat1, long1),
      zoom: 16,
    )));
    setState(() {
      _marker.add(
        Marker(
          icon: myMarker,
          markerId: MarkerId('id-1'),
          position: LatLng(lat1, long1),
        ),
      );
    });
  }

  Future<void> updateLocation() async {
    var location = await _locationTracker.getLocation();
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    final uid = user!.uid;
    await FirebaseFirestore.instance.collection("users").doc(uid).update({
      'Latitude': location.latitude,
      'Longitude': location.longitude,
    });
  }
}