import 'package:flutter/material.dart';
import 'package:reckomov_app/pages/dashboard.dart';
import 'package:reckomov_app/pages/home_searchpage.dart';
import 'package:reckomov_app/pages/login_forgetpage.dart';
import 'package:reckomov_app/pages/login_mainpage.dart';
import 'package:reckomov_app/pages/login_signinpage.dart';
import 'package:reckomov_app/pages/newuser_page1.dart';
import 'package:reckomov_app/pages/newuser_page2.dart';
import 'package:reckomov_app/pages/splashscreen.dart';


void main() {
  runApp(ReckoMov());
}

class ReckoMov extends StatelessWidget {
  const ReckoMov({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          fontFamily: 'Rubik',
          highlightColor: Color.fromARGB(0, 0, 0, 0),
          splashColor: Colors.transparent,
          hintColor: Colors.black),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/login': (context) => LoginPage(),
        '/signin': (context) => SignInPage(),
        '/forget': (context) => ForgetPage(),
        '/dashboard': (context) => Dashboard(),
        '/new_user1': (context) => NewUserPage1(),
        '/new_user2': (context) => NewUserPage2(),
        '/search_page': (context) => SearchPage(),
      },
    );
  }
}
