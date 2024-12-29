import 'package:flutter/material.dart';
import 'package:reckomov_app/components/appbar/appbar.dart';
import 'package:reckomov_app/components/card/card_film-xl.dart';
import 'package:reckomov_app/components/othercomponents/loading_circular.dart';
import 'package:reckomov_app/dataclass/dataclass_homepage.dart';
import 'package:reckomov_app/service/service_morefilm.dart';

class MoreFilmPage extends StatefulWidget {
  final String section;
  const MoreFilmPage({super.key, required this.section});

  @override
  State<MoreFilmPage> createState() => _MoreFilmPageState();
}

class _MoreFilmPageState extends State<MoreFilmPage> {
  final ScrollController _scrollController = ScrollController();
  List<DataClassHomepage> list1 = [];

  void tambah(List<DataClassHomepage> list1) {
    List<DataClassHomepage> newlist = [];
    serviceMoreFilm(newlist, widget.section);
    setState(() {
      list1.clear();
      list1 = newlist;
    });
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0.0,
      duration: Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ResAppbar(),
      body: RefreshIndicator(
        onRefresh: () async {
          tambah(list1);
        },
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                "Lainnya >",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              Text(
                "Tarik ke bawah untuk refresh halaman.",
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                  child: FutureBuilder(
                      future: serviceMoreFilm(list1, widget.section),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          return ListView.builder(
                              controller: _scrollController,
                              scrollDirection: Axis.vertical,
                              itemCount: list1.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  height: 230,
                                  child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: CardFilmXL(
                                      id_film: list1[index].id,
                                      poster: list1[index].poster_path,
                                      title: list1[index].original_title,
                                      overview: list1[index].overview,
                                      tmdbrate: list1[index].tmdbrate,
                                      release_date: list1[index].release_date,
                                    ),
                                  ),
                                );
                              });
                        } else {
                          return Center(
                            child: LoadingCircular(),
                          );
                        }
                      }))
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _scrollToTop,
        child: Icon(Icons.arrow_upward),
        tooltip: 'Scroll to Top',
      ),
    );
  }
}
