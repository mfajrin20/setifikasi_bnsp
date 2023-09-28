import 'package:flutter/material.dart';
import 'package:setifikasi_bnsp/app/theme/app_theme.dart';

class ButtonWithGradient extends StatelessWidget {
  const ButtonWithGradient({
    super.key,
    required this.onPressed,
    this.child,
  });

  final VoidCallback? onPressed;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Container(
      alignment: Alignment.center,
      child: MaterialButton(
        onPressed: onPressed,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
        textColor: Colors.white,
        child: Container(
          constraints: BoxConstraints(
            minHeight: 50,
          ),
          padding: const EdgeInsets.symmetric(horizontal: kDeffaultPadding),
          alignment: Alignment.center,
          // height: 50.0,

          width: size.width * 0.5,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(80.0),
              gradient: const LinearGradient(
                  colors: [Color.fromARGB(255, 38, 132, 197), Color.fromARGB(255, 236, 209, 102)])),
          child: child,
        ),
      ),
    );
  }
}
