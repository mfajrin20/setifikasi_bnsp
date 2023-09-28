import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PengaturanController extends GetxController {
  late GlobalKey<FormState> formKey;
  late TextEditingController passwordC;
  late TextEditingController newPasswordC;
  late FocusNode passwordFocus;
  late FocusNode newPasswordFocus;

  RxBool isWrongPassword = false.obs;

  @override
  void onInit() {
    formKey = GlobalKey<FormState>();
    passwordC = TextEditingController();
    newPasswordC = TextEditingController();
    passwordFocus = FocusNode();
    newPasswordFocus = FocusNode();
    super.onInit();
  }

  @override
  void dispose() {
    passwordC.dispose();
    newPasswordC.dispose();
    super.dispose();
  }
}
