import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:setifikasi_bnsp/app/Model/transaction_model.dart';
import 'package:setifikasi_bnsp/app/pages/pengeluaran/controller/pengeluaran_controller.dart';
import 'package:setifikasi_bnsp/app/theme/app_theme.dart';
import 'package:setifikasi_bnsp/app/util/extension.dart';
import 'package:setifikasi_bnsp/app/widget/button_with_gradient.dart';
import 'package:setifikasi_bnsp/app/widget/currenct_input_formatter.dart';
import '../../Model/StyleModel.dart';
import '../../controller/auth_controller.dart';
import '../../controller/transaction_controller.dart';

class PengeluaranPage extends GetView<PengeluaranController> {
  PengeluaranPage({super.key});

  final transactionController = Get.find<TransactionController>();
  final authController = Get.find<AuthController>();

  void _onSave() {
    // validate Form
    if (controller.formKey.currentState!.validate()) {
      EasyLoading.show();
      transactionController.addTransaction(
        TransactionType.EXPANSE,
        date: controller.tempDatePicked,
        amount: controller.nominalC.text,
        description: controller.keteranganC.text,
        userId: authController.userModel.value.id!,
      );
      EasyLoading.showSuccess('Berhasil di tambahkan');
      controller.tanggalC.clear();
      controller.nominalC.clear();
      controller.keteranganC.clear();
    }
  }

  void _onReset() {
    controller.tanggalC.text = ymdFormat(DateTime(2021));
    controller.nominalC.clear();
    controller.keteranganC.clear();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  child: const Text(
                    "TAMBAH PENGELUARAN",
                    style: Seeting2,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: kDeffaultPadding),
                _formTextField(context),
                _buttons(size)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column _buttons(Size size) {
    return Column(
      children: [
        const SizedBox(height: kDeffaultPadding),
        ButtonWithGradient(
          onPressed: _onSave,
          child: const Text(
            "SIMPAN",
            textAlign: TextAlign.center,
            style: kLogin,
          ),
        ),
        const SizedBox(height: kDeffaultPadding),
        ButtonWithGradient(
          onPressed: _onReset,
          child: const Text(
            "RESET",
            textAlign: TextAlign.center,
            style: kLogin,
          ),
        ),
        const SizedBox(height: kDeffaultPadding),
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
    );
  }

  Form _formTextField(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Column(
        children: [
          TextFormField(
            onTap: () {
              controller.openDatePicker(context);
            },
            validator: (value) {
              if (value!.isEmpty) {
                return "Tanggal belum di isi";
              }
              return null;
            },
            controller: controller.tanggalC,
            decoration: const InputDecoration(
              labelText: "Tanggal",
              suffixIcon: Icon(Icons.calendar_today),
            ),
            readOnly: true, // Membuat TextField hanya untuk tampilan
          ),
          TextFormField(
            controller: controller.nominalC,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              CurrencyInputFormatter(),
            ],
            validator: (value) {
              if (value!.isEmpty) {
                return "Nominal";
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: "Nominal",
              prefixIcon: Text(
                "Rp",
              ),
              prefixIconConstraints: BoxConstraints(minWidth: 30, minHeight: 0),
            ),
          ),
          const SizedBox(height: kDeffaultPadding),
          TextFormField(
            controller: controller.keteranganC,
            decoration: const InputDecoration(
              labelText: "Keterangan",
            ),
            textInputAction: TextInputAction.send,
            onFieldSubmitted: (_) {
              _onSave();
            },
            validator: (value) {
              if (value!.isEmpty) {
                return "Keterangan Baru harus di isi";
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
