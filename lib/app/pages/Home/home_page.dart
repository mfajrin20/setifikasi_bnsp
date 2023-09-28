import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:setifikasi_bnsp/app/Model/transaction_model.dart';
import 'package:setifikasi_bnsp/app/controller/auth_controller.dart';
import 'package:setifikasi_bnsp/app/controller/transaction_controller.dart';
import 'package:setifikasi_bnsp/app/router/app_pages.dart';
import 'package:setifikasi_bnsp/app/theme/app_theme.dart';
import 'package:setifikasi_bnsp/app/util/extension.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../Model/StyleModel.dart';

class HomePage extends GetView {
  HomePage({Key? key}) : super(key: key);

  final transactionController = Get.find<TransactionController>();
  final authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Obx(
      () {
        List<TransactionModel> dataThisMont = [];
        double incomeMonth = 0;
        double expenseMonth = 0;

        if (transactionController.transactionModel.isNotEmpty) {
          // when data notEmpty only
          // get data by month
          transactionController.transactionModel.forEach((element) {
            final dateNow = DateTime.now();
            if (element.transactionDate!.year == dateNow.year &&
                element.transactionDate!.month == dateNow.month) {
              dataThisMont.add(element);
            }
          });

          // Loop dataThisMonth to get INCOME this month
          for (var element in dataThisMont) {
            if (element.transactionType == TransactionType.INCOME) {
              // Income transaction
              incomeMonth += element.amount!;
            } else {
              // Expanse transaction
              expenseMonth += element.amount!;
            }
          }
        }

        return Scaffold(
          // backgroundColor: Colors.blue,
          // appBar: _buildAppBarHome(),
          body: SingleChildScrollView(
            padding: EdgeInsets.only(
                left: kDeffaultPadding,
                right: kDeffaultPadding,
                bottom: mediaQuery.padding.bottom,
                top: mediaQuery.padding.top + kDeffaultPadding),
            child: Column(children: <Widget>[
              _header(incomeMonth, expenseMonth),
              // _chartTraffic(context, dataThisMont),
              SizedBox(
                height: kDeffaultPadding,
              ),
              _ChartHome(data: dataThisMont),
              SizedBox(
                height: kDeffaultPadding,
              ),
              _menuButton(context),
            ]),
          ),
        );
      },
    );
  }

  Column _header(double incomeMonth, double expanseMonth) {
    return Column(
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
          child: Center(
            // Menggunakan Center untuk menengahkan DataTable
            child: Column(
              children: <Widget>[
                const SizedBox(height: 10),
                DataTable(
                  columns: [
                    DataColumn(
                      label: Text(
                        'Pemasukan :',
                        style: kKriteriaColum,
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        currencyFormat(incomeMonth.toString()),
                        style: kKriteriaColum,
                      ),
                    ),
                  ],
                  rows: <DataRow>[
                    DataRow(
                      cells: <DataCell>[
                        DataCell(
                          Text(
                            'Pengeluaran :',
                            style: kKriteriaColum,
                          ),
                        ),
                        DataCell(
                          Text(
                            currencyFormat(expanseMonth.toString()),
                            style: kKriteriaColum,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _menuButton(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Menu',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: kSmallPadding,
        ),
        Card(
          child: GridView.count(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(vertical: kSmallPadding),
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
                margin: const EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0),
                child: InkWell(
                  onTap: () {
                    Get.toNamed(Routes.pemasukan);
                    // Get.to(() => const DataPemainAnchor(),
                    //     binding: AnchorBinding());
                    // Navigator.push(
                    //     context, MaterialPageRoute(builder: (context) => const Pemasukan()));
                  },
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Image.asset(
                          'assets/icons/in.png',
                          scale: 3,
                        ),
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
                margin: const EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0),
                child: InkWell(
                  onTap: () {
                    Get.toNamed(Routes.pengeluaran);
                    // Get.to(() => const DataPemainAnchor(),
                    //     binding: AnchorBinding());
                    // Navigator.push(
                    //     context, MaterialPageRoute(builder: (context) => const Pengeluaran()));
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
                margin: const EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0),
                child: InkWell(
                  onTap: () {
                    Get.toNamed(Routes.detailCashflow);
                    // Get.to(() => const DataPemainFlank(),
                    //     binding: FlankBinding());
                    // Navigator.push(
                    //     context, MaterialPageRoute(builder: (context) => const Csf()));
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
                margin: const EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0),
                child: InkWell(
                  onTap: () {
                    Get.toNamed(Routes.pengaturan);
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
      ],
    );
  }

  AppBar _buildAppBarHome() {
    return AppBar(
      elevation: 0.0,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 89, 84, 229), Color.fromARGB(255, 180, 115, 203)],
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
            authController.logout();
            // Tambahkan kode untuk melakukan log out di sini
          },
        ),
      ],
    );
  }
}

class _ChartHome extends StatelessWidget {
  const _ChartHome({required this.data});

  final List<TransactionModel> data;

  @override
  Widget build(BuildContext context) {
    // Sorting data by transactionDate
    data.sort(
      (a, b) => a.transactionDate!.compareTo(b.transactionDate!),
    );

    List<_ChartTransactionModel> newData = [];

    // List<TransactionModel> incomeData = [];
    // List<TransactionModel> expanseData = [];

    // loop data to get value perday
    // loop ini di gunakan agar data per hari itu menjadi satu data saja namun total nominal di jumlahkan
    // for (var transaction in data) {
    //   if (transaction.transactionType == TransactionType.INCOME) {
    //     // check transactionType
    //     int indexhCheckData = incomeData.indexWhere(// Check data in variable by Y-M-D date
    //         (e) => ymdFormat(e.transactionDate) == ymdFormat(transaction.transactionDate));
    //     if (indexhCheckData == -1) {
    //       // if the result is not -1 it means the data does not yet exist
    //       incomeData.add(transaction);
    //     } else {
    //       // data in variable by date is exist, maka di tambahkan saja nominal nya
    //       TransactionModel sameData = incomeData[indexhCheckData];
    //       final TransactionModel newData = sameData.copyWith(
    //         amount: sameData.amount! + transaction.amount!,
    //         // transactionDate: transaction.transactionDate,
    //       );

    //       // data yang sebelumnya ada di variable di hapus dan di masukkan data yang baru yang sudah di jumlahkan nominal nya
    //       incomeData.removeAt(indexhCheckData);
    //       incomeData.insert(indexhCheckData, newData);
    //     }
    //   } else {
    //     // data is EXPANSE
    //     // check transactionType
    //     int indexhCheckData = expanseData.indexWhere(// Check data in variable by Y-M-D date
    //         (e) => ymdFormat(e.transactionDate) == ymdFormat(transaction.transactionDate));
    //     if (indexhCheckData == -1) {
    //       // if the result is not -1 it means the data does not yet exist
    //       expanseData.add(transaction);
    //     } else {
    //       // data in variable by date is exist, maka di tambahkan saja nominal nya
    //       TransactionModel sameData = expanseData[indexhCheckData];
    //       final TransactionModel newData = sameData.copyWith(
    //         amount: sameData.amount! + transaction.amount!,
    //         transactionDate: transaction.transactionDate,
    //       );

    //       // data yang sebelumnya ada di variable di hapus dan di masukkan data yang baru yang sudah di jumlahkan nominal nya
    //       expanseData.removeAt(indexhCheckData);
    //       expanseData.insert(indexhCheckData, newData);
    //     }
    //   }
    // }

    // loop data to get value perday
    // loop ini di gunakan agar data per hari itu menjadi satu data saja namun total nominal di jumlahkan
    for (var transaction in data) {
      // check transaction date format Y-M-D
      // agar mendapat kan data by date nya
      int indexCheckData = newData.indexWhere(
          (e) => ymdFormat(e.transactionDate) == ymdFormat(transaction.transactionDate));
      if (indexCheckData == -1) {
        // -1 berarti data perhari nya belum ada
        // maka add data
        newData.add(
          _ChartTransactionModel(
            transactionDate: transaction.transactionDate,
            expanse:
                transaction.transactionType == TransactionType.EXPANSE ? transaction.amount : 0,
            income: transaction.transactionType == TransactionType.INCOME ? transaction.amount : 0,
          ),
        );
      } else {
        // maka data sudah ada lalu tinggal menjumlahkan datanya saja
        _ChartTransactionModel sameData = newData[indexCheckData];
        // ketika element yang di looping adalah INCOME maka element nominal nya ditambahkan dengan data sebelumnya
        // jika tidak maka data tidak berubah
        _ChartTransactionModel newSameData = sameData.copyWith(
          income: transaction.transactionType == TransactionType.INCOME
              ? sameData.income! + transaction.amount!
              : sameData.income,
          expanse: transaction.transactionType == TransactionType.EXPANSE
              ? sameData.expanse! + transaction.amount!
              : sameData.expanse,
        );
        // data yang sudah ada di newData di hapus dulu lalu di inseert kan data yang baru
        newData.removeAt(indexCheckData);
        newData.insert(indexCheckData, newSameData);
      }
      // if (transaction.transactionType == TransactionType.INCOME) {}
    }

    // sorting income & expanse data by transactionDate
    // incomeData.sort(
    //   (a, b) => a.transactionDate!.compareTo(b.transactionDate!),
    // );
    // expanseData.sort(
    //   (a, b) => a.transactionDate!.compareTo(b.transactionDate!),
    // );
    newData.forEach((element) {
      print(element.toJson());
    });

    return Container(
      // width: MediaQuery.of(context).size.width * 0.80, // Sesuaikan lebar sesuai kebutuhan
      // height: MediaQuery.of(context).size.height * 0.20, // Sesuaikan tinggi sesuai kebutuhan
      padding: EdgeInsets.symmetric(
        horizontal: kDeffaultPadding,
        vertical: kDeffaultPadding,
      ),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 53, 34, 60),
        // gradient: LinearGradient(
        //   colors: [Color.fromARGB(255, 114, 222, 107), Color.fromARGB(255, 180, 115, 203)],
        // ),
        borderRadius: BorderRadius.circular(20),
      ),
      // ... tambahkan child atau isi konten di sini ...
      child: SfCartesianChart(
        borderColor: Colors.white,
        plotAreaBorderColor: Colors.white,
        // plotAreaBackgroundColor: Colors.white,
        backgroundColor: Colors.transparent,
        primaryXAxis: DateTimeAxis(
            labelStyle: TextStyle(color: Colors.white), intervalType: DateTimeIntervalType.days),
        primaryYAxis: NumericAxis(labelStyle: TextStyle(color: Colors.white)),
        legend: const Legend(
            isVisible: true,
            position: LegendPosition.bottom,
            textStyle: TextStyle(color: Colors.white)),
        tooltipBehavior: TooltipBehavior(enable: true),
        series: <ChartSeries<_ChartTransactionModel, DateTime>>[
          StackedLineSeries(
            dataSource: newData,
            name: 'Pemasukan',
            color: Colors.green,
            xValueMapper: (transaction, index) => transaction.transactionDate,
            yValueMapper: (transaction, index) => transaction.income,
            markerSettings: MarkerSettings(
              isVisible: true,
              height: 4,
              width: 4,
              // shape: DataMarkerType.Circle,
              color: Colors.amber,
              borderWidth: 3,
              borderColor: Colors.blueGrey,
            ),
          ),
          StackedLineSeries(
            dataSource: newData,
            name: 'Pengeluaran',
            color: Colors.red,
            xValueMapper: (transaction, index) => transaction.transactionDate,
            yValueMapper: (transaction, index) => transaction.expanse,
            markerSettings: MarkerSettings(
              isVisible: true,
              height: 4,
              width: 4,
              // shape: DataMarkerType.Circle,
              color: Colors.amber,
              borderWidth: 3,
              borderColor: Colors.blueGrey,
            ),
          ),
        ],
      ),
    );
  }
}

class _ChartTransactionModel {
  _ChartTransactionModel({
    this.transactionDate,
    this.income,
    this.expanse,
  });
  DateTime? transactionDate;
  double? income, expanse;

  _ChartTransactionModel copyWith({
    DateTime? transactionDate,
    double? income,
    double? expanse,
  }) =>
      _ChartTransactionModel(
        transactionDate: transactionDate ?? this.transactionDate,
        income: income ?? this.income,
        expanse: expanse ?? this.expanse,
      );

  Map<String, dynamic> toJson() {
    return {
      'transaction_date': transactionDate,
      'income': income,
      'expanse': expanse,
    };
  }
}
