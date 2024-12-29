import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:reckomov_app/dataclass/dataclass_filmpage.dart';

Future serviceFilmPage(filmpagelist, int id_film, String title) async {
  List<String> genre = [];
  var test =
      await http.get(Uri.http('toba.flaskhost.my.id', 'filmpage/$id_film/$title'));
  var jsondecode = jsonDecode(test.body);

  for (var i in jsondecode['film']) {
    for (var x in i['genres']) {
      genre.add(x['name'].toString());
    }

    final film_data = DataClassFilmpage(
        actor: jsondecode['credits'],
        award: jsondecode['rating'][0]['award'] ?? "N/A",
        backdrop: i['backdrop_path'],
        budget: i['budget'],
        genre: genre,
        imdbRating: jsondecode['rating'][0]['imdbRating'] ?? "N/A",
        imdbVotes: jsondecode['rating'][0]['imdbVotes'] ?? "N/A",
        metascore: jsondecode['rating'][0]['Metascore'] ?? "N/A",
        origin_country: i['origin_country'],
        original_title: i['original_title'],
        overview: i['overview'],
        popularity: i['popularity'].toString(),
        poster_path: i['poster_path'],
        production_comp: i['production_companies'],
        rated: jsondecode['rating'][0]['Rated'] ?? "N/A",
        ratings: jsondecode['rating'][0]['Ratings'] ?? [],
        release_date: i['release_date'],
        runtime: i['runtime'].toString(),
        tagline: i['tagline'],
        vote_ave: i['vote_average'].toString(),
        vote_count: i['vote_count'].toString());

    filmpagelist.add(film_data);
  }
}
