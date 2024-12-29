import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:reckomov_app/components/othercomponents/snackbar.dart';
import 'package:reckomov_app/dataclass/dataclass_homepage.dart';

Future<String?> getEmail() async {
  var storage = FlutterSecureStorage();
  var email = await storage.read(key: "user");
  return email;
}

Future<void> serviceFavoritAdd(BuildContext context, id) async {
  try {
    String? email = await getEmail();
    final String url = 'http://toba.flaskhost.my.id/favorit/post';

    Map<String, String> headers = {'Content-Type': 'application/json'};
    String jsonBody = jsonEncode({
      "id_film": id,
      "email": email,
    });

    final response =
        await http.post(Uri.parse(url), headers: headers, body: jsonBody);

    if (response.statusCode == 201) {
      showSnackBar(context, 'Berhasil ditambahkan.');
    } else if (response.statusCode == 401) {
      showSnackBar(context, 'Data film sudah ada.');
    } else if (response.statusCode == 404) {
      showSnackBar(context, 'Maaf ada gangguan.');
    }
  } catch (err) {
    showSnackBar(context, 'Koneksi internet terputus.');
  }
}

Future<void> serviceFavoritFilm(context, List mpList) async {
  try {
    String? email = await getEmail();
    var test =
        await http.get(Uri.http('toba.flaskhost.my.id', 'favorit/get/${email}'));
    var jsondecode = jsonDecode(test.body);

    if (jsondecode.length > mpList.length) {
      for (var mp in jsondecode) {
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
    if (test.statusCode == 400) {
      showSnackBar(context, 'belum ada film.');
    }
  } catch (err) {
    showSnackBar(context, 'Koneksi internet terputus.');
  }
}

Future<void> serviceFavoritDelete(BuildContext context, id) async {
  try {
    String? email = await getEmail();
    final String url = 'http://toba.flaskhost.my.id/favorite/delete';

    Map<String, String> headers = {'Content-Type': 'application/json'};
    String jsonBody = jsonEncode({
      "id_film": id,
      "email": email,
    });

    final response =
        await http.post(Uri.parse(url), headers: headers, body: jsonBody);

    if (response.statusCode == 201) {
      showSnackBar(context, 'Berhasil dihapus.');
      Navigator.pop(context);
      Navigator.pushReplacementNamed(context, "/dashboard");
    } else if (response.statusCode == 401) {
      showSnackBar(context, 'Eror saat menghapus.');
    } else if (response.statusCode == 404) {
      showSnackBar(context, 'Maaf ada gangguan.');
    }
  } catch (err) {
    showSnackBar(context, 'Koneksi internet terputus.');
  }
}
