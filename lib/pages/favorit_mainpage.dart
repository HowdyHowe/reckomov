import 'package:flutter/material.dart';
import 'package:reckomov_app/components/card/card_favorit.dart';
import 'package:reckomov_app/components/othercomponents/loading_circular.dart';
import 'package:reckomov_app/dataclass/dataclass_homepage.dart';
import 'package:reckomov_app/service/service_favorit.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteMainPage extends StatefulWidget {
  const FavoriteMainPage({super.key});

  @override
  State<FavoriteMainPage> createState() => _FavoriteMainPageState();
}

class _FavoriteMainPageState extends State<FavoriteMainPage> {
  List<DataClassHomepage> list1 = [];
  String? email;

  Future<String?> getPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? em = await prefs.getString("email");
    return em;
  }

  Future<void> fetchEmail() async {
    String? savedEmail = await getPrefs();
    setState(() {
      email = savedEmail;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
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
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text("Daftar favorit film anda"),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 0),
                child: Text("Scroll ke bawah untuk melihat lebih banyak"),
              ),
              Expanded(
                child: FutureBuilder(
                    future: serviceFavoritFilm(context, list1),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (list1.length == 0) {
                          return Center(
                            child: Text("Anda belum memasukkan film apapun."),
                          );
                        }
                        return PageView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: list1.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 50, horizontal: 30),
                                child: CardFav(
                                  id_film: list1[index].id,
                                  poster: list1[index].poster_path,
                                  overview: list1[index].overview,
                                  title: list1[index].original_title,
                                  release_date: list1[index].release_date,
                                  tmdbrate: list1[index].tmdbrate,
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
    );
  }
}
