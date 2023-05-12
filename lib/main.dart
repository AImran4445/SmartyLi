// import 'package:flutter/material.dart';
// import 'package:home/Homepage.dart';

// import 'Screens/auth/SignIn/signin_screen.dart';
// import 'Screens/auth/SignUp/SignUpScreen.dart';



// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//    MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(
//        primarySwatch: Colors.indigo,
//       ),
//       home: Homepage(),
//     );
//   }
// }


import 'dart:async';
import 'package:flutter/material.dart';
import 'Homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: {
        '/homepage': (_) => Homepage(),
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4), () {
      Navigator.of(context).pushReplacementNamed('/homepage');
    });
  }

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(109, 111, 204, 1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/smart-city.png',
              height: 150,
            ),
            SizedBox(height: 20),
            Text(
              'SmartyLi',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

