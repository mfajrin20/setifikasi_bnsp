import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:setifikasi_bnsp/app/util/extension.dart';

class PengeluaranController extends GetxController {
  late GlobalKey<FormState> formKey;
  late TextEditingController tanggalC;
  late TextEditingController nominalC;
  late TextEditingController keteranganC;

  late DateTime tempDatePicked;

  Future<void> openDatePicker(BuildContext context) async {
    DateTime? pickDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015),
      lastDate: DateTime(2040),
    );
    if (pickDate != null) {
      final dateNow = DateTime.now();
      if (pickDate.year == dateNow.year &&
          pickDate.month == dateNow.month &&
          pickDate.day == dateNow.day) {
        pickDate = dateNow;
      }
      tempDatePicked = pickDate;

      String parse = ymdFormat(pickDate); // parse to Y-M-D String format
      tanggalC.text = parse;
      refresh();
    }
  }

  @override
  void onInit() {
    formKey = GlobalKey<FormState>();
    tanggalC = TextEditingController();
    keteranganC = TextEditingController();
    nominalC = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    tanggalC.dispose();
    keteranganC.dispose();
    nominalC.dispose();
    super.dispose();
  }
}
