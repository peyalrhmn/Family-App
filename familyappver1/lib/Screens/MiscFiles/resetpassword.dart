import 'package:familyappver1/Screens/SignInPage/mainsigninpage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ResetPasswordMainFunc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResetPassBody(),
    );
  }
}

class ResetPassBody extends StatelessWidget {

  TextEditingController controller = TextEditingController();
  String email = '';

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
                TextFormField(
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

                SizedBox(
                  height: 50,
                ),

                ElevatedButton(
                  onPressed: () async  {
                    await FirebaseAuth.instance
                        .sendPasswordResetEmail(email: controller.text)
                        .then((value) =>{
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context)=>WelcomeSignInPage()))
                    });
                  },
                  child: Text("Reset Password",
                    style: TextStyle(
                      color: Colors.white70,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                      fontSize: 17.0,
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