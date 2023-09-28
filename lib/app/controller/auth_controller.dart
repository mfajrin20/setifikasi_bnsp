import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:setifikasi_bnsp/app/router/app_pages.dart';
import 'package:setifikasi_bnsp/app/services/database_service.dart';
import 'package:sqflite/sqlite_api.dart';

import '../Model/user_model.dart';

class AuthController extends GetxController {
  late Database db;
  GetStorage box = GetStorage();

  Rx<UserModel> userModel = UserModel().obs;
  RxBool isLoading = false.obs;

  Future<void> login(String email, String password) async {
    /// Loading is active
    isLoading.toggle();

    // check data user in db
    final dataDb = await db.query('users');
    final indexCheck = dataDb.indexWhere((element) => element['email'] == email);
    if (indexCheck != -1) {
      // user find
      final userFromDb = dataDb[indexCheck]; // data dari database
      if (userFromDb['password'] == password) {
        // ketika password benar
        final dataUser = UserModel.fromJson(userFromDb);
        // insert to usermodel data
        userModel.value = dataUser;
        // refresh Rx
        userModel.refresh();

        // insert to getStorage
        await box.write('user', dataUser.toJson());
        Get.offAllNamed(Routes.home);
      } else {
        // ketika password salah
        await showDialog(
          context: Get.context!,
          builder: (context) {
            return AlertDialog(
              title: Text(
                'Password salah',
              ),
            );
          },
        );
      }
    } else {
      bool? isRegister = await _dialogRegister();
      if (isRegister ?? false) {
        final newUser = UserModel(email: email, password: password);

        // insert to db
        await db.insert('users', newUser.toDB());
        //find data user
        final userFromDb = await db.query('users');
        final dataUser = userFromDb
            .singleWhere((element) => element['email'] == email && element['password'] == password);
        // insert to model
        userModel.value = UserModel.fromJson(dataUser);
        userModel.refresh();
        Get.offAllNamed(Routes.home);
        // insert to getStorage
        box.write('user', userModel.toJson());
      }
    }

    /// loading to off
    isLoading.toggle();
  }

  Future<bool?> _dialogRegister() {
    return showDialog<bool>(
      context: Get.context!,
      builder: (context) {
        return AlertDialog(
          title: Text('User not found'),
          content: Text(
            'User tidak ditemukan, apakah ingin register user?',
          ),
          actions: [
            OutlinedButton(
              onPressed: () {
                Get.back(result: false);
              },
              child: Text('Cancel'),
            ),
            OutlinedButton(
              onPressed: () {
                Get.back<bool>(result: true);
              },
              child: Text('Yes'),
            ),
          ],
        );
      },
    );
  }

  Future<void> logout() async {
    /// Loading is active
    isLoading.toggle();

    // clearing userModel data
    userModel.value = UserModel();
    // refresh Rx
    userModel.refresh();
    refresh();
    // clearing in getStorage
    box.remove('user');

    /// loading to off
    isLoading.toggle();

    /// Go to login page
    Get.offAllNamed(Routes.login);
  }

  Future<UserModel?> initializeAuth() async {
    // check in storage
    final Map<String, dynamic>? dataFromStorage = box.read('user');
    if (dataFromStorage != null) {
      userModel.value = UserModel.fromJson(dataFromStorage);
      return userModel.value;
    }
    return null;
  }

  Future<void> updatePassword(int userId, String newPassword) async {
    try {
      EasyLoading.show();
      await db.update(
        'users',
        {
          'password': newPassword,
        },
        where: 'id = ?',
        whereArgs: [userId],
      );
      userModel.value.password = newPassword;
      EasyLoading.showSuccess('Password berhasil di update');
    } catch (e) {
      EasyLoading.showError('Terjadi kesalahan');
    }
  }

  @override
  void onInit() async {
    db = await DatabaseHelper.instance.database;
    super.onInit();
  }
}
