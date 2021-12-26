import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:familyappver1/widgets/shadowContainer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateGroup extends StatefulWidget {
  @override
  _CreateGroupState createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  // void inputData() {
  //   final User? user = auth.currentUser;
  //   final uid = user!.uid;
  //   // here you write the codes to input the data into firestore
  // }
  TextEditingController _groupNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: <Widget>[BackButton()],
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ShadowContainer(
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: _groupNameController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.group),
                      hintText: "Family Name",
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  RaisedButton(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 80),
                      child: Text(
                        "Create",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    onPressed: () async {
                      try{
                        final User? user = auth.currentUser;
                        final uid = user!.uid;
                        List<String> members= [];
                        members.add(uid);
                        DocumentReference _docRef=await FirebaseFirestore.instance.collection("families").add({
                          'Name': _groupNameController.text,
                          'creator': uid,
                          'members': members,
                          'Created At': Timestamp.now(),
                        });
                         await FirebaseFirestore.instance.collection("users").doc(uid).update({
                           'FamilyId': _docRef.id,
                         });
                         Scaffold.of(context).showSnackBar(new SnackBar(content: new Text("Family Created"),));

                      } catch (e){
                        print(e);
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}