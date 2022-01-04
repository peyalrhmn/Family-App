import 'package:familyappver1/Authentication/authentication_services.dart';
import 'package:familyappver1/Screens/LandingPage/parts/body.dart';
import 'package:familyappver1/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:familyappver1/Screens/SignUpPage/mainsignuppage.dart';
import 'package:familyappver1/Screens/MiscFiles/resetpassword.dart';
import 'package:familyappver1/Screens/WelcomePage/mainwelcomepage.dart';
import 'package:familyappver1/Screens/LandingPage/main.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class Body extends StatefulWidget{
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<Body> {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController emailController= TextEditingController();
  TextEditingController passController= TextEditingController();

  String _email = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFfcf5ed),
      body: Container(
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.fromLTRB(20.0, 70.0, 20.0, 0.0),
              child: Text("Sign In",
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
              padding: const EdgeInsets.fromLTRB(50.0, 20.0, 50.0, 0.0),
              child: Column(
                children: <Widget>[
                TextFormField(
                // onChanged: (val) {
                //   setState(() {
                //     _email = val;
                //   });
                // },
                  controller: emailController,
                  decoration: const InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.normal,
                    fontSize: 15.0,
                    color: Colors.grey,
                    ),
                  ),
                ),
                TextFormField(
                  // onChanged: (val) {
                  //   setState(() {
                  //     _password = val;
                  //   });
                  // },
                  controller: passController,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.normal,
                      fontSize: 15.0,
                      color: Colors.grey,
                    ),
                  ),
                  obscureText: true,
                ),

                Container(
                  alignment: const Alignment(1.0, 0.0),
                  padding: const EdgeInsets.only(top: 15.0, left: 20.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return ResetPasswordMainFunc();
                          },
                        ),
                      );
                    },
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(
                          color: Colors.deepOrange,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                  height: 70.0,
                  child: Material(
                    borderRadius: BorderRadius.circular(20.0),
                    shadowColor: Colors.deepOrangeAccent,
                    color: Colors.deepOrangeAccent[200],
                    elevation: 5.0,
                    child: GestureDetector(
                      onTap: () {
                        FocusScope.of(context).unfocus(); // to hide keybaord and make change screen a bit fast
                        try {
                          context.read<AuthenticationService>().signIn(
                              email: emailController.text, password: passController.text);
                          Navigator.pushReplacement(
                              context, MaterialPageRoute(builder: (_) => MyApp()));
                        }on Exception catch(ex) {
                          print("Error!");
                          Fluttertoast.showToast(msg: ex.toString());
                        }
                        },
                      child: const Center(
                        child: Text(
                          'Login!',
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
                  'New to FamilyApp?',
                  style: TextStyle(fontFamily: 'Roboto'),
                  ),
                  const SizedBox(width: 5.0),
                  InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return WelcomeSignUpPage();
                        },
                      ),
                    );
                  },
                    child: const Text(
                    'Register',
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
            ), //sign in text
            Container(
              padding: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 0.0),
              margin: const EdgeInsets.all(10.0),
              child: Image.asset('assets/images/signinpic.png'),
            ), //buttons
          ],
        ),
      ),
    );
  }
}