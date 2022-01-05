import 'package:familyappver1/Screens/MyProfilePage/parts/seeinfo.dart';
import 'package:flutter/material.dart';


import 'package:familyappver1/Authentication/authentication_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:familyappver1/widgets/shadowContainer.dart';



class PageBody extends StatefulWidget{
  @override
  BodyMain createState() => BodyMain();
}



class BodyMain extends State<PageBody> {

  final FirebaseAuth auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  var _FirstNameController = TextEditingController();


  String _FirstName = '';
  String _MiddleName = '';
  String _LastName = '';
  String _Email = '';
  String _PhoneNumber = '';
  String _Address = '';
  String _BloodGroup = '';

  String _BirthCertificateNumber = '';
  String _PassportNumber = '';
  String _NationalIdentityNumber = '';

  String _SecurityQuestionAnswer = '';
  String _NotableFeature = '';
  String _PhysicalComplications = '';

  String _PriorityContactNumber = '';
  String _PriorityContactEmail = '';
  String _PriorityContactName = '';
  String _PriorityContactRelation = '';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffeccc1),
      body: Container(
        child: ListView(
          children: <Widget>[

            Container(
              padding: const EdgeInsets.fromLTRB(10.0, 50.0, 10.0, 0.0),
              alignment: Alignment.topCenter,
              child: ShaderMask(
                blendMode: BlendMode.srcIn,
                shaderCallback: (rect) =>
                    const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Colors.deepPurple, Colors.purpleAccent],
                    ).createShader(rect),
                child: Text('Change MyProfile Credentials',
                  style: TextStyle(
                      fontFamily: 'Roboto Regular',
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                      foreground: Paint()
                        ..style = PaintingStyle.fill
                        ..color = Colors.black
                        ..strokeWidth = 3.0
                  ),
                ),
              ),
            ),  // background and extras

            Container(
              padding: const EdgeInsets.fromLTRB(10.0, 50.0, 10.0, 0.0),
              margin: const EdgeInsets.all(10.0),
              alignment: Alignment.center,
              child:  Text('- Essentials -',
                style: TextStyle(
                    fontFamily: 'Libre Baskerville',
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                    foreground: Paint()
                      ..style = PaintingStyle.fill
                      ..color = Colors.black
                      ..strokeWidth = 3.0
                ),
              ),
            ),  // header for essentials

            Container(
              padding: const EdgeInsets.fromLTRB(50.0, 5.0, 50.0, 0.0),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    onChanged: (val) {
                      setState(() {
                        _FirstName = val;
                      });
                    },
                    controller: _FirstNameController,
                    decoration: const InputDecoration(labelText: "Change your first name"),
                    validator: (value){
                      if(value!.isEmpty){
                        return "Please enter correct name";}
                      else{ return null;
                      }
                    },
                  ),
                  TextFormField(
                    onChanged: (val) {
                      setState(() {
                        _MiddleName = val;
                      });
                    },
                    decoration: const InputDecoration(labelText: "Change your middle name"
                  ),
                  ),
                  TextFormField(
                    onChanged: (val) {
                      setState(() {
                        _LastName = val;
                      });
                    },
                    decoration: const InputDecoration(labelText: "Change your last name"
                  ),
                    validator: (value){
                      if(value!.isEmpty){
                        return "Please enter correct name";
                      }
                      else{ return null;
                      }
                    },
                  ),
                  TextFormField(
                    onChanged: (val) {
                      setState(() {
                        _PhoneNumber = val;
                      });
                    },
                    decoration: const InputDecoration(labelText: "Change your phone number"
                    ),
                    validator: (value){
                      if(value!.isEmpty){
                        return "Please enter correct phone number";
                      }
                      else{ return null;
                      }
                    },
                  ),
                  TextFormField(
                    onChanged: (val) {
                      setState(() {
                        _Email = val;
                      });
                    },
                    decoration: const InputDecoration(labelText: "Change your email"
                     ),
                    validator: (value){
                      if(value!.isEmpty){
                        return "Please enter correct email";
                      }
                      else{ return null;
                      }
                    },
                  ),
                  TextFormField(
                    onChanged: (val) {
                      setState(() {
                        _Address = val;
                      });
                    },
                    decoration: const InputDecoration(labelText: "Change your address"
                  ),
                    validator: (value){
                      if(value!.isEmpty){
                        return "Please enter correct address";
                      }
                      else{ return null;
                      }
                    },
                  ),
                  TextFormField(
                    onChanged: (val) {
                      setState(() {
                        _BloodGroup = val;
                      });
                    },
                    decoration: const InputDecoration(labelText: "Change your blood group"
                  ),
                    validator: (value){
                      if(value!.isEmpty){
                        return "Please enter correct blood group";
                      }
                      else{ return null;
                      }
                    },
                  ),
                ],
              ),
            ),

            Container(
              padding: const EdgeInsets.fromLTRB(10.0, 50.0, 10.0, 0.0),
              margin: const EdgeInsets.all(10.0),
              alignment: Alignment.center,
              child:  Text('- Official Information -',
                style: TextStyle(
                    fontFamily: 'Libre Baskerville',
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                    foreground: Paint()
                      ..style = PaintingStyle.fill
                      ..color = Colors.black
                      ..strokeWidth = 3.0
                ),
              ),
            ),  // header for official info

            Container(
              padding: const EdgeInsets.fromLTRB(50.0, 5.0, 50.0, 0.0),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    onChanged: (val) {
                      setState(() {
                        _BirthCertificateNumber = val;
                      });
                    },
                    decoration: const InputDecoration(labelText: "Change your Birth Certificate Number"
                    ),
                  ),
                  TextFormField(
                    onChanged: (val) {
                      setState(() {
                        _PassportNumber = val;
                      });
                    },
                    decoration: const InputDecoration(labelText: "Change your Passport Number"
                  ),
                  ),
                  TextFormField(
                    onChanged: (val) {
                      setState(() {
                        _NationalIdentityNumber = val;
                      });
                    },
                    decoration: const InputDecoration(labelText: "Change your National Identity Number"
                  ),
                  ),
                ],
              ),
            ),

            Container(
              padding: const EdgeInsets.fromLTRB(10.0, 50.0, 10.0, 0.0),
              margin: const EdgeInsets.all(10.0),
              alignment: Alignment.center,
              child:  Text('- Priority Contact Setter -',
                style: TextStyle(
                    fontFamily: 'Libre Baskerville',
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                    foreground: Paint()
                      ..style = PaintingStyle.fill
                      ..color = Colors.black
                      ..strokeWidth = 3.0
                ),
              ),
            ),  // header for priority contact


            Container(
              padding: const EdgeInsets.fromLTRB(50.0, 5.0, 50.0, 0.0),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    onChanged: (val) {
                      setState(() {
                        _PriorityContactNumber = val;
                      });
                    },
                    decoration: const InputDecoration(labelText: "Change your PC's number"
                    ),
                  ),
                  TextFormField(
                    onChanged: (val) {
                      setState(() {
                          _PriorityContactEmail = val;
                      });
                    },
                    decoration: const InputDecoration(labelText: "Change your PC's name"
                  ),
                  ),
                  TextFormField(
                    onChanged: (val) {
                      setState(() {
                         _PriorityContactName = val;
                      });
                    },
                    decoration: const InputDecoration(labelText: "Change your PC's email"
                  ),
                  ),
                  TextFormField(
                    onChanged: (val) {
                      setState(() {
                        _PriorityContactRelation = val;
                      });
                    },
                    decoration: const InputDecoration(labelText: "Change your relationship status with PC"
                  ),
                  ),
                ],
              ),
            ),

            Container(
              padding: const EdgeInsets.fromLTRB(10.0, 50.0, 10.0, 0.0),
              margin: const EdgeInsets.all(10.0),
              alignment: Alignment.center,
              child:  Text('- Extra Notables -',
                style: TextStyle(
                    fontFamily: 'Libre Baskerville',
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                    foreground: Paint()
                      ..style = PaintingStyle.fill
                      ..color = Colors.black
                      ..strokeWidth = 3.0
                ),
              ),
            ),  // header for extra notables

            Container(
              padding: const EdgeInsets.fromLTRB(50.0, 5.0, 50.0, 70.0),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    onChanged: (val) {
                      setState(() {
                        _SecurityQuestionAnswer = val;
                      });
                    },
                    decoration: const InputDecoration(labelText: "Change your Security Question's answer"
                    ),
                  ),
                  TextFormField(
                    onChanged: (val) {
                      setState(() {
                        _PhysicalComplications = val;
                      });
                    },
                    decoration: const InputDecoration(labelText: "Change your physical complications"
                  ),
                  ),
                  TextFormField(
                    onChanged: (val) {
                      setState(() {
                        _NotableFeature = val;
                      });
                    },
                    decoration: const InputDecoration(labelText: "Change your notable feature"
                  ),
                  ),
                ],
              ),
            ),

            ElevatedButton(
              onPressed: () async {

                  print('Console Message Using Print');

                  User? user = FirebaseAuth.instance.currentUser;
                  final uid = user!.uid;

                  print(uid);




                  await FirebaseFirestore.instance.collection("users").doc(uid).update({

                    '_FirstName': _FirstName,
                    '_MiddleName': _MiddleName,
                    '_LastName': _LastName,

                    '_Email': _Email,
                    '_Phone': _PhoneNumber,

                    'FamilyID': null,

                    '_BloodGroup': _BloodGroup,
                    '_Address': _Address,

                    '_BirthCertificateNumber': _BirthCertificateNumber,
                    '_PassportNumber': _PassportNumber,
                    '_NationalIdentityNumber': _NationalIdentityNumber,

                    '_SecurityQuestionAnswer': _SecurityQuestionAnswer,
                    '_NotableFeature': _NotableFeature,
                    '_PhysicalComplications': _PhysicalComplications,

                    '_PriorityContactNumber': _PriorityContactNumber,
                    '_PriorityContactEmail': _PriorityContactEmail,
                    '_PriorityContactName': _PriorityContactName,
                    '_PriorityContactRelation': _PriorityContactRelation,

                  });

                    Scaffold.of(context).showSnackBar(new SnackBar(content: new Text("User Modified"),));
                },
              child: const Text("Confirm Changes"),
            ),

            ElevatedButton(
              onPressed: () {
                    Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => Info()));

              },
              child: const Text("Cancel Modifications"),
            ),

          ],
        ),
      ),
    );
  }
}
