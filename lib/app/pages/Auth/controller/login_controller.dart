import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  late GlobalKey<FormState> formKey;
  late TextEditingController emailC;
  late TextEditingController passwordC;

  @override
  void onInit() {
    formKey = GlobalKey<FormState>();
    emailC = TextEditingController();
    passwordC = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    emailC.dispose();
    passwordC.dispose();
    super.dispose();
  }
}
