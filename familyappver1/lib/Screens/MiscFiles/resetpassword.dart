import 'package:flutter/material.dart';
import 'package:familyappver1/Screens/SignInPage/mainsigninpage.dart';
import 'package:familyappver1/Screens/SignUpPage/parts/body.dart';

class ResetPasswordMainFunc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResetPassBody(),
    );
  }
}

class ResetPassBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFffebd7),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.fromLTRB(20.0, 70.0, 20.0, 0.0),
            child: Text("Reset Your Password",
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
                    labelText: 'Phone Number',
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
                    labelText: "Guardian 1's Phone Number",
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
                    labelText: "New Password",
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
                    labelText: "Confirm New Password",
                    labelStyle: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.normal,
                      fontSize: 15.0,
                      color: Colors.grey,
                    ),
                  ),
                ),

                Container(
                  padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                  height: 70.0,
                  child: Material(
                    borderRadius: BorderRadius.circular(20.0),
                    shadowColor: Colors.deepOrangeAccent,
                    color: Colors.blueGrey[400],
                    elevation: 5.0,
                    child: GestureDetector(
                      onTap: () {},
                      child: const Center(
                        child: Text(
                          'Reset Password!',
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
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
            margin: const EdgeInsets.all(10.0),
            child: Image.asset('assets/images/resetpasspic.png'),
          ), //buttons
        ],
      ),
    );
  }
}