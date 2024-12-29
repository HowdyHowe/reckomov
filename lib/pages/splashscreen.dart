import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Future.delayed(Duration(seconds: 3), () async {
      var storage = FlutterSecureStorage();
      var email = await storage.read(key: "user");
      if (email != null) {
        Navigator.pushReplacementNamed(context, "/dashboard");
      } else {
        Navigator.pushReplacementNamed(context, "/login");
      }
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment(1, 1),
                      colors: <Color>[
                    Color.fromARGB(255, 57, 91, 100),
                    Color.fromARGB(255, 231, 246, 242),
                  ])),
            ),
            Center(
              child: Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                      child: Icon(
                    Icons.movie,
                    size: 150,
                  ))),
            ),
          ],
        ),
      ),
    );
  }
}
