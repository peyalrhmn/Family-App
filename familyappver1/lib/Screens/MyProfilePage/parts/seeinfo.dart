import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:familyappver1/Screens/MyProfilePage/parts/profilelanding.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';



class Info extends StatefulWidget{
  @override
  InfoView createState() => InfoView();
}



class InfoView extends State<Info>{

  String myEmail = '';
  String _FirstName1 = '';
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

  String _FamID = '';






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffeccc1),
      body: Stack(
        children: <Widget>[
          FutureBuilder(
            future: _fetch(),
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return const Text("Loading data...Please wait");
              }
              return const Text("");
            },
          ),
          ListView(
            padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
            children: <Widget>[
              Container(
                padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
                margin: const EdgeInsets.all(10.0),
                child: Image.asset('assets/images/myprofile.png'),
              ),
              _infoCell(title: "My FamApp Profile", value: ""),

              const SizedBox(
                height: 20,
              ),
              _infoCell(title: "Email Account", value: myEmail),

              const SizedBox(
                height: 25,
              ),
              _infoCell(title: "First Name", value: _FirstName1),

              const SizedBox(
                height: 25,
              ),
              _infoCell(title: "Middle Name", value: _MiddleName),

              const SizedBox(
                height: 25,
              ),
              _infoCell(title: "Last Name", value: _LastName),

              const SizedBox(
                height: 25,
              ),
              _infoCell(title: "Phone Number", value: _PhoneNumber),

              const SizedBox(
                height: 25,
              ),
              _infoCell(title: "Address", value: _Address),

              const SizedBox(
                height: 25,
              ),
              _infoCell(title: "Blood Group", value: _BloodGroup),

              const SizedBox(
                height: 25,
              ),
              _infoCell(title: "Birth Certificate Number", value: _BirthCertificateNumber),

              const SizedBox(
                height: 25,
              ),
              _infoCell(title: "Passport Number", value: _PassportNumber),

              const SizedBox(
                height: 25,
              ),
              _infoCell(title: "National Identity Number", value: _NationalIdentityNumber),

              const SizedBox(
                height: 25,
              ),
              _infoCell(title: "Notable Feature", value: _NotableFeature),

              const SizedBox(
                height: 25,
              ),
              _infoCell(title: "Physical Complications", value: _PhysicalComplications),

              const SizedBox(
                height: 25,
              ),
              _infoCell(title: "Priority Contact Number", value: _PriorityContactNumber),

              const SizedBox(
                height: 25,
              ),
              _infoCell(title: "Priority Contact Email", value: _PriorityContactEmail),

              const SizedBox(
                height: 25,
              ),
              _infoCell(title: "Priority Contact Name", value: _PriorityContactName),
              const SizedBox(
                height: 25,
              ),
              _infoCell(title: "Family ID", value: _FamID),
              Container(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),

              ),
              Container(
                padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 30.0),
                margin: const EdgeInsets.all(10.0),
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return PageBody();
                        },
                      ),
                    );
                  },
                  child: const Text('Make Changes'),
                  style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.white54,
                      minimumSize: const Size(220,70),
                      primary: Colors.deepOrangeAccent[700],
                      side: const BorderSide(color: Colors.deepOrangeAccent),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)
                      )
                  ), // StyleFrom
                ),
              ),
            ],
          ),
        ],
      ),

    );
  }

  _fetch() async {
    final firebaseUser = await FirebaseAuth.instance.currentUser!;
    if (firebaseUser != null) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(firebaseUser.uid)
          .get()
          .then((ds) {

        setState(() {});


        myEmail = ds.data()!['email'];

        _FirstName1 = ds.data()!['_FirstName'];
        _MiddleName = ds.data()!['_MiddleName'];
        _LastName = ds.data()!['_LastName'];
        _PhoneNumber = ds.data()!['_Phone'];
        _Address = ds.data()!['_Address'];
        _BloodGroup = ds.data()!['_BloodGroup'];

        _BirthCertificateNumber = ds.data()!['_BirthCertificateNumber'];
        _PassportNumber = ds.data()!['_PassportNumber'];
        _NationalIdentityNumber = ds.data()!['_NationalIdentityNumber'];

        _NotableFeature = ds.data()!['_NotableFeature'];
        _PhysicalComplications = ds.data()!['_PhysicalComplications'];

        _PriorityContactNumber = ds.data()!['_PriorityContactNumber'];
        _PriorityContactEmail = ds.data()!['_PriorityContactEmail'];
        _PriorityContactName = ds.data()!['_PriorityContactName'];
        _PriorityContactRelation = ds.data()!['_PriorityContactRelation'];


        _FamID = ds.data()!['FamilyID'];


      }).catchError((e) {
        print(e);
      });
    }
  }

  Column _infoCell({String? title, String? value}){
    return Column(
      children: <Widget>[
        Text(
          title!,
          style: const TextStyle(
            fontFamily: 'Libre Baskerville',
            fontSize: 22.0,
            fontWeight: FontWeight.w300,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          value!,
          style: const TextStyle(
              fontFamily: 'Libre Baskerville',
              fontSize: 19.0,
              fontWeight: FontWeight.w100,
              color: Colors.blueGrey
          ),
        )
      ],
    );
  }
}