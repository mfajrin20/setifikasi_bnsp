import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:setifikasi_bnsp/app/controller/auth_controller.dart';
import 'package:setifikasi_bnsp/app/controller/transaction_controller.dart';
import 'package:setifikasi_bnsp/app/pages/pengaturan/controller/pengaturan_controller.dart';
import 'package:setifikasi_bnsp/app/theme/app_theme.dart';
import 'package:setifikasi_bnsp/app/widget/button_with_gradient.dart';
import 'package:tabler_icons/tabler_icons.dart';
import '../../Model/StyleModel.dart';

class PengaturanPage extends GetView<PengaturanController> {
  PengaturanPage({Key? key}) : super(key: key);

  final authController = Get.find<AuthController>();
  final transactionController = Get.find<TransactionController>();

  void _onSavePassword() async {
    if (controller.formKey.currentState!.validate()) {
      final userModel = authController.userModel.value;
      if (controller.passwordC.text == userModel.password) {
        await authController.updatePassword(
          userModel.id!,
          controller.newPasswordC.text,
        );
        controller.passwordC.clear();
        controller.newPasswordC.clear();
      } else {
        EasyLoading.showError('Password salah');
        controller.passwordFocus.requestFocus();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kLargePadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  child: const Text(
                    "PENGATURAN",
                    style: Seeting,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: kDeffaultPadding),
                Container(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    "GANTI PASSWORD",
                    style: kKogin,
                    textAlign: TextAlign.center,
                  ),
                ),
                Form(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: controller.passwordC,
                        focusNode: controller.passwordFocus,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Password Saat Ini";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          labelText: "Password Saat Ini",
                          icon: Icon(
                            TablerIcons.password,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                      SizedBox(height: kDeffaultPadding),
                      TextFormField(
                        controller: controller.newPasswordC,
                        decoration: InputDecoration(
                          labelText: "Password Baru",
                          icon: const Icon(
                            TablerIcons.password,
                            color: Colors.black54,
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Password Baru harus di isi";
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: kDeffaultPadding),
                // Simpan
                ButtonWithGradient(
                  onPressed: _onSavePassword,
                  child: const Text(
                    "SIMPAN",
                    textAlign: TextAlign.center,
                    style: kLogin,
                  ),
                ),
                SizedBox(
                  height: kDeffaultPadding,
                ),
                // Export Database
                ButtonWithGradient(
                  onPressed: () => transactionController.exportDatabase(),
                  child: const Text(
                    "EXPORT DATABASE",
                    textAlign: TextAlign.center,
                    style: kLogin,
                  ),
                ),
                SizedBox(height: kDeffaultPadding),
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
                SizedBox(height: kDeffaultPadding),
                ButtonWithGradient(
                  onPressed: () => authController.logout(),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.logout, // Ganti dengan ikon yang Anda inginkan
                        color: Colors.white,
                      ),
                      SizedBox(width: 8), // Jarak antara ikon dan teks
                      Text(
                        "Log Out",
                        textAlign: TextAlign.center,
                        style: kLogin,
                      ),
                    ],
                  ),
                ),
               // SizedBox(height: kLargePadding),
                _aboutBox(context)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container _aboutBox(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.90, // Sesuaikan lebar sesuai kebutuhan
      height: MediaQuery.of(context).size.height * 0.30, // Sesuaikan tinggi sesuai kebutuhan
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color.fromARGB(255, 114, 222, 107), Color.fromARGB(255, 180, 115, 203)],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0),
      child: Row(
        children: [
          // Gambar/Foto
          Container(
            width: MediaQuery.of(context).size.width * 0.40, // Lebar gambar
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
              image: DecorationImage(
                image: AssetImage('assets/images/splashscreen/fajrin.jpeg'), // Ganti dengan path gambar Anda
                fit: BoxFit.cover, // Sesuaikan dengan kebutuhan
              ),
            ),
          ),
          // Deskripsi
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              child: FittedBox(
                // fit: BoxFit.fitHeight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tentang Aplikasi Ini', // Ganti dengan deskripsi yang sesuai
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      // overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 8), // Jarak antara judul dan teks deskripsi
                    Text(
                      'Aplikasi ini dibuat oleh',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                      // overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      'Nama : M. Fajrin',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                      // overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      'Nim : 1941720010',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                      // overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      'Tgl : 24 September 2023',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                      // overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
