import 'package:flutter/material.dart';
import 'package:reckomov_app/pages/filmpage.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CardFilmS extends StatelessWidget {
  final int id;
  final String poster;
  final String title;
  const CardFilmS(
      {super.key, required this.poster, required this.title, required this.id});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => FilmPage(
                      id_film: id,
                      title: title,
                    )));
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        color: Color.fromARGB(255, 46, 54, 72),
        elevation: 5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 120,
              height: 180,
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
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    softWrap: false,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w300),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
