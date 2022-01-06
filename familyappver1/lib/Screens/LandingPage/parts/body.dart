import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:familyappver1/Authentication/authentication_services.dart';
import 'package:familyappver1/Screens/AlertPage/main.dart';
import 'package:familyappver1/Screens/Chat/myhome.dart';
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

class LandingPage extends StatefulWidget{

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {

  String myEmail = '';


  @override
  void initState() {
    super.initState();
    updateLastActiveTime();
    showSignInSuccessful();
  }
  Widget Cont() {

    var size = MediaQuery.of(context).size;
    return Stack(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.fromLTRB(20.0, 25.0, 20.0, 0.0),
          margin: const EdgeInsets.all(10.0),
          child: ShaderMask(
            blendMode: BlendMode.srcIn,
            shaderCallback: (rect) => const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.red, Colors.deepOrangeAccent],
            ).createShader(rect),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Family App',
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
              ],
            ),
          ),
        ),
        Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.fromLTRB(30, 110, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text("Welcome, ",
                    style: TextStyle(
                        fontFamily: 'Libre Baskerville',
                        fontSize: 21.0,
                        fontWeight: FontWeight.w100,
                        color: Colors.blueGrey
                    ),
                  ),

                  _infoCell(title: "", value: myEmail),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: const Text("Home",
                style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 25.0,
                    fontWeight: FontWeight.w900,
                    color: Colors.blueGrey
                ),
              ),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(0.0, 200.0, 0.0, 0.0),
          child: Image.asset('assets/images/homepageheader.png'),
        ),
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
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor:  const Color(0xFFFFFFFF),
      body: ListView(
        children: [
          Cont(),
          FutureBuilder(
            future: _fetch(),
            builder: (context, snapshot) {
              return const Text("");
            },
          ),
          IconButton(
            icon: Image.asset('assets/images/alert.png'),
            iconSize: 80,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context){return LandingBodyAlert();},));
            },
          ),
          Container(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 50),
              alignment: Alignment.center,
              child: const Text('Alert System',
                style: TextStyle(
                    fontFamily: 'Libre Baskerville',
                    fontSize: 21.0,
                    color: Colors.black54
                ),
              )
          ),

          IconButton(
            icon: Image.asset('assets/images/myprof.png'),
            iconSize: 80,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context){return Info();},));
            },
          ),
          Container(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 50),
              alignment: Alignment.center,
              child: const Text('My Profile',
                style: TextStyle(
                    fontFamily: 'Libre Baskerville',
                    fontSize: 21.0,
                    color: Colors.black54
                ),
              )
          ),

          IconButton(
            icon: Image.asset('assets/images/loc.png'),
            iconSize: 80,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context){return Locations();},));
            },
          ),
          Container(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 50),
              alignment: Alignment.center,
              child: const Text('Location',
                style: TextStyle(
                    fontFamily: 'Libre Baskerville',
                    fontSize: 21.0,
                    color: Colors.black54
                ),
              )
          ),

          IconButton(
            icon: Image.asset('assets/images/creatg.png'),
            iconSize: 80,
            onPressed: () => _goToCreate(context),
          ),
          Container(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 50),
              alignment: Alignment.center,
              child: const Text('Create Group',
                style: TextStyle(
                    fontFamily: 'Libre Baskerville',
                    fontSize: 21.0,
                    color: Colors.black54
                ),
              )
          ),

          IconButton(
            icon: Image.asset('assets/images/joing.png'),
            iconSize: 80,
            onPressed: () => _goToJoin(context),
          ),
          Container(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 50),
              alignment: Alignment.center,
              child: const Text('Join Group',
                style: TextStyle(
                    fontFamily: 'Libre Baskerville',
                    fontSize: 21.0,
                    color: Colors.black54
                ),
              )
          ),

          IconButton(
            icon: Image.asset('assets/images/chatlog.png'),
            iconSize: 80,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context){return MyHome();},));
            },
          ),
          Container(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 50),
              alignment: Alignment.center,
              child: const Text('Chatroom',
                style: TextStyle(
                    fontFamily: 'Libre Baskerville',
                    fontSize: 21.0,
                    color: Colors.black54
                ),
              )
          ),

          IconButton(
            icon: Image.asset('assets/images/notes.png'),
            iconSize: 80,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context){return Todo();},));
            },
          ),
          Container(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 50),
              alignment: Alignment.center,
              child: const Text('To Do & Notes',
                style: TextStyle(
                    fontFamily: 'Libre Baskerville',
                    fontSize: 21.0,
                    color: Colors.black54
                ),
              )
          ),

          IconButton(
            icon: Image.asset('assets/images/docstor.png'),
            iconSize: 80,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context){return FirstPage();},));
            },
          ),
          Container(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 50),
              alignment: Alignment.center,
              child: const Text('Doc Storage',
                style: TextStyle(
                    fontFamily: 'Libre Baskerville',
                    fontSize: 21.0,
                    color: Colors.black54
                ),
              )
          ),


        ],
      ),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        children: [
          SpeedDialChild(
            child: Icon(Icons.add_location_alt_outlined),
            label: 'Family Locations',
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){return Locations();},));
            },
          ),
          SpeedDialChild(
            child: Icon(Icons.circle_notifications_rounded),
            label: 'Emergency Alert ',
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){return LandingBodyAlert();},));
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
  }

  Future<void> updateLastActiveTime() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    final uid = user!.uid;
    await FirebaseFirestore.instance.collection("users").doc(uid).update({
      'Last_Active_Time': Timestamp.now(),
    });
  }


  Column _infoCell({String? title, String? value}){
    return Column(
      children: <Widget>[
        Text(
          value!,
          style: const TextStyle(
              fontFamily: 'Libre Baskerville',
              fontSize: 21.0,
              color: Colors.blueGrey
          ),
        )
      ],
    );
  }

  _fetch() async {
    final firebaseUser = await FirebaseAuth.instance.currentUser!;
    if (firebaseUser != null) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(firebaseUser.uid)
          .get()
          .then((ds) {

        setState(() {});
        myEmail = ds.data()!['Full Name'];


      }).catchError((e) {
        print(e);
      });
    }
  }

  void showSignInSuccessful() {
    Fluttertoast.showToast(msg: "Sign In Successful");
  }
}