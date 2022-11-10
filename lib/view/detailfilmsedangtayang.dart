import 'package:flutter/material.dart';
import 'package:async_programming_futurebuilder_movie/model/film.dart';

class DetailFilmSedangTayang extends StatelessWidget {
  final Film film;

  const DetailFilmSedangTayang({Key? key, required this.film}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget bagianJudul = Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(film.judulAsli,
                      style: Theme.of(context).textTheme.headline6),
                ),
                Text(
                  "Release: ${film.tanggalRelease.substring(8, 10)}-${film.tanggalRelease.substring(5, 7)}-${film.tanggalRelease.substring(0, 4)}",
                  style: TextStyle(color: Colors.grey[700]),
                ),
              ],
            ),
          ),
        ],
      ),
    );

    Widget bagianDeskripsi = Container(
      padding: const EdgeInsets.all(16),
      child: Text(
        film.sinopsis,
        style: Theme.of(context).textTheme.bodyText1,
        softWrap: true,
        textAlign: TextAlign.justify,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(film.judulAsli),
      ),
      body: ListView(
        children: <Widget>[
          Image.network(
            "https://image.tmdb.org/t/p/w500${film.gambar}",
            width: 600,
            fit: BoxFit.cover,
          ),
          bagianJudul,
          bagianDeskripsi,
        ],
      ),
    );
  }
}
