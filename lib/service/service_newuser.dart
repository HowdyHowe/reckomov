import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:reckomov_app/components/othercomponents/snackbar.dart';
import 'package:reckomov_app/dataclass/dataclass_genre.dart';

Future<String?> getEmail() async {
  var storage = FlutterSecureStorage();
  var email = storage.read(key: "user");
  return email;
}

Future serviceGenrePreference(mpList) async {
  if (mpList.length < 19) {
    var test = await http.get(Uri.http('toba.flaskhost.my.id', 'newuser'));
    var jsondecode = jsonDecode(test.body);
    for (var genre in jsondecode) {
      final genres = DataClassGenre(
          id: genre['id'],
          nama_genre: genre['name'],
          poster: genre['poster_url']);
      mpList.add(genres);
    }
  }
}

Future serviceInsertGenrePreference(BuildContext context, id_genre) async {
  String? email = await getEmail();
  final String url = 'http://toba.flaskhost.my.id/newuser';

  Map<String, String> headers = {'Content-Type': 'application/json'};
  String jsonBody = jsonEncode({
    "id_genre": id_genre,
    "email": email,
  });

  final response =
      await http.post(Uri.parse(url), headers: headers, body: jsonBody);

  if (response.statusCode == 201) {
    showSnackBar(context, 'Genre pilihan sudah ditambah.');
  } else if (response.statusCode == 202) {
    showSnackBar(context, 'Genre pilihan sudah dihapus.');
  } else if (response.statusCode == 401) {
    showSnackBar(context, 'Genre sudah ada.');
  }
}
