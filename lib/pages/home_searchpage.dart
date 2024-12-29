import 'package:flutter/material.dart';
import 'package:reckomov_app/components/appbar/appbar.dart';
import 'package:reckomov_app/components/card/card_film-xl.dart';
import 'package:reckomov_app/components/othercomponents/loading_circular.dart';
import 'package:reckomov_app/dataclass/dataclass_homepage.dart';
import 'package:reckomov_app/service/service_search.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final control_search = TextEditingController();
  List<DataClassHomepage> list1 = [];

  void updateState(List<DataClassHomepage> list1) {
    List<DataClassHomepage> newList1 = [];
    serviceSearchFilm(newList1, control_search.text.toString());
    setState(() {
      list1 = newList1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ResAppbar(),
      body: Container(
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(left: 40, right: 40, top: 20),
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Color.fromARGB(255, 95, 95, 95).withOpacity(0.11),
                    blurRadius: 40,
                    spreadRadius: 0.1)
              ]),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: TextField(
                  controller: control_search,
                  decoration: InputDecoration(
                      suffixIcon: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              iconColor: Color.fromARGB(255, 125, 125, 125),
                              shadowColor: Colors.transparent,
                              backgroundColor: Color(0x00FFFFFF)),
                          onPressed: () {
                            updateState(list1);
                          },
                          child: Icon(Icons.search_rounded)),
                      suffixIconColor: WidgetStateColor.resolveWith((states) =>
                          states.contains(WidgetState.focused)
                              ? Color.fromARGB(255, 0, 0, 0)
                              : const Color.fromARGB(255, 125, 125, 125)),
                      focusColor: Colors.black,
                      hintText: "Cari Film Disini",
                      hintStyle:
                          TextStyle(color: Colors.grey[600], fontSize: 15),
                      contentPadding: EdgeInsets.symmetric(horizontal: 15),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 198, 198, 198))),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 142, 142, 142)))),
                ),
              ),
            ),
            Container(
              height: 700,
              child: FutureBuilder(
                  future:
                      serviceSearchFilm(list1, control_search.text.toString()),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (list1.length == 0) {
                        return Center(
                          child: Text(""),
                        );
                      }
                      return ListView.builder(
                          scrollDirection: Axis.vertical,
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
                        child: LoadingCircular(),
                      );
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
