// import 'package:flutter/material.dart';
//
// class Body extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFfdc7aa),
//       body: Column(
//         children: <Widget>[
//           Container(
//             padding: const EdgeInsets.fromLTRB(20.0, 70.0, 20.0, 0.0),
//             margin: const EdgeInsets.all(10.0),
//             child: ShaderMask(
//               blendMode: BlendMode.srcIn,
//               shaderCallback: (rect) => const LinearGradient(
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight,
//                 colors: [Colors.red, Colors.deepOrangeAccent],
//               ).createShader(rect),
//               child: Text('FamilyApp',
//               style: TextStyle(
//               fontFamily: 'Libre Baskerville',
//               fontWeight: FontWeight.bold,
//               fontSize: 55.0,
//               foreground: Paint()
//                   ..style = PaintingStyle.fill
//                   ..color = Colors.black
//                   ..strokeWidth = 3.0
//             ),
//             ),
//           ),
//           ),
//           Container(
//             padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 10.0),
//             margin: const EdgeInsets.all(10.0),
//             child: Image.asset('assets/images/welcomeimage.png'),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:familyappver1/Authentication/authentication_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatelessWidget{
  Widget textbuild()=> RichText(text:
  TextSpan(
      children: [
        TextSpan(
            text: 'This screen is under construction',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 30,
            )
        )
      ]
  )
  );

  @override
  Widget build(BuildContext context) =>Scaffold(
    appBar: AppBar(
      title: Text('Home'),
      backgroundColor: Colors.blue,
    ),
    body: ListView(
      padding: EdgeInsets.all(32),
      children: [
        textbuild(),
      ],
    ),
    floatingActionButton: SpeedDial(
      animatedIcon: AnimatedIcons.menu_close,
      children: [
        SpeedDialChild(
          child: Icon(Icons.phone_in_talk_sharp),
          label: 'Call Police',
        ),
        SpeedDialChild(
            child: Icon(Icons.wc_rounded),
            label: 'Notify Family',
        ),
        SpeedDialChild(
            child: Icon(Icons.logout),
            label: 'Logout',
            onTap: (){
              context.read<AuthenticationService>().signOut();
            },
        ),
      ],
    ),
  );

}



