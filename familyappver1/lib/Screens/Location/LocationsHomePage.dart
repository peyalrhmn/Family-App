import 'dart:async';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:familyappver1/models/MembersLocation.dart';
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
  List<String> famMembersId=[];
  List<MembersLocation> obj1=[];
  String famId='';
  Set<Marker> _marker = {};
  LatLng iniLoc = LatLng(23.81073042801505, 90.41245052789114);
  Location _locationTracker = Location();
  late BitmapDescriptor myMarker;
  late GoogleMapController _controller;
  String? name1, name2;
  Timestamp? time1, time2;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!
        .addPostFrameCallback((_) => showDialogAlert(context));
    setCustomMarker();
    updateLocation();
    getFamilyId();
  }

  void setCustomMarker() async {
    myMarker = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(), 'assets/images/human_logo.png');
  }

  @override
  Widget build(BuildContext context) {
    CameraPosition initialCameraPosition = CameraPosition(
      target: iniLoc,
      zoom: 12.14,
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
                  label: name1.toString(),
                  onTap: (){
                    getMemberOneLocation();
                  }
              ),
              SpeedDialChild(
                  child: Icon(Icons.account_circle_rounded),
                  label: name2.toString(),
                  onTap: (){
                    getMemberTwoLocation();
                  }
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
          infoWindow: InfoWindow(
            title: 'Me',
            snippet: 'Last Online: Now'
          )
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

  Future<void> getFamilyId() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    final uid = user!.uid;
    String famiId='';
    try{
        famiId= await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .get()
          .then((value) {
          return value.data()!['FamilyId'];
      });
    } catch (e) {
      print(e);
    }
    setState(()=> famId=famiId );
    print('fAMILY id:');
    print(famId);
    getFamilyMembersId();
  }

  Future<void> getFamilyMembersId() async {
    try{
      await FirebaseFirestore.instance
          .collection('families')
          .doc(famId)
          .get()
          .then((value){
          setState(() {
            famMembersId=List.from(value.data()!['members']);
          });
      });
    }catch (e){
      print(e);
    }
    print('fAMILY MEMBERS:');
    print(famMembersId);
    setState(() async {
      name1 = await FirebaseFirestore.instance
          .collection('users')
          .doc(famMembersId[0])
          .get()
          .then((value) {
            return value.data()!['Full Name'];
      });
      name2 = await FirebaseFirestore.instance
          .collection('users')
          .doc(famMembersId[1])
          .get()
          .then((value) {
        return value.data()!['Full Name'];
      });
      time1 = await FirebaseFirestore.instance
          .collection('users')
          .doc(famMembersId[0])
          .get()
          .then((value) {
        return value.data()!['Last_Active_Time'];
      });
      time2 = await FirebaseFirestore.instance
          .collection('users')
          .doc(famMembersId[1])
          .get()
          .then((value) {
        return value.data()!['Last_Active_Time'];
      });
    });
  }

  // Future<void> getMembersLocation() async {
  //   // List<MembersLocation> obj=[];
  //   double? lat;
  //   try{
  //     for(int i=0;i<famMembersId.length;i++) {
  //       await FirebaseFirestore.instance
  //           .collection('users')
  //           .doc(famMembersId[i])
  //           .get()
  //           .then((value) {
  //             // obj[i].fName= value.data()!['Full Name'];
  //             // obj[i].lat= value.data()!['Latitude'];
  //             // obj[i].long= value.data()!['Longitude'];
  //             lat=value.data()!['Latitude'];
  //       });
  //     }
  //   }catch (e){
  //     print(e);
  //   }
  //   print('Are u READY:');
  //   print(lat);
  //   // setState(()=>obj1=obj);
  //   // print('I am here:');
  //   // print(obj[0].fName);
  // }  // useless function wanted to store location in a model class didnt work!

  void getMemberOneLocation() async {
    var currentTime= DateTime.now();
    DateTime timeOne=time1!.toDate();
    var diff1=currentTime.difference(timeOne).inHours;
    double? lat;
    double? long;
    try{
      await FirebaseFirestore.instance
          .collection('users')
          .doc(famMembersId[0])
          .get()
          .then((value) {
        lat=value.data()!['Latitude'];
        long=value.data()!['Longitude'];
      });
    } catch(e){
      print(e);
    }
    _controller.animateCamera(CameraUpdate.newCameraPosition(new CameraPosition(
      bearing: 30,
      target: LatLng(lat!, long!),
      zoom: 16,
    )));
    setState(() {
      _marker.add(
        Marker(
          icon: myMarker,
          markerId: MarkerId('id-2'),
          position: LatLng(lat!, long!),
            infoWindow: InfoWindow(
                title: name1.toString(),
                snippet: 'Last Online: '+diff1.toString()+'H ago'
            )
        ),
      );
    });
  }

  void getMemberTwoLocation() async {
    var currentTime= DateTime.now();
    DateTime timeTwo=time2!.toDate();
    var diff2=currentTime.difference(timeTwo).inHours;
    double? lat;
    double? long;
    try{
      await FirebaseFirestore.instance
          .collection('users')
          .doc(famMembersId[1])
          .get()
          .then((value) {
        lat=value.data()!['Latitude'];
        long=value.data()!['Longitude'];
      });
    } catch(e){
      print(e);
    }
    _controller.animateCamera(CameraUpdate.newCameraPosition(new CameraPosition(
      bearing: 30,
      target: LatLng(lat!, long!),
      zoom: 16,
    )));
    setState(() {
      _marker.add(
        Marker(
          icon: myMarker,
          markerId: MarkerId('id-3'),
          position: LatLng(lat!, long!),
            infoWindow: InfoWindow(
                title: name2.toString(),
                snippet: 'Last Online: '+diff2.toString()+'H ago',
            )
        ),
      );
    });
  }

  showDialogAlert(BuildContext context) {
    return showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text("Allow access to device's location"),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                elevation: 3.0,
                color: Colors.blue,
                child: Text('OK'),
                onPressed: ()=>someStupidFunction(),
              ),
            ],
          )
        ],
      );
    });
  }

  someStupidFunction() {
    getCurrentLocation();
    //Navigator.pop(context); for some reason causes the locations screen to clsoe!
    Navigator.of(context, rootNavigator: true).pop('dialog');
  }
}

