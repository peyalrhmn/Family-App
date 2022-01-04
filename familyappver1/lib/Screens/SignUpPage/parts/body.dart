import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:familyappver1/main.dart';
import 'package:flutter/material.dart';
import 'package:familyappver1/constants.dart';
import 'package:familyappver1/Screens/SignInPage/mainsigninpage.dart';
import 'package:familyappver1/Screens/SignUpPage/mainsignuppage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Body extends StatefulWidget{
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<Body> {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _email = '';
  String _password = '';
  String _fName='';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFfec1c8),
      body: Container(
        child: ListView(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.fromLTRB(20.0, 70.0, 20.0, 0.0),
              child: Text("Sign Up",
                style: TextStyle(
                    fontFamily: 'Libre Baskerville',
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                    foreground: Paint()
                      ..style = PaintingStyle.fill
                      ..color = Colors.black
                      ..strokeWidth = 3.0
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(50.0, 5.0, 50.0, 0.0),
              child: Column(
                children: <Widget>[
                   TextFormField(
                     onChanged: (val) {
                       setState(() {
                         _email = val;
                       });
                     },
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.normal,
                        fontSize: 15.0,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                   TextFormField(
                     onChanged: (val) {
                       setState(() {
                         _fName = val;
                       });
                     },
                    decoration: const InputDecoration(
                      labelText: 'Full Name',
                      labelStyle: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.normal,
                        fontSize: 15.0,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                   TextFormField(
                     onChanged: (val) {
                       setState(() {
                         _password = val;
                       });
                     },
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.normal,
                        fontSize: 15.0,
                        color: Colors.black54,
                      ),
                    ),
                    obscureText: true,
                  ),
                   TextFormField(
                    /* onChanged: (val) {
                       setState(() {
                         _password = val;
                       });
                     }, */
                    decoration: const InputDecoration(
                      labelText: 'Confirm Password',
                      labelStyle: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.normal,
                        fontSize: 15.0,
                        color: Colors.black54,
                      ),
                    ),
                    obscureText: true,
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                    height: 70.0,
                    child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      shadowColor: Colors.deepOrangeAccent,
                      color: Colors.redAccent[200],
                      elevation: 5.0,
                      child: GestureDetector(
                        onTap: () async {
                          FocusScope.of(context).unfocus();
                          try {
                            UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                                email: _email,
                                password: _password,
                            );
                            User? user = FirebaseAuth.instance.currentUser;

                            await FirebaseFirestore.instance.collection("users").doc(user!.uid).set({
                              'uid': user!.uid,
                              'Full Name': _fName,
                              'email': _email,
                              'password': _password,
                              'FamilyId': null,
                              'Latitude': null,
                              'Longitude': null,
                              'Last_Active_Time': null,
                            });
                            Fluttertoast.showToast(msg: "Account Created Successfully!");
                            Navigator.pushReplacement(
                                context, MaterialPageRoute(builder: (_) => MyApp()));
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'weak-password') {
                              print('The password provided is too weak.');
                              Fluttertoast.showToast(msg: "The password provided is too weak.");
                            } else if (e.code == 'email-already-in-use') {
                              print('The account already exists for that email.');
                              Fluttertoast.showToast(msg: "The account already exists for that email.");
                            }
                          } catch (e) {
                            print(e);
                            Fluttertoast.showToast(msg: e.toString());
                          }

                        },
                        child: const Center(
                          child: Text(
                            'Register Now',
                            style: TextStyle(
                              color: Colors.white70,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.bold,
                              fontSize: 17.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 25.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        'Already have an account?',
                        style: TextStyle(fontFamily: 'Roboto'),
                      ),
                      const SizedBox(width: 5.0),
                      InkWell(
                        onTap: () {
                              Navigator.push(
                              context,
                              MaterialPageRoute(
                              builder: (context) {
                              return WelcomeSignInPage();
                                    },
                                  ),
                                );
                              },
                        child: const Text(
                          'Sign In',
                          style: TextStyle(
                              color: Colors.deepOrange,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 0.0),
              margin: const EdgeInsets.all(10.0),
              child: Image.asset('assets/images/signupsmall.png'),
            ), //buttons
          ],
        ),
      ),
    );
  }
}