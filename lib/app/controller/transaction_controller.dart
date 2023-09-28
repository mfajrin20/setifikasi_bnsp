import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:setifikasi_bnsp/app/Model/transaction_model.dart';
import 'package:setifikasi_bnsp/app/services/database_service.dart';
import 'package:sqflite/sqflite.dart';
import 'package:lecle_downloads_path_provider/lecle_downloads_path_provider.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

class TransactionController extends GetxController {
  late Database db;
  RxList<TransactionModel> transactionModel = <TransactionModel>[].obs;

  Future<void> getTransaction() async {
    // get data form db
    final dataFromDb = await db.query('transactions');
    if (dataFromDb.isNotEmpty) {
      print(dataFromDb);
      List<TransactionModel> parseToModel = transactionModelFromList(dataFromDb);
      transactionModel.value = parseToModel;
      transactionModel.refresh();
    }
  }

  Future<void> addTransaction(
    TransactionType transactionType, {
    required DateTime date,
    required String amount,
    required String description,
    required int userId,
  }) async {
    // parseAmount because by deffault amount = 10.000 String
    double parseAmount = double.parse(amount.replaceAll('.', ''));
    final parseToModel = TransactionModel(
      amount: parseAmount,
      description: description,
      transactionDate: date,
      userId: userId,
      transactionType: transactionType,
    );
    print(parseToModel.transactionDate!.hour);
    // insert to db
    await db.insert('transactions', parseToModel.toPost());

    // update data model
    final dataFromDB = await db.query('transactions'); // take data form db
    final newTransactionModel = transactionModelFromList(dataFromDB)
      ..sort(
        (a, b) => b.transactionDate!.compareTo(a.transactionDate!),
      );
    transactionModel.value = newTransactionModel;
    transactionModel.refresh();
    refresh();
    print(transactionModel.toJson());
  }

  Future<void> exportDatabase() async {
    // Dapatkan path external storage
    Directory? downloadDir = await DownloadsPath.downloadsDirectory();

    // file database name in local
    String localDatabaseName = "app_data.db";
    // file name when export
    String exportFileName = "app_data.db";

    if (downloadDir != null) {
      // tentukan path lengkap file export
      String exportPath = path.join(downloadDir.path, exportFileName);

      try {
        // dapatkan path database
        String currentDBPath = '${await getDatabasesPath()}/$localDatabaseName';
        // copy database ke download
        await File(currentDBPath).copy(exportPath);
        showSnackBar(
          context: Get.context!,
          backgroundColor: Colors.green,
          contentText: 'Succes export in $exportPath',
        );
      } catch (e) {
        showSnackBar(
          context: Get.context!,
          backgroundColor: Colors.red,
          contentText: 'Error',
        );
        print(e.toString());
      }
    }
  }

  void showSnackBar({
    required BuildContext context,
    required String contentText,
    Color? backgroundColor,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: backgroundColor,
        content: Text(
          contentText,
        ),
      ),
    );
  }

  @override
  void onInit() async {
    db = await DatabaseHelper.instance.database;
    getTransaction();
    super.onInit();
  }
}
