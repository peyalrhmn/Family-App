import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:familyappver1/widgets/shadowContainer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class JoinGroup extends StatefulWidget {
  @override
  _JoinGroupState createState() => _JoinGroupState();
}

class _JoinGroupState extends State<JoinGroup> {
  var fId;
  final FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController _groupIdController = TextEditingController();
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
                    controller: _groupIdController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.group),
                      hintText: "Family Id",
                    ),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  RaisedButton(
                    color: Colors.blue,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 80),
                      child: Text(
                        "Join",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    onPressed: () async {
                      try {
                        FocusScope.of(context).unfocus();
                        final User? user = auth.currentUser;
                        final uid = user!.uid;
                        var famIdChecker= await FirebaseFirestore.instance.collection('users').doc(uid).get().then((value) {return value.data()!['FamilyId'];});
                        fId=famIdChecker;
                        if(famIdChecker==null) {
                          List<String> members = [];
                          members.add(uid);
                          await FirebaseFirestore.instance.collection(
                              "families")
                              .doc(_groupIdController.text)
                              .update(
                              {
                                'members': FieldValue.arrayUnion(members),
                              });
                          await FirebaseFirestore.instance.collection("users")
                              .doc(uid)
                              .update({
                            'FamilyId': _groupIdController.text,
                          });
                          Fluttertoast.showToast(
                              msg: "Family Joined Successfully");
                        }
                        else{
                          String name=await FirebaseFirestore.instance
                              .collection('families')
                              .doc(fId)
                              .get()
                              .then((value) {
                            return value.data()!['Name'];
                          });
                          Fluttertoast.showToast(msg: "You are already in a Family Group");
                          Fluttertoast.showToast(msg: "Group Name: "+name,
                              toastLength: Toast.LENGTH_LONG);
                        }
                      } catch (e) {
                        print(e);
                        Fluttertoast.showToast(msg: e.toString());
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