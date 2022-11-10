import 'package:flutter/foundation.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:async_programming_futurebuilder_movie/model/film.dart';

Future<List<Film>> fetchFilmSedangTayang(http.Client client) async {
  String key = "ff6d04e787d82c0a9b64e35b58519529"; // isi dengan api key anda.
  final response = await client.get(Uri.parse(
      'https://api.themoviedb.org/3/movie/now_playing?api_key=$key&language=en-US&page=1'));
  return compute(parseFilm, response.body);
}

List<Film> parseFilm(String responseBody) {
  final parsed =
      jsonDecode(responseBody)['results'].cast<Map<String, dynamic>>();
  return parsed.map<Film>((json) => Film.fromJson(json)).toList();
}
