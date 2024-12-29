import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:reckomov_app/components/appbar/appbar.dart';
import 'package:reckomov_app/components/othercomponents/loading_circular.dart';
import 'package:reckomov_app/dataclass/dataclass_filmpage.dart';
import 'package:reckomov_app/service/service_bookmark.dart';
import 'package:reckomov_app/service/service_favorit.dart';
import 'package:reckomov_app/service/service_filmpage.dart';

class FilmPage extends StatelessWidget {
  final List<DataClassFilmpage> list1 = [];
  final int id_film;
  final String title;
  FilmPage({super.key, required this.id_film, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ResAppbar(),
      body: FutureBuilder(
          future: serviceFilmPage(list1, id_film, title),
          builder: (context, snapshot) {
            try {
              if (snapshot.connectionState == ConnectionState.done) {
                return ScrollConfiguration(
                  behavior: ScrollBehavior(),
                  child: GlowingOverscrollIndicator(
                    axisDirection: AxisDirection.down,
                    color: Color.fromARGB(255, 46, 54, 72),
                    child: ListView(
                      children: [
                        Stack(
                          alignment: Alignment.bottomLeft,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 0),
                              width: double.infinity,
                              height: 400,
                              child: Opacity(
                                  opacity: 0.3,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(0),
                                    child: (list1.isNotEmpty &&
                                            list1[0].backdrop != false &&
                                            list1[0].backdrop.isNotEmpty)
                                        ? CachedNetworkImage(
                                            imageUrl:
                                                "https://image.tmdb.org/t/p/original${list1[0].backdrop}",
                                            placeholder: (context, url) =>
                                                Center(
                                              child: Text(
                                                "...",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                            errorWidget:
                                                (context, url, error) => Center(
                                              child: Icon(Icons.error),
                                            ),
                                            fit: BoxFit.cover,
                                          )
                                        : Container(
                                            color: Colors.grey[
                                                200], // Fallback color for no image
                                            child: Center(
                                              child: Text(
                                                "No Image Available",
                                                style: TextStyle(
                                                    color: Colors.black54),
                                              ),
                                            ),
                                          ),
                                  )),
                            ),
                            Row(
                              children: [
                                // Container(
                                //   margin: EdgeInsets.only(
                                //       top: 110, left: 10, bottom: 10),
                                //   width: 130,
                                //   height: 180,
                                //   child: ClipRRect(
                                //     borderRadius: BorderRadius.circular(10),
                                //     child: CachedNetworkImage(
                                //       imageUrl:
                                //           "https://image.tmdb.org/t/p/original${list1[0].poster_path}",
                                //       placeholder: (context, url) => Center(
                                //         child: CircularProgressIndicator(),
                                //       ),
                                //       errorWidget: (context, url, error) =>
                                //           Center(
                                //         child: Icon(Icons.error),
                                //       ),
                                //       fit: BoxFit.cover,
                                //     ),
                                //   ),
                                // ),
                                Container(
                                  margin: EdgeInsets.only(
                                      top: 110, left: 10, bottom: 10),
                                  width: 130,
                                  height: 180,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            "https://image.tmdb.org/t/p/original${list1[0].poster_path}",
                                        placeholder: (context, url) => Center(
                                          child: Text(
                                            "...",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                        errorWidget: (context, url, error) =>
                                            Center(
                                          child: Icon(Icons.error),
                                        ),
                                        fit: BoxFit.cover,
                                      )),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 70, left: 5, right: 5),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10),
                                          child: Text(
                                            list1[0].original_title,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                            softWrap: false,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                        Text(
                                          "Rated: ${list1[0].rated}",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          "Durasi: ${list1[0].runtime} menit",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          "Genre: ${list1[0].genre.join(", ")}",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          "Asal: ${list1[0].origin_country[0]}",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          "Aktor: ${list1[0].actor.join(", ")}",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),

                        // Sinopsis Film
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 20, bottom: 5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Sinopsis: ",
                                style: TextStyle(fontWeight: FontWeight.w700),
                              ),
                              Text(
                                "${list1[0].overview}",
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 20, right: 20, top: 5, bottom: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Tagline: ${list1[0].tagline}",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 10),
                              ),
                            ],
                          ),
                        ),

                        // Rating film
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 5),
                          child: Text(
                            "Rating: ",
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 2),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "TMDB: ${list1[0].vote_ave}/10",
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 2),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Metascore: ${list1[0].metascore}",
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 2),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "IMDB: ${list1[0].imdbRating}",
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 2),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  list1.isNotEmpty &&
                                          list1[0].ratings.length > 2 &&
                                          list1[0]
                                              .ratings[2]
                                              .containsKey('Value')
                                      ? "Rotten Tomatoes: ${list1[0].ratings[1]['Value']}"
                                      : "Rotten Tomatoes: N/A",
                                  style: TextStyle(fontWeight: FontWeight.w500))
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 2),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  list1.isNotEmpty &&
                                          list1[0].ratings.length > 2 &&
                                          list1[0]
                                              .ratings[2]
                                              .containsKey('Value')
                                      ? "Metacritic: ${list1[0].ratings[2]['Value']}"
                                      : "Metacritic: N/A",
                                  style: TextStyle(fontWeight: FontWeight.w500))
                            ],
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 20, bottom: 5),
                          child: Text(
                            "Popularitas: ",
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 2),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Index: ${list1[0].popularity}",
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(20),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.pink),
                                      onPressed: () {
                                        serviceFavoritAdd(context, id_film);
                                      },
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10, bottom: 10, right: 10),
                                            child: Icon(
                                              Icons.add,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Text(
                                            "Favorit",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ],
                                      )),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.yellow[800]),
                                      onPressed: () {
                                        serviceBookmarkAdd(context, id_film);
                                      },
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10, bottom: 10, right: 10),
                                            child: Icon(
                                              Icons.add,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Text(
                                            "Bookmark",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ],
                                      )),
                                )
                              ]),
                        )
                      ],
                    ),
                  ),
                );
              } else {
                return Center(
                  child: LoadingCircular(),
                );
              }
            } catch (error) {
              return Center(child: Text("Maaf data film ini error."));
            }
          }),
    );
  }
}
