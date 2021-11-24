import 'package:flutter/material.dart';
import 'package:familyappver1/constants.dart';
import 'package:familyappver1/Screens/SignInPage/mainsigninpage.dart';
import 'package:familyappver1/Screens/SignUpPage/mainsignuppage.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFfec1c8),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
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
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.normal,
                      fontSize: 15.0,
                      color: Colors.black54,
                    ),
                  ),
                ),
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Confirm Email',
                    labelStyle: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.normal,
                      fontSize: 15.0,
                      color: Colors.black54,
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
                      color: Colors.black54,
                    ),
                  ),
                  obscureText: true,
                ),
                const TextField(
                  decoration: InputDecoration(
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
                      onTap: () {},
                      child: const Center(
                        child: Text(
                          'Join the Team!',
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
    );
  }
}