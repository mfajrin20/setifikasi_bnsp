import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tabler_icons/tabler_icons.dart';
// import 'package:tugas1/app/Auth/controller/auth_controller.dart';
// import 'package:tugas1/controller/global_controller.dart';
// import '../../../../../data/models/style_model.dart';
// import '../../../../../routes/app_routes.dart';
import '../../Model/StyleModel.dart';
import '../Home/Beranda.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/icons/login.png',
                  height: 200,
                ),
                SizedBox(height: size.height * 0.03),
                // Container(
                //   alignment: Alignment.centerLeft,
                //   padding: const EdgeInsets.symmetric(horizontal: 40),
                //   child: const Text(
                //     "LOGIN",
                //     style: kKogin,
                //     textAlign: TextAlign.left,
                //   ),
                // ),
                SizedBox(height: size.height * 0.03),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Form(
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Email harus di isi";
                            }
                            if (!GetUtils.isEmail(value)) {
                              return "Email tidak valid";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            labelText: "Email",
                            icon: Icon(
                              TablerIcons.user,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                        SizedBox(height: size.height * 0.03),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: "Password",
                            icon: const Icon(
                              TablerIcons.password,
                              color: Colors.black54,
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Password harus di isi";
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.05),
                Container(
                  alignment: Alignment.centerRight,
                  margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: MaterialButton(
                    onPressed: () async {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Beranda()));
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80.0)),
                    textColor: Colors.white,
                    padding: const EdgeInsets.all(0),
                    child: Container(
                      alignment: Alignment.center,
                      height: 50.0,
                      width: size.width * 0.5,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(80.0),
                          gradient: const LinearGradient(colors: [
                            Color.fromARGB(255, 38, 132, 197),
                            Color.fromARGB(255, 236, 209, 102)
                          ])),
                      padding: const EdgeInsets.all(0),
                      child: const Text(
                        "LOGIN",
                        textAlign: TextAlign.center,
                        style: kLogin,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

