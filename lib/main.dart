import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:setifikasi_bnsp/app/controller/auth_controller.dart';
import 'package:setifikasi_bnsp/app/controller/transaction_controller.dart';
import 'package:setifikasi_bnsp/app/router/app_pages.dart';
import 'package:setifikasi_bnsp/app/services/database_service.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('id_ID');
  await DatabaseHelper.instance.database;
  await GetStorage.init();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final authController = Get.put(AuthController(), permanent: true);

  @override
  void initState() {
    Get.put(TransactionController(), permanent: true);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Use future builder to initialize user login
    return FutureBuilder(
      future: authController.initializeAuth(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return GetMaterialApp(
            theme: ThemeData(useMaterial3: true),
            debugShowCheckedModeBanner: false,
            initialRoute: snapshot.data?.id == null ? Routes.login : Routes.home,
            getPages: AppPages.routes,
            builder: EasyLoading.init(),
          );
        }
        return MaterialApp();
      },
    );
  }
}
