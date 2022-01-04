import 'package:familyappver1/Authentication/authentication_services.dart';
import 'package:familyappver1/Screens/LandingPage/parts/body.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:familyappver1/Screens/WelcomePage/mainwelcomepage.dart';
import 'package:familyappver1/Screens/SignInPage/mainsigninpage.dart';
import 'package:familyappver1/Screens/SignUpPage/mainsignuppage.dart';
import 'package:familyappver1/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(
          create: (_)=>AuthenticationService(FirebaseAuth.instance),
        ),
        StreamProvider(
          initialData: null,
          create: (context)=>context.read<AuthenticationService>().authStateChanges,
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: true,
        title: 'FamApp',
        theme: ThemeData(
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: Colors.white,
        ),
        home: AuthenticationWrapper(),
      ),
    );
  }
}
class AuthenticationWrapper extends StatelessWidget{
  const AuthenticationWrapper({
    Key? key,
}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();

    if(firebaseUser != null){
      return LandingPage();
    }
    return WelcomeScreen();
  }

}
