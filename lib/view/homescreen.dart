import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:async_programming_futurebuilder_movie/model/film.dart';
import 'package:async_programming_futurebuilder_movie/viewmodel/fetchfilmsedangtayang.dart';
import 'package:async_programming_futurebuilder_movie/view/detailfilmsedangtayang.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Review Film'),
      ),
      body: FutureBuilder<List<Film>>(
        future: fetchFilmSedangTayang(http.Client()),
        builder: (context, snapshot) {
          // ignore: avoid_print
          if(snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ?ListTayangSekarang(film: snapshot.data)
              :const Center(child: CircularProgressIndicator());

        },
      ),
    );
  }
}

class ListTayangSekarang extends StatelessWidget {
  final List<Film>? film;

  const ListTayangSekarang({Key? key, required this.film}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
        child: ListView.builder(
            itemCount: film?.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailFilmSedangTayang(
                                film: film![index],
                              )));
                },
                child: Card(
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Image.network(
                          'https://image.tmdb.org/t/p/w300${film![index].poster}',
                          width: 75,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Text(film![index].judulAsli,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                            ),
                            Text("Release: ${film![index].tanggalRelease.substring(8, 10)}-${film![index].tanggalRelease.substring(5, 7)}-${film![index].tanggalRelease.substring(0, 4)}"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }));
  }
}