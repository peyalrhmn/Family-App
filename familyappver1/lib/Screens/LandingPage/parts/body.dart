import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFfdc7aa),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.fromLTRB(20.0, 70.0, 20.0, 0.0),
            margin: const EdgeInsets.all(10.0),
            child: ShaderMask(
              blendMode: BlendMode.srcIn,
              shaderCallback: (rect) => const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.red, Colors.deepOrangeAccent],
              ).createShader(rect),
              child: Text('FamilyApp',
              style: TextStyle(
              fontFamily: 'Libre Baskerville',
              fontWeight: FontWeight.bold,
              fontSize: 55.0,
              foreground: Paint()
                  ..style = PaintingStyle.fill
                  ..color = Colors.black
                  ..strokeWidth = 3.0
            ),
            ),
          ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 10.0),
            margin: const EdgeInsets.all(10.0),
            child: Image.asset('assets/images/welcomeimage.png'),
          ),
        ],
      ),
    );
  }
}


