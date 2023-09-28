import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:setifikasi_bnsp/app/Model/transaction_model.dart';
import 'package:setifikasi_bnsp/app/controller/auth_controller.dart';
import 'package:setifikasi_bnsp/app/controller/transaction_controller.dart';
import 'package:setifikasi_bnsp/app/pages/pemasukan/controller/pemasukan_controller.dart';
import 'package:setifikasi_bnsp/app/theme/app_theme.dart';
import 'package:setifikasi_bnsp/app/util/extension.dart';
import 'package:setifikasi_bnsp/app/widget/currenct_input_formatter.dart';

import '../../Model/StyleModel.dart';
import '../../widget/button_with_gradient.dart';

class PemasukanPage extends GetView<PemasukanController> {
  PemasukanPage({super.key});

  final transactionController = Get.find<TransactionController>();
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                // padding: const EdgeInsets.symmetric(horizontal: 0),
                child: const Text(
                  "TAMBAH PEMASUKAN",
                  style: Seeting,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: kDeffaultPadding),
              Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    // use GetBuilder because update widget when datePicked in controller
                    GetBuilder<PemasukanController>(
                      builder: (_) => TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Tanggal belum di isi";
                          }
                          return null;
                        },
                        controller: controller.tanggalC,
                        onTap: () {
                          controller.openDatePicker(context);
                        },
                        decoration: const InputDecoration(
                          labelText: "Tanggal",
                          suffixIcon: Icon(Icons.calendar_today),
                        ),

                        readOnly: true, // Membuat TextField hanya untuk tampilan
                      ),
                    ),
                    TextFormField(
                      controller: controller.nominalC,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Nominal";
                        }
                        return null;
                      },
                      // use inputFormatter because this textfield currency text
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        CurrencyInputFormatter(),
                      ],
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
              ),
              const SizedBox(
                height: kDeffaultPadding,
              ),
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
          ),
        ),
      ),
    );
  }

  void _onReset() {
    controller.tanggalC.text = ymdFormat(DateTime(2021));
    controller.tempDatePicked = DateTime(2021);
    controller.nominalC.clear();
    controller.keteranganC.clear();
  }

  void _onSave() async {
    // validate Form
    // print(controller.tempDatePicked.hour);
    if (controller.formKey.currentState!.validate()) {
      EasyLoading.show();
      await transactionController.addTransaction(
        TransactionType.INCOME,
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
}
