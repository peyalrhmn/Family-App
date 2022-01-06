import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';


class AlertBody extends StatefulWidget{
  @override
  AlertBodyMain createState() => AlertBodyMain();
}


class AlertBodyMain extends State<AlertBody>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      floatingActionButton: FabCircularMenu(
        alignment: Alignment.center,
        fabOpenColor: Colors.redAccent,
        fabCloseColor: Colors.red,
        ringColor: Colors.white70,
        ringDiameter: 350.0,
        ringWidth: 70.0,
        fabSize: 150.0,
        fabElevation: 8.0,
        fabOpenIcon: const Icon(Icons.notifications),
        children: [
          InkWell(
            child: const Icon(Icons.local_phone),
            onTap: () async {

              var Holder = "121212";

              final firebaseUser = await FirebaseAuth.instance.currentUser!;
              await FirebaseFirestore.instance
                  .collection('users')
                  .doc(firebaseUser.uid)
                  .get()
                  .then((ds) {
                var PriCon = ds.data()!['_PriorityContactNumber'];
                Holder = PriCon;
                print(PriCon);
              }).catchError((e) {
                print(e);
              });

              FlutterPhoneDirectCaller.callNumber(Holder);
            }, //calling priority number
          ),

          InkWell(
            child: const Icon(Icons.add_moderator_outlined),
            onTap: () async {
              FlutterPhoneDirectCaller.callNumber("999");
            }, //calling 999
          ),

          InkWell(
            child: const Icon(Icons.announcement),
            onTap: ()

            async {
              var SMSHolder = "999"; var nameHolder = "";
              double LatHolder = 0.0; double LonHolder = 0.0;

              final firebaseUser = await FirebaseAuth.instance.currentUser!;
              await FirebaseFirestore.instance
                  .collection('users')
                  .doc(firebaseUser.uid)
                  .get()
                  .then((ds) {
                var PriCon = ds.data()!['_PriorityContactNumber'];
                var LastLat = ds.data()!['Latitude'];
                var LastLon = ds.data()!['Longitude'];
                var Name = ds.data()!['_FirstName'];
                SMSHolder = PriCon;
                LatHolder = LastLat;
                LonHolder = LastLon;
                nameHolder = Name;
              }).catchError((e) {
                print(e);
              });
              launch('sms:$SMSHolder?body='
                  'ALERT SYSTEM PRESSED'
                  ' | My name is $nameHolder. My last recorded latitude and longitude co-ordinates'
                  'were [$LatHolder] and [$LonHolder] respectively.');
            }, //message top priority contacts
          ),
        ],
      ),

      //background:

      backgroundColor: const Color(0xFF88ACEC),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.fromLTRB(10.0, 100.0, 10.0, 0.0),
            margin: const EdgeInsets.all(10.0),
            alignment: Alignment.topCenter,
            child: ShaderMask(
              blendMode: BlendMode.srcIn,
              shaderCallback: (rect) => const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.white, Colors.white70],
              ).createShader(rect),
              child: Text('ONE TAP ALERT',
                style: TextStyle(
                    fontFamily: 'Libre Baskerville',
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                    foreground: Paint()
                      ..style = PaintingStyle.fill
                      ..color = Colors.black
                      ..strokeWidth = 3.0
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}



