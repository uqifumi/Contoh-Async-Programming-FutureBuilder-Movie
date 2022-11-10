# Contoh Asynchronous Programming Flutter (FutureBuilder)
Program yang menampilkan review film yang juga mendemonstrasikan asynchronous programming dengan widget futurebuilder pada framework flutter. Dalam program ini juga dibagi menjadi tiga bagian yang masing-masing bagian dijadikan sebagai folder yaitu view, model, dan view model. Adapun bagian-bagian tersebut secara hirarkis ditunjukkan seperti gambar berikut:
<br><br><img src="https://github.com/uqifumi/Contoh-Async-Programming-FutureBuilder-Movie/blob/master/dokumentasi/Gambar%2001%20movieapp.png" width="150"/><br>
## Model
Dari gambar ditunjukkan pada bagian model terdiri dari satu file yaitu film.dart yang merupakan PODO (plain old dart objek) digunakan untuk membentuk format data objek dari json yang diperoleh dari server. File ini digunakan baik untuk bagian daftar film beserta detailnya karena untuk membuat kedua bagian ini dalam program cukup diperlukan satu JSON yang di-request dari satu url endpoint.
## View
Pada bagian ini diperlukan untuk menampilkan data daftar film dan detailnya dengan layout tampilan yang kode programnya terdapat pada file home.dart dan detailfilmsedangtayang.dart. Adapun tampilan layout yang dimaksud seperti pada gambar berikut:
Pada bagian ini widget futurebuilder diterapkan pada bagian home.dart yang melakukan request data ke server, sedangkan detailfilmsedangtayang.dart memperoleh data dari home.dart sebagai hasil dari navigasi route.
<br><br><img src="https://github.com/uqifumi/Contoh-Async-Programming-FutureBuilder-Movie/blob/master/dokumentasi/Gambar%2002%20movieapp.png" width="250"/><br>
<br><img src="https://github.com/uqifumi/Contoh-Async-Programming-FutureBuilder-Movie/blob/master/dokumentasi/Gambar%2003%20movieapp.png" width="250"/><br>
## View Model
Bagian viewmodel berisi mekanisme bagaimana request data json ke server dan response dari server diterima lewat internet. Dalam proses ini digunakan method get dari paket http dengan parameter url endpoint. Dalam folder ini terdapat file fetchfilmsedangtayang.dart untuk request data film yang sedang tayang yang digunakan dalam layout daftar film dan detailnya.
## Paket yang Digunakan
http: ^0.13.5 (https://pub.dev/packages/http)
## Referensi
Dokumentasi JSON API dan URL endpoint yang digunakan di program dapat diakses di: https://developers.themoviedb.org/3/getting-started/introduction
