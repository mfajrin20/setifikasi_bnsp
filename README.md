# setifikasi_bnsp

A new Flutter project.

## PENJELASAN

Aplikasi yang dibangun menggunakan bahasa Dart dengan Flutter adalah aplikasi mobile yang dapat berjalan di platform Android dan iOS. Dart adalah bahasa pemrograman yang digunakan untuk mengembangkan aplikasi dengan Flutter, yang merupakan framework UI dari Google untuk membuat antarmuka pengguna yang indah dan responsif.

Dalam aplikasi yang menggunakan Flutter dengan basis bahasa Dart, penggunaan database lokal biasanya melibatkan penggunaan library atau package seperti get_storage dan sqflite. 

1. get_storage:
get_storage adalah package Flutter yang digunakan untuk menyimpan data secara lokal di perangkat pengguna dalam bentuk key-value pairs. Ini sering digunakan untuk menyimpan data sederhana seperti pengaturan aplikasi, preferensi pengguna, atau data kecil lainnya yang perlu dipertahankan di antara sesi aplikasi.
Dengan get_storage, dapat dengan mudah menyimpan, mengambil, dan menghapus data dari penyimpanan lokal tanpa perlu berurusan dengan query SQL atau tabel. Ini menyederhanakan penggunaan penyimpanan lokal.
Contoh penggunaan get_storage untuk menyimpan dan mengambil data:
import 'package:get_storage/get_storage.dart';

// Inisialisasi penyimpanan lokal

final box = GetStorage();

// Menyimpan data

box.write('nama', 'John');

// Mengambil data

var nama = box.read('nama');

3. sqflite:
sqflite adalah package Flutter yang digunakan untuk mengelola database SQLite lokal di aplikasi Flutter. SQLite adalah sistem manajemen basis data relasional (RDBMS) yang ringan dan sering digunakan untuk menyimpan data struktural dalam aplikasi mobile.
Dengan sqflite, dapat membuat tabel, menambahkan data, mengambil data, memperbarui data, dan menghapus data dari database SQLite di aplikasi.
Contoh penggunaan sqflite untuk membuat tabel dan mengambil data:
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

// Inisialisasi database

final database = openDatabase(
  join(await getDatabasesPath(), 'my_database.db'),
  onCreate: (db, version) {
    // Membuat tabel
    return db.execute(
      "CREATE TABLE my_table(id INTEGER PRIMARY KEY, name TEXT, email TEXT)",
    );
  },
  version: 1,
);

// Menambahkan data ke tabel

await database.insert(
  'my_table',
  {
    'name': 'John',
    'email': 'john@example.com',
  },
  conflictAlgorithm: ConflictAlgorithm.replace,
);


// Mengambil data dari tabel

final List<Map<String, dynamic>> data = await database.query('my_table');

// Menutup database saat selesai

await database.close();


