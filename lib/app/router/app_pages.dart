import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:setifikasi_bnsp/app/pages/Auth/binding/login_binding.dart';
import 'package:setifikasi_bnsp/app/pages/Auth/login_page.dart';
import 'package:setifikasi_bnsp/app/pages/detail_cash_flow/detail_cash_flow_page.dart';
import 'package:setifikasi_bnsp/app/pages/pemasukan/binding/pemasukan_binding.dart';
import 'package:setifikasi_bnsp/app/pages/pemasukan/pemasukan_page.dart';
import 'package:setifikasi_bnsp/app/pages/pengaturan/binding/pengaturan_binding.dart';
import 'package:setifikasi_bnsp/app/pages/pengaturan/pengaturan_page.dart';
import 'package:setifikasi_bnsp/app/pages/pengeluaran/binding/pengeluaran_binding.dart';
import 'package:setifikasi_bnsp/app/pages/pengeluaran/pengeluaran_page.dart';
import 'package:setifikasi_bnsp/app/pages/Home/home_page.dart';

part './app_router.dart';

// final routerConfig = GoRouter(
//   routes: [
//     GoRoute(
//       path: '/',
//       name: Routes.home,
//       builder: (context, state) => HomePage(),
//       routes: [
//         GoRoute(
//           path: Routes.detailCashFlow,
//           name: Routes.detailCashFlow,
//           builder: (context, state) => DetailCashFlowPage(),
//         ),
//         GoRoute(
//           path: Routes.pemasukan,
//           name: Routes.pemasukan,
//           builder: (context, state) => PemasukanPage(),
//         ),
//         GoRoute(
//           path: Routes.pengeluaran,
//           name: Routes.pengeluaran,
//           builder: (context, state) => PengeluaranPage(),
//         ),
//         GoRoute(
//           path: Routes.pengaturan,
//           name: Routes.pengaturan,
//           builder: (context, state) => PengaturanPage(),
//         ),
//       ],
//     ),
//     GoRoute(
//       path: '/login',
//       name: Routes.login,
//       builder: (context, state) => LoginPage(),
//     ),
//   ],
// );

class AppPages {
  static final routes = [
    GetPage(
      name: _Paths.home,
      page: () => HomePage(),
    ),
    GetPage(
      name: _Paths.login,
      page: () => const LoginPage(),
      binding: Loginbinding(),
    ),
    GetPage(
      name: _Paths.pemasukan,
      page: () => PemasukanPage(),
      binding: PemasukanBinding(),
    ),
    GetPage(
      name: _Paths.detailCashflow,
      page: () => const DetailCashFlowPage(),
    ),
    GetPage(
      name: _Paths.pengeluaran,
      page: () => PengeluaranPage(),
      binding: PengeluaranBinding(),
    ),
    GetPage(
      name: _Paths.pengaturan,
      page: () => PengaturanPage(),
      binding: PengaturanBinding(),
    ),
  ];
}
