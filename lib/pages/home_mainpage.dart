import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:reckomov_app/components/card/card_film-s.dart';
import 'package:reckomov_app/components/card/card_film-xl.dart';
import 'package:reckomov_app/components/othercomponents/loading.dart';
import 'package:reckomov_app/dataclass/dataclass_homepage.dart';
import 'package:reckomov_app/pages/home_searchpage.dart';
import 'package:reckomov_app/pages/morefilm_page.dart';
import 'package:reckomov_app/service/service_homepage.dart';

class HomeMainPage extends StatefulWidget {
  const HomeMainPage({super.key});

  @override
  State<HomeMainPage> createState() => _HomeMainPageState();
}

class _HomeMainPageState extends State<HomeMainPage> {
  final control_search = TextEditingController();
  int index = 0;

  List<DataClassHomepage> list1 = [];
  List<DataClassHomepage> list2 = [];
  List<DataClassHomepage> list3 = [];
  List<DataClassHomepage> list4 = [];
  List<DataClassHomepage> list5 = [];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment(1, 1),
                  colors: <Color>[
                Color.fromARGB(255, 255, 255, 255),
                Color.fromARGB(255, 46, 54, 72),
              ])),
        ),
        ScrollConfiguration(
            behavior: ScrollBehavior(),
            child: GlowingOverscrollIndicator(
              axisDirection: AxisDirection.down,
              color: Color.fromARGB(255, 46, 54, 72),
              child: ListView(
                children: [
                  Container(
                      margin: EdgeInsets.all(15),
                      child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SearchPage()));
                          },
                          child: Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 25),
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Color.fromARGB(255, 198, 198, 198),
                                      width: 1),
                                  borderRadius: BorderRadius.circular(15)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Cari Film",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color:
                                            Color.fromARGB(255, 125, 125, 125)),
                                  ),
                                  Icon(
                                    Icons.search_rounded,
                                    color: Color.fromARGB(255, 125, 125, 125),
                                  )
                                ],
                              )))),
                  Container(
                      margin: EdgeInsets.only(
                        left: 10,
                      ),
                      child: Text(
                        'AKAN RILIS',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      )),
                  Container(
                    height: 230,
                    child: FutureBuilder(
                        future:
                            serviceHomePagecheker(context, list1, "upcoming"),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            return PageView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: list1.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: CardFilmXL(
                                      id_film: list1[index].id,
                                      poster: list1[index].poster_path,
                                      title: list1[index].original_title,
                                      overview: list1[index].overview,
                                      tmdbrate: list1[index].tmdbrate,
                                      release_date: list1[index].release_date,
                                    ),
                                  );
                                });
                          } else {
                            return Center(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 16.0),
                                child: Shimmer.fromColors(
                                  baseColor: Color.fromARGB(180, 46, 54, 72),
                                  highlightColor:
                                      Color.fromARGB(255, 76, 89, 120),
                                  child: Container(
                                    height: 200.0,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[300],
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }
                        }),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          margin: EdgeInsets.only(left: 10, top: 30),
                          child: Text(
                            "RILIS TERBARU",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w600),
                          )),
                      Container(
                          margin: EdgeInsets.only(
                            right: 30,
                            top: 30,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MoreFilmPage(
                                            section: "new_releases",
                                          )));
                            },
                            child: Text(
                              "Lainnya >",
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.w600),
                            ),
                          )),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.all(15),
                    height: 250,
                    child: FutureBuilder(
                        future: serviceHomePage(list2, "new_releases"),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            return ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: list2.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(0),
                                    child: Container(
                                      width: 127,
                                      child: CardFilmS(
                                        id: list2[index].id,
                                        poster: list2[index].poster_path,
                                        title: list2[index].original_title,
                                      ),
                                    ),
                                  );
                                });
                          } else {
                            return Loading();
                          }
                        }),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          margin: EdgeInsets.only(left: 10, top: 30),
                          child: Text(
                            "POPULER SEKARANG INI",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w600),
                          )),
                      Container(
                          margin: EdgeInsets.only(
                            right: 30,
                            top: 30,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MoreFilmPage(
                                            section: "trending",
                                          )));
                            },
                            child: Text(
                              "Lainnya >",
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.w600),
                            ),
                          )),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.all(15),
                    height: 250,
                    child: FutureBuilder(
                        future: serviceHomePage(list3, "trending"),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            return ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: list3.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(0),
                                    child: Container(
                                      width: 127,
                                      child: CardFilmS(
                                        id: list3[index].id,
                                        poster: list3[index].poster_path,
                                        title: list3[index].original_title,
                                      ),
                                    ),
                                  );
                                });
                          } else {
                            return Loading();
                          }
                        }),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          margin: EdgeInsets.only(left: 10, top: 30),
                          child: Text(
                            "POPULER SEPANJANG MASA",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w600),
                          )),
                      Container(
                          margin: EdgeInsets.only(
                            right: 30,
                            top: 30,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MoreFilmPage(
                                            section: "top_rated",
                                          )));
                            },
                            child: Text(
                              "Lainnya >",
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.w600),
                            ),
                          )),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.all(15),
                    height: 250,
                    child: FutureBuilder(
                        future: serviceHomePage(list4, "top_rated"),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            return ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: list4.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(0),
                                    child: Container(
                                      width: 127,
                                      child: CardFilmS(
                                        id: list4[index].id,
                                        poster: list4[index].poster_path,
                                        title: list4[index].original_title,
                                      ),
                                    ),
                                  );
                                });
                          } else {
                            return Loading();
                          }
                        }),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          margin: EdgeInsets.only(left: 10, top: 30),
                          child: Text(
                            "REKOMENDASI UNTUKMU",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w600),
                          )),
                      Container(
                          margin: EdgeInsets.only(
                            right: 30,
                            top: 30,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MoreFilmPage(
                                            section: "recommendation",
                                          )));
                            },
                            child: Text(
                              "Lainnya >",
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.w600),
                            ),
                          )),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.all(15),
                    height: 250,
                    child: FutureBuilder(
                        future: serviceHomePage(list5, "recommendation"),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            return ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: list5.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(0),
                                    child: Container(
                                      width: 127,
                                      child: CardFilmS(
                                        id: list5[index].id,
                                        poster: list5[index].poster_path,
                                        title: list5[index].original_title,
                                      ),
                                    ),
                                  );
                                });
                          } else {
                            return Loading();
                          }
                        }),
                  ),
                  Container(
                    height: 100,
                    color: Color.fromARGB(235, 46, 54, 72),
                    child: Center(
                      child: Text(
                        "MyApp.com",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            )),
      ],
    );
  }
}
