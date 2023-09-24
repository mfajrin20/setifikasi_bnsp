import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tabler_icons/tabler_icons.dart';
import '../../Model/StyleModel.dart';
import '../Home/Beranda.dart';

class Pengaturan extends StatefulWidget {
  const Pengaturan({Key? key}) : super(key: key);

  @override
  State<Pengaturan> createState() => _PengaturanState();
}

class _PengaturanState extends State<Pengaturan> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: const Text(
                    "PENGATURAN",
                    style: Seeting,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: const Text(
                    "GANTI PASSWORD",
                    style: kKogin,
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Form(
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Password Saat Ini";
                            }
                            if (!GetUtils.isEmail(value)) {
                              return "Password Saat Ini Tidak Valid";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            labelText: "Password Saat Ini",
                            icon: Icon(
                              TablerIcons.password,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                        SizedBox(height: size.height * 0.03),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: "Password Baru",
                            icon: const Icon(
                              TablerIcons.password,
                              color: Colors.black54,
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Password Baru harus di isi";
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.02),
                Container(
                  alignment: Alignment.center,
                  child: MaterialButton(
                    onPressed: () async {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Beranda()));
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80.0)),
                    textColor: Colors.white,
                    padding: const EdgeInsets.all(0),
                    child: Container(
                      alignment: Alignment.center,
                      height: 50.0,
                      width: size.width * 0.5,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(80.0),
                          gradient: const LinearGradient(colors: [
                            Color.fromARGB(255, 38, 132, 197),
                            Color.fromARGB(255, 236, 209, 102)
                          ])),
                      padding: const EdgeInsets.all(0),
                      child: const Text(
                        "SIMPAN",
                        textAlign: TextAlign.center,
                        style: kLogin,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.02),
                Container(
                  alignment: Alignment.center,
                  child: MaterialButton(
                    onPressed: () async {
                      Navigator.pop(context);
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80.0)),
                    textColor: Colors.white,
                    padding: const EdgeInsets.all(0),
                    child: Container(
                      alignment: Alignment.center,
                      height: 50.0,
                      width: size.width * 0.5,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(80.0),
                          gradient: const LinearGradient(colors: [
                            Color.fromARGB(255, 38, 132, 197),
                            Color.fromARGB(255, 236, 209, 102)
                          ])),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.arrow_back, // Ganti dengan ikon yang Anda inginkan
                            color: Colors.white,
                          ),
                          const SizedBox(width: 8), // Jarak antara ikon dan teks
                          const Text(
                            "KEMBALI",
                            textAlign: TextAlign.center,
                            style: kLogin,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.05),
                Container(
                  width: MediaQuery.of(context).size.width * 0.90, // Sesuaikan lebar sesuai kebutuhan
                  height: MediaQuery.of(context).size.height * 0.30, // Sesuaikan tinggi sesuai kebutuhan
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(255, 114, 222, 107),
                        Color.fromARGB(255, 180, 115, 203)
                      ],
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  margin: const EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0),
                  child: Row(
                    children: [
                      // Gambar/Foto
                      Container(
                        width: MediaQuery.of(context).size.width * 0.40, // Lebar gambar
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                          ),
                          image: DecorationImage(
                            image: AssetImage('assets/icons/login.png'), // Ganti dengan path gambar Anda
                            fit: BoxFit.cover, // Sesuaikan dengan kebutuhan
                          ),
                        ),
                      ),
                      // Deskripsi
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Tentang Aplikasi Ini', // Ganti dengan deskripsi yang sesuai
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 8), // Jarak antara judul dan teks deskripsi
                              Text(
                                'Aplikasi ini dibuat oleh',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'Nama : M. Fajrin',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'Nim : 1941720010',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'Tgl : 24 September 2023',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

