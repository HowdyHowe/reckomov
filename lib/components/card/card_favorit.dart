import 'package:flutter/material.dart';
import 'package:reckomov_app/pages/filmpage_favorit.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CardFav extends StatelessWidget {
  final String poster;
  final String title;
  final String overview;
  final String tmdbrate;
  final String release_date;
  final int id_film;
  const CardFav(
      {super.key,
      required this.poster,
      required this.title,
      required this.overview,
      required this.tmdbrate,
      required this.release_date,
      required this.id_film});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => FilmPageFavorite(
                      id_film: id_film,
                      title: title,
                    )));
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Color.fromARGB(255, 46, 54, 72),
        elevation: 5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 10),
                width: 200,
                height: 300,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    imageUrl: "https://image.tmdb.org/t/p/w185${poster}",
                    placeholder: (context, url) => Center(
                      child: Text(
                      "...",
                      style: TextStyle(color: Colors.white),
                    ),
                    ),
                    errorWidget: (context, url, error) => Center(
                      child: Icon(Icons.error),
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text(
                        overview,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        softWrap: false,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Row(
                        children: [
                          Text(
                            'Rilis: ${release_date}',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            softWrap: false,
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
