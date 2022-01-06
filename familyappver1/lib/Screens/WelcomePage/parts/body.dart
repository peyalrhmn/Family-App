import 'package:flutter/material.dart';
import 'package:familyappver1/constants.dart';
import 'package:familyappver1/Screens/SignInPage/mainsigninpage.dart';
import 'package:familyappver1/Screens/SignUpPage/mainsignuppage.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: const Color(0xFFfdc7aa),
      backgroundColor: const Color(0xFFfcf5ed),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.fromLTRB(20.0, 75.0, 20.0, 0.0),
            margin: const EdgeInsets.all(10.0),
            child: ShaderMask(
              blendMode: BlendMode.srcIn,
              shaderCallback: (rect) => const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.red, Colors.deepOrangeAccent],
              ).createShader(rect),
              child: Text('Family App',
              style: TextStyle(
              fontFamily: 'Libre Baskerville',
              fontWeight: FontWeight.bold,
              fontSize: 45.0,
              foreground: Paint()
                  ..style = PaintingStyle.fill
                  ..color = Colors.black
                  ..strokeWidth = 3.0
            ),
            ),
          ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 10.0),
            margin: const EdgeInsets.all(10.0),
            child: Image.asset('assets/images/welcomeimage2.png'),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 0.0),
            margin: const EdgeInsets.all(10.0),
            child: OutlinedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return WelcomeSignInPage();
                    },
                  ),
                );
              },
              child: const Text('Sign In'),
              style: OutlinedButton.styleFrom(
                minimumSize: const Size(220,70),
                  backgroundColor: Colors.white54,
                  primary: Colors.deepOrangeAccent[700],
                  side: const BorderSide(color: Colors.deepOrangeAccent),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)
                  )
              ),
            ),
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
                      return WelcomeSignUpPage();
                    },
                  ),
                );
              },
              child: const Text('Sign Up'),
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
    );
  }
}


