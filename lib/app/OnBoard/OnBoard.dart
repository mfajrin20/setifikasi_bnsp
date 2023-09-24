// import 'package:flutter/material.dart';
// import 'package:introduction_screen/introduction_screen.dart';
// import 'app/Auth/Login.dart';
// import '../../Model/StyleModel.dart';
//
// class OnBoard extends StatelessWidget {
//   const OnBoard({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return IntroductionScreen(
//         pages: [
//           PageViewModel(
//             title: "Buku Kas Nusantara",
//             image: Image.asset(
//               'assets/images/onboard/undraw1.png',
//               width: 350,
//             ),
//             body:
//             "Sebuah Aplikasi yang akan membantu dalam proses pencatatan",
//             decoration: pageDecoration1,
//           ),
//           PageViewModel(
//             title: "Dapatkan Kemudahan Dalam Pencatatan Pemasukan dan Pengeluaran",
//             image: Image.asset(
//               'assets/images/onboard/undraw2.png',
//               width: 350,
//             ),
//             body:
//             "Memudahkan Pencatatan Lewat Aplikasi, lebih efesien",
//             decoration: pageDecoration,
//           ),
//           PageViewModel(
//             title: "Kolaborasi Metode Profile Matching dan Borda",
//             image: Image.asset(
//               'assets/images/onboard/undraw3.png',
//               width: 350,
//             ),
//             body:
//             "Mampu memberikan solusi dan kemudahan dalam proses pencatatan",
//             decoration: pageDecoration1,
//           ),
//         ],
//         onDone: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => const Login()),
//           );
//         },
//         showSkipButton: true,
//         dotsFlex: 0,
//         skip: const Text(
//           'Skip',
//           style: TextStyle(color: Colors.white),
//         ),
//         next: const Icon(Icons.arrow_forward,
//             color: Colors.white),
//         done: const Text(
//           'Done',
//           style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
//         ),
//         dotsDecorator: const DotsDecorator(
//           size: Size(10, 10),
//           color: Colors.white,
//           activeSize: Size(22, 10),
//           activeShape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.all(Radius.circular(30)),
//           ),
//         ),
//         dotsContainerDecorator: const BoxDecoration(
//           //color: Colors.white,
//           gradient: LinearGradient(
//             begin: Alignment.topRight,
//             end: Alignment.bottomLeft,
//             colors: [
//               Color.fromARGB(255, 89, 84, 229),
//               Color.fromARGB(255, 200, 158, 215),
//               Color.fromARGB(255, 89, 84, 229),
//             ],
//           ),
//           //borderRadius: BorderRadius.circular(100),
//           // borderRadius: BorderRadius.only(
//           //   topLeft: Radius.circular(30),
//           //   topRight: Radius.circular(30),
//           //   bottomLeft: Radius.circular(30),
//           //   bottomRight: Radius.circular(30),
//           // ),
//           // border: Border.all(width: 3, color: Colors.white),
//         )
//     );
//
//   }
// }
