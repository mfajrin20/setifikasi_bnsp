import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:setifikasi_bnsp/app/Model/transaction_model.dart';
import 'package:setifikasi_bnsp/app/theme/app_theme.dart';
import 'package:setifikasi_bnsp/app/util/extension.dart';
import 'package:setifikasi_bnsp/app/widget/item_list_tile.dart';
import '../../Model/StyleModel.dart';
import '../../controller/transaction_controller.dart';
import 'package:setifikasi_bnsp/app/widget/button_with_gradient.dart';

class DetailCashFlowPage extends StatefulWidget {
  const DetailCashFlowPage({Key? key}) : super(key: key);

  @override
  State<DetailCashFlowPage> createState() => _DetailCashFlowPageState();
}

class _DetailCashFlowPageState extends State<DetailCashFlowPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "DETAIL CASH FLOW",
          style: Seeting3,
          textAlign: TextAlign.center,
        ),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Expanded(
            child: GetBuilder<TransactionController>(
              builder: (controller) {
                List<TransactionModel> transactionModel = controller.transactionModel;
                if (transactionModel.isEmpty) {
                  return Center(
                    child: Text('Belum ada transaksi'),
                  );
                }
                return ListView.separated(
                  padding: EdgeInsets.all(kDeffaultPadding),
                  itemCount: transactionModel.length,
                  separatorBuilder: (context, index) => Divider(),
                  itemBuilder: (context, index) {
                    final transaction = transactionModel[index];
                    bool income = transaction.transactionType == TransactionType.INCOME;
                    return ItemRecentTile(
                      income: income,
                      subtitle: ymdFormat(transaction.transactionDate),
                      trailing: currencyFormat(transaction.amount.toString()),
                      title: transaction.description!,
                      onTap: () {},
                    );
                  },
                );
              },
            ),
          ),
          SizedBox(height: 20), // Jarak antara ListView dan tombol
          ButtonWithGradient(
            onPressed: () => Get.back(),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.arrow_back, // Ganti dengan ikon yang Anda inginkan
                  color: Colors.white,
                ),
                SizedBox(width: 8), // Jarak antara ikon dan teks
                Text(
                  "KEMBALI",
                  textAlign: TextAlign.center,
                  style: kLogin,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
