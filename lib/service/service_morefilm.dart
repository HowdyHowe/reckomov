import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:reckomov_app/dataclass/dataclass_homepage.dart';

Future<String?> getEmail() async {
  var storage = FlutterSecureStorage();
  var email = await storage.read(key: "user");
  return email;
}

Future serviceMoreFilm(List mpList, String section) async {
  // var test = await http.get(Uri.http('toba.flaskhost.my.id', 'allinfopage/$section'));
  // var jsondecode = jsonDecode(test.body);
  // mpList.clear();
  String? email = await getEmail();
  final String url = 'http://toba.flaskhost.my.id/allinfopage';

  Map<String, String> headers = {'Content-Type': 'application/json'};
  String jsonBody = jsonEncode({"email": email, "section": section});

  final response =
      await http.post(Uri.parse(url), headers: headers, body: jsonBody);

  var jsondecode = jsonDecode(response.body);

  for (var mp in jsondecode[section]) {
    final mostpop = DataClassHomepage(
        id: mp['id'],
        original_language: mp['original_language'].toString(),
        original_title: mp['original_title'].toString(),
        overview: mp['overview'].toString(),
        poster_path: mp['poster_path'].toString(),
        relase_data: mp['relase_data'].toString(),
        tmdbrate: mp['vote_average'].toString(),
        release_date: mp['release_date'].toString());
    mpList.add(mostpop);
  }
}
