part of './app_pages.dart';

// abstract class Routes {
//   static const home = 'home';
//   static const login = 'login';
//   static const detailCashFlow = 'detailCashFlow';
//   static const pemasukan = 'pemasukan';
//   static const pengaturan = 'pengaturan';
//   static const pengeluaran = 'pengeluaran';
// }

abstract class _Paths {
  static const home = '/home';
  static const login = '/login';
  static const detailCashflow = '/detailCashflow';
  static const pemasukan = '/pemasukan';
  static const pengaturan = '/pengaturan';
  static const pengeluaran = '/pengeluaran';
}

abstract class Routes {
  static const home = _Paths.home;
  static const login = _Paths.login;
  static const detailCashflow = _Paths.detailCashflow;
  static const pemasukan = _Paths.pemasukan;
  static const pengaturan = _Paths.pengaturan;
  static const pengeluaran = _Paths.pengeluaran;
}
