import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:familyappver1/widgets/shadowContainer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class CreateGroup extends StatefulWidget {
  @override
  _CreateGroupState createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
  var fId;
  final FirebaseAuth auth = FirebaseAuth.instance;
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
                    height: 40.0,
                  ),
                  RaisedButton(
                    color: Colors.blue,
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
                      FocusScope.of(context).unfocus();
                      try{
                        final User? user = auth.currentUser;
                        final uid = user!.uid;
                        var famIdChecker= await FirebaseFirestore.instance.collection('users').doc(uid).get().then((value) {return value.data()!['FamilyId'];});
                        fId=famIdChecker;
                        if(famIdChecker==null) {
                          List<String> members = [];
                          members.add(uid);
                          DocumentReference _docRef = await FirebaseFirestore
                              .instance.collection("families").add({
                            'Name': _groupNameController.text,
                            'creator': uid,
                            'members': members,
                            'Created At': Timestamp.now(),
                          });
                          await FirebaseFirestore.instance.collection("users")
                              .doc(uid)
                              .update({
                            'FamilyId': _docRef.id,
                          });
                          Fluttertoast.showToast(msg: "Family Group Created",);
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
                      } catch (e){
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