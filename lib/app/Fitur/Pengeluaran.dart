import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Model/StyleModel.dart';
import '../Home/Beranda.dart';

class Pengeluaran extends StatefulWidget {
  const Pengeluaran({Key? key}) : super(key: key);

  @override
  State<Pengeluaran> createState() => _PengeluaranState();
}

class _PengeluaranState extends State<Pengeluaran> {
  @override
  Widget build(BuildContext context) {
    String selectedDate = ''; // Variabel untuk menyimpan tanggal yang dipilih
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
                    "TAMBAH PENGELUARAN",
                    style: Seeting2,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Form(
                    child: Column(
                      children: [
                        TextField(
                          decoration: InputDecoration(
                            labelText: "Tanggal",
                            suffixIcon: IconButton(
                              icon: Icon(Icons.calendar_today), // Icon yang akan menampilkan Date Picker
                              onPressed: () {
                                // Tambahkan kode untuk menampilkan Date Picker di sini
                                showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2101),
                                ).then((date) {
                                  // Periksa apakah pengguna telah memilih tanggal
                                  if (date != null) {
                                    setState(() {
                                      // Update nilai selectedDate dengan tanggal yang dipilih
                                      //selectedDate = DateFormat('dd/MM/yyyy').format(date);
                                    });
                                  }
                                });
                              },
                            ),
                          ),
                          controller: TextEditingController(text: selectedDate), // Menampilkan tanggal yang dipilih
                          readOnly: true, // Membuat TextField hanya untuk tampilan
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Nominal";
                            }
                            if (!GetUtils.isEmail(value)) {
                              return "Nominal yang anda masukan salah";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            labelText: "Nominal Rp",
                          ),
                        ),
                        SizedBox(height: size.height * 0.03),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: "Keterangan",
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Keterangan Baru harus di isi";
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
                        "RESET",
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

