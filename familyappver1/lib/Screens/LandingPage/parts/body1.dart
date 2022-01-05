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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:familyappver1/Authentication/authentication_services.dart';
import 'package:familyappver1/Screens/AlertPage/main.dart';
import 'package:familyappver1/Screens/CreateFamily/createFamily.dart';
import 'package:familyappver1/Screens/Dochub/firstpage.dart';
import 'package:familyappver1/Screens/JoinFamily/joinFamily.dart';
import 'package:familyappver1/Screens/Location/LocationsHomePage.dart';
import 'package:familyappver1/Screens/MyProfilePage/parts/seeinfo.dart';
import 'package:familyappver1/Screens/Todos/todos.dart';
import 'package:familyappver1/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class LandingPage1 extends StatefulWidget{

  @override
  State<LandingPage1> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage1> {
  @override
  void initState() {
    super.initState();
    updateLastActiveTime();
  }
  Widget Cont() {

    var size = MediaQuery.of(context).size;
    return Stack(
      children: <Widget>[
        Container(
          height: size.height * .3,
          decoration: const BoxDecoration(
            image: DecorationImage(
              alignment: Alignment.topCenter,
              image: AssetImage('assets/images/top_header.png')
            ),
          ),
        ),

        Column(
          children: <Widget>[
            Container(
              height: 64,
              child: Row(
                children: <Widget>[
                  Text("Welcome back, "),
                ],
              ),
            )
          ],
        )
      ],
    );
  }

  void _goToJoin(BuildContext context){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>JoinGroup(),
    ),
    );
  }

  void _goToCreate(BuildContext context){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>CreateGroup(),
    ),
    );
  }

  @override
  Widget build(BuildContext context) =>Scaffold(
    appBar: AppBar(
      title: Text('Home'),
      backgroundColor: Colors.blue,
    ),
    body: ListView(
      padding: EdgeInsets.all(32),
      children: [
        Cont(),
      ],
    ),
    floatingActionButton: SpeedDial(
      animatedIcon: AnimatedIcons.menu_close,
      children: [
        SpeedDialChild(
          child: Icon(Icons.phone_in_talk_sharp),
          label: 'Doc Hub',
          onTap: ()=> {
            Navigator.push(context, MaterialPageRoute(builder: (context){return FirstPage();},))
          },
        ),
        SpeedDialChild(
            child: Icon(Icons.wc_rounded),
            label: 'Todos',
            onTap: ()=>{
              Navigator.push(context, MaterialPageRoute(builder: (context){return Todo();},))
            }
        ),
        SpeedDialChild(
          child: Icon(Icons.family_restroom_outlined),
          label: 'Create Family',
          onTap: () => _goToCreate(context),
        ),
        SpeedDialChild(
          child: Icon(Icons.family_restroom),
          label: 'Join Family',
          onTap: () => _goToJoin(context),
        ),
        SpeedDialChild(
          child: Icon(Icons.add_location_alt_outlined),
          label: 'Family Locations',
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){return Locations();},));
          },
        ),
        SpeedDialChild(
          child: Icon(Icons.add_link),
          label: 'My Profile',
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){return Info();},));
          },
        ),
        SpeedDialChild(
          child: Icon(Icons.logout),
          label: 'Logout',
          onTap: (){
            context.read<AuthenticationService>().signOut();
            Fluttertoast.showToast(msg: "Signed Out");
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (_) => MyApp()));
          },
        ),
      ],
    ),
  );

  Future<void> updateLastActiveTime() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    final uid = user!.uid;
    await FirebaseFirestore.instance.collection("users").doc(uid).update({
      'Last_Active_Time': Timestamp.now(),
    });
  }
}




