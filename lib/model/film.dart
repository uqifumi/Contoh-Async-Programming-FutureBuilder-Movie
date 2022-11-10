class Film {
  final String gambar;
  final String judulAsli;
  final String sinopsis;
  final String tanggalRelease;
  final String judul;
  final String poster;

  Film(
      {required this.gambar,
      required this.judulAsli,
      required this.sinopsis,
      required this.tanggalRelease,
      required this.judul,
      required this.poster});

  factory Film.fromJson(Map<String, dynamic> json) {
    return Film(
        gambar: json['backdrop_path'] as String,
        judulAsli: json['original_title'] as String,
        sinopsis: json['overview'] as String,
        tanggalRelease: json['release_date'] as String,
        judul: json['title'],
        poster: json['poster_path']
    );
  }
}
