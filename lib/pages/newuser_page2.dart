import 'package:flutter/material.dart';
import 'package:reckomov_app/components/card/card_genre.dart';
import 'package:reckomov_app/components/othercomponents/loading_circular.dart';
import 'package:reckomov_app/dataclass/dataclass_genre.dart';
import 'package:reckomov_app/service/service_newuser.dart';

class NewUserPage2 extends StatefulWidget {
  const NewUserPage2({super.key});

  @override
  State<NewUserPage2> createState() => _NewUserPage2State();
}

class _NewUserPage2State extends State<NewUserPage2> {
  List<DataClassGenre> list1 = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment(1, 1),
                      colors: <Color>[
                    Color.fromARGB(255, 255, 255, 255),
                    Color.fromARGB(255, 46, 54, 72),
                  ])),
            ),
            Column(
              children: [
                SizedBox(
                  height: 30,
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
                      Navigator.pushReplacementNamed(context, '/dashboard');
                      FocusScope.of(context).unfocus();
                    },
                    child: Text(
                      'lanjut >',
                      style: TextStyle(fontSize: 10, color: Colors.white),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text("Pilih Genre Preferensi Anda"),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child:
                      Text("Scroll ke bawah untuk melihat lebih banyak genre"),
                ),
                Expanded(
                  child: FutureBuilder(
                      future: serviceGenrePreference(list1),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          return PageView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: list1.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 50, horizontal: 30),
                                  child: CardGenre(
                                    id_genre: list1[index].id,
                                    genre: list1[index].nama_genre,
                                    poster: list1[index].poster,
                                  ),
                                );
                              });
                        } else {
                          return Center(
                            child: LoadingCircular(),
                          );
                        }
                      }),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
