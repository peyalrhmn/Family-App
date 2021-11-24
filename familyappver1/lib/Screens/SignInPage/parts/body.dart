import 'package:flutter/material.dart';
import 'package:familyappver1/constants.dart';
import 'package:familyappver1/Screens/SignInPage/mainsigninpage.dart';
import 'package:familyappver1/Screens/SignUpPage/mainsignuppage.dart';
import 'package:familyappver1/Screens/MiscFiles/resetpassword.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFfcf5ed),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
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
              const TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.normal,
                  fontSize: 15.0,
                  color: Colors.grey,
                  ),
                ),
              ),
              const TextField(
                decoration: InputDecoration(
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
                    onTap: () {},
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
    );
  }
}