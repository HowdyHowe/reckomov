import 'package:flutter/material.dart';
import 'package:reckomov_app/service/service_newuser.dart';

class NewUserPage1 extends StatefulWidget {
  const NewUserPage1({super.key});

  @override
  State<NewUserPage1> createState() => _NewUserPage1State();
}

class _NewUserPage1State extends State<NewUserPage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Hai pengguna baru, silahkan lanjut untuk memilih preferensi genre.",
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 10, bottom: 20, left: 50, right: 50),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    // Background color
                    backgroundColor: Color.fromARGB(255, 46, 54, 72),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10.0), // Rounded corners
                    ),
                  ),
                  onPressed: () async {
                    serviceInsertGenrePreference(context, 0);
                    Navigator.pushReplacementNamed(context, '/new_user2');
                    FocusScope.of(context).unfocus();
                  },
                  child: Text(
                    'Lanjut',
                    style: TextStyle(fontSize: 10, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
