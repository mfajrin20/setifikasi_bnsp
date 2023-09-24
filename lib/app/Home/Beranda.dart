import 'package:flutter/material.dart';
import 'package:setifikasi_bnsp/app/Fitur/DetailCashFlow.dart';
import 'package:setifikasi_bnsp/app/Fitur/Pemasukan.dart';
import 'package:setifikasi_bnsp/app/Fitur/Pengaturan.dart';
import 'package:setifikasi_bnsp/app/Fitur/Pengeluaran.dart';
import '../../Model/StyleModel.dart';
class Beranda extends StatefulWidget {
  const Beranda({Key? key}) : super(key: key);

  @override
  State<Beranda> createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      // backgroundColor: Colors.blue,
        appBar: AppBar(
          elevation: 0.0,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 89, 84, 229),
                  Color.fromARGB(255, 180, 115, 203)
                ],
                begin: FractionalOffset(0.0, 0.0),
                end: FractionalOffset(1.0, 0.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp,
              ),
            ),
          ),
          automaticallyImplyLeading: false, // This line removes the back button
          actions: [
            IconButton(
              icon: Icon(Icons.logout), // Ganti dengan ikon log out yang sesuai
              onPressed: () {
                // Tambahkan kode untuk melakukan log out di sini
              },
            ),
          ],
        ),

      body: Center(
          child: Column(children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  child: const Text(
                    "Rangkuman Bulan Ini",
                    style: kTittleHomee,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Center( // Menggunakan Center untuk menengahkan DataTable
                    child: Column(
                      children: <Widget>[
                        const SizedBox(height: 10),
                        DataTable(
                          columns: const [
                            DataColumn(
                              label: Text(
                                'Pemasukan Rp.',
                                style: kKriteriaColum,
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                '10.000.000',
                                style: kKriteriaColum,
                              ),
                            ),
                          ],
                          rows: const <DataRow>[
                            DataRow(
                              cells: <DataCell>[
                                DataCell(Text(
                                  'Pengeluaran Rp.',
                                  style: kKriteriaColum,
                                )),
                                DataCell(Text(
                                  '2.000.000',
                                  style: kKriteriaColum,
                                )),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.80, // Sesuaikan lebar sesuai kebutuhan
              height: MediaQuery.of(context).size.height * 0.20, // Sesuaikan tinggi sesuai kebutuhan
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
              // ... tambahkan child atau isi konten di sini ...
            ),
            Flexible(
              child: GridView.count(
                padding: const EdgeInsets.all(20),
                crossAxisCount: 2,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Color.fromARGB(255, 114, 222, 107),
                        Color.fromARGB(255, 180, 115, 203)
                      ]),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    margin:
                    const EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0),
                    child: InkWell(
                      onTap: () {
                        // Get.to(() => const DataPemainAnchor(),
                        //     binding: AnchorBinding());
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Pemasukan()));
                      },
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ClipRRect(
                                //borderRadius: BorderRadius.circular(50.0),
                                child: Image.asset(
                                  'assets/icons/in.png',
                                  scale:3,
                                )),
                            const Text(
                              'Tambah Pemasukan',
                              style: style,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Color.fromARGB(255, 114, 222, 107),
                        Color.fromARGB(255, 180, 115, 203)
                      ]),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    margin:
                    const EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0),
                    child: InkWell(
                      onTap: () {
                        // Get.to(() => const DataPemainAnchor(),
                        //     binding: AnchorBinding());
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Pengeluaran()));
                      },
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ClipRRect(
                               // borderRadius: BorderRadius.circular(50.0),
                                child: Image.asset(
                                  'assets/icons/out.png',
                                  scale: 3,
                                )),
                            const Text(
                              'Tambah Pengeluaran',
                              style: style,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Color.fromARGB(255, 229, 192, 97),
                        Color.fromARGB(255, 180, 115, 203)
                      ]),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    margin:
                    const EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0),
                    child: InkWell(
                      onTap: () {
                        // Get.to(() => const DataPemainFlank(),
                        //     binding: FlankBinding());
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Csf()));
                      },
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ClipRRect(
                                //borderRadius: BorderRadius.circular(50.0),
                                child: Image.asset(
                                  'assets/icons/csf.png',
                                  scale: 3,
                                )),
                            const Text(
                              'Detail Cash Flow',
                              style: style,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Color.fromARGB(255, 234, 163, 97),
                        Color.fromARGB(255, 180, 115, 203)
                      ]),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    margin:
                    const EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0),
                    child: InkWell(
                      onTap: () {
                        // Get.to(() => const DataPemainPivot(),
                        //     binding: PivotBinding());
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Pengaturan()));
                      },
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ClipRRect(
                                //borderRadius: BorderRadius.circular(50.0),
                                child: Image.asset(
                                  'assets/icons/setting.png',
                                  scale: 3,
                                )),
                            const Text(
                              'Pengaturan',
                              style: style,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ));
  }
}
