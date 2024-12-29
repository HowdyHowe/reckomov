import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:reckomov_app/dataclass/dataclass_homepage.dart';

Future serviceSearchFilm(spList, String keyword) async {
  try {
    var searchdata =
        await http.get(Uri.http('toba.flaskhost.my.id', 'search/$keyword'));
    var jsondecode = await jsonDecode(searchdata.body);
    spList.clear();

    for (var sp in jsondecode) {
      final mostpop = DataClassHomepage(
          id: sp['id'],
          original_language: sp['original_language'].toString(),
          original_title: sp['original_title'].toString(),
          overview: sp['overview'].toString(),
          poster_path: sp['poster_path'].toString(),
          relase_data: sp['relase_data'].toString(),
          tmdbrate: sp['vote_average'].toString(),
          release_date: sp['release_date'].toString());
      spList.add(mostpop);
    }
  } catch (err) {}
}
