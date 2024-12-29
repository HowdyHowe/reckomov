import 'package:flutter/material.dart';
import 'package:reckomov_app/service/service_newuser.dart';

class CardGenre extends StatelessWidget {
  final int id_genre;
  final String genre;
  final String poster;
  const CardGenre({
    super.key,
    required this.id_genre,
    required this.genre,
    required this.poster,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        serviceInsertGenrePreference(context, id_genre);
      },
      child: Stack(
        children: [
          Container(
            width: 400,
            height: 600,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: NetworkImage(poster), fit: BoxFit.cover)),
            child: Center(
              child: Text(
                genre,
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
