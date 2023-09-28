import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

// Splash
const kSplash = TextStyle(
  fontSize: 24.0,
  fontWeight: FontWeight.w800,
  color: Colors.white,
  letterSpacing: 3,
  wordSpacing: 2,
);

const style = TextStyle(
  fontSize: 12,
  color: Colors.black,
  fontWeight: FontWeight.w600,
  letterSpacing: 1,
);

// Onboard
const pageDecoration = PageDecoration(
  titleTextStyle:
      TextStyle(fontSize: 24.0, fontWeight: FontWeight.w800, letterSpacing: 3, wordSpacing: 2),
  bodyTextStyle:
      TextStyle(fontSize: 12.0, fontWeight: FontWeight.w500, letterSpacing: 2, wordSpacing: 2),
  bodyPadding: EdgeInsets.all(16),
  boxDecoration: BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [
        Color.fromARGB(255, 89, 84, 229),
        Color.fromARGB(255, 200, 158, 215),
      ],
    ),
    // color: Colors.black54,
    boxShadow: [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 20,
        offset: Offset(5, 5),
      ),
    ],
  ),
  imagePadding: EdgeInsets.zero,
);
const kOnboard = TextStyle(fontWeight: FontWeight.bold);
const pageDecoration1 = PageDecoration(
  titleTextStyle:
      TextStyle(fontSize: 24.0, fontWeight: FontWeight.w800, letterSpacing: 3, wordSpacing: 2),
  bodyTextStyle:
      TextStyle(fontSize: 12.0, fontWeight: FontWeight.w500, letterSpacing: 2, wordSpacing: 2),
  bodyPadding: EdgeInsets.all(16),
);

// Data Hasil
const kTittle = TextStyle(
  fontSize: 25,
  fontWeight: FontWeight.w600,
  letterSpacing: 1,
  wordSpacing: 1,
);

const kColumn = TextStyle(
  fontSize: 15,
  color: Colors.black,
  fontWeight: FontWeight.w600,
  letterSpacing: 1,
  wordSpacing: 2,
);

const kRow = TextStyle(
  fontSize: 12,
  color: Colors.black,
  fontWeight: FontWeight.w400,
  letterSpacing: 1,
  wordSpacing: 2,
);

// Profile Matching
const kTittlePm = TextStyle(
  color: Colors.white,
  fontSize: 25,
  fontWeight: FontWeight.w600,
  letterSpacing: 1,
  wordSpacing: 2,
);

const kTittleP = TextStyle(color: Colors.black54, fontSize: 12, fontWeight: FontWeight.bold);

// kriteria
const kTittleK = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w800,
  letterSpacing: 1,
  wordSpacing: 2,
);

const kKriteriaColum = TextStyle(
    fontSize: 10,
    color: Colors.black,
    fontWeight: FontWeight.w600,
    letterSpacing: 1,
    wordSpacing: 2);

const kKriteriaRow = TextStyle(
  fontSize: 10,
  color: Colors.black,
  fontWeight: FontWeight.w400,
  letterSpacing: 1,
  wordSpacing: 1,
);

const kTittleKk = TextStyle(
  fontSize: 25,
  color: Colors.white,
  fontWeight: FontWeight.w600,
  letterSpacing: 1,
  wordSpacing: 2,
);

const kTittleButton = TextStyle(
  fontSize: 16,
  color: Colors.white,
  fontWeight: FontWeight.w600,
  letterSpacing: 1,
  wordSpacing: 2,
);

// Home
const kHome = TextStyle(
  fontSize: 10,
  fontWeight: FontWeight.w400,
  letterSpacing: 1.5,
  wordSpacing: 2,
);

// Account

const kTittleAccount = TextStyle(
  fontSize: 15,
  color: Colors.black87,
  fontWeight: FontWeight.w800,
  letterSpacing: 3,
  wordSpacing: 2,
);

//SIGN IN
const kTittleSignIn = TextStyle(
  fontSize: 18,
  color: Colors.white,
  fontWeight: FontWeight.w600,
  letterSpacing: 3,
  wordSpacing: 2,
);
//Home
const kTittleHome = TextStyle(
  fontSize: 15,
  color: Colors.white,
  fontWeight: FontWeight.w600,
  letterSpacing: 1,
  wordSpacing: 2,
);

const kSubTittleHome = TextStyle(
  fontSize: 12,
  color: Colors.white,
  fontWeight: FontWeight.w600,
  letterSpacing: 1,
  wordSpacing: 2,
);

const kTittleHomee = TextStyle(
  fontSize: 18,
  color: Colors.black,
  fontWeight: FontWeight.w600,
  letterSpacing: 1,
  wordSpacing: 2,
);

const dropDown = TextStyle(
  fontSize: 20,
  color: Colors.black,
  fontWeight: FontWeight.w600,
  letterSpacing: 1,
  wordSpacing: 2,
);

const kSubTittleeHome = TextStyle(
  fontSize: 12,
  color: Colors.black,
  fontWeight: FontWeight.w600,
  letterSpacing: 1,
  wordSpacing: 2,
);

//SIGN UP
const kTittleButtonAuth = TextStyle(
  fontSize: 18,
  color: Colors.white,
  fontWeight: FontWeight.w600,
  letterSpacing: 3,
  wordSpacing: 2,
);

const kEssayButtonAuth = TextStyle(
  fontSize: 12,
  color: Color(0xFF2661FA),
  fontWeight: FontWeight.w600,
  letterSpacing: 1,
  wordSpacing: 2,
);

const kForgetAuth = TextStyle(
  fontSize: 12,
  color: Color(0xFF2661FA),
  fontWeight: FontWeight.w400,
  letterSpacing: 1,
  wordSpacing: 2,
);

const kLogin = TextStyle(
  fontSize: 18,
  color: Colors.white,
  fontWeight: FontWeight.w600,
  letterSpacing: 3,
  wordSpacing: 2,
);

const kSignUp = TextStyle(
  fontSize: 12,
  color: Color(0xFF2661FA),
  fontWeight: FontWeight.w600,
  letterSpacing: 1,
  wordSpacing: 2,
);

const kKogin = TextStyle(
  fontSize: 24,
  color: Colors.black54,
  fontWeight: FontWeight.w800,
  letterSpacing: 3,
  wordSpacing: 2,
);

const Seeting = TextStyle(
  fontSize: 20,
  color: Colors.black,
  fontWeight: FontWeight.w800,
  letterSpacing: 3,
  wordSpacing: 2,
);

const Seeting2 = TextStyle(
  fontSize: 20,
  color: Colors.black,
  fontWeight: FontWeight.w800,
  letterSpacing: 3,
  wordSpacing: 2,
);

const Seeting3 = TextStyle(
  fontSize: 20,
  color: Colors.black,
  fontWeight: FontWeight.w800,
  letterSpacing: 3,
  wordSpacing: 2,
);

//log out
const kLogout = TextStyle(
  fontSize: 12,
  color: Colors.black,
  fontWeight: FontWeight.w600,
  letterSpacing: 1,
  wordSpacing: 2,
);

const kLogoutT = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.w600,
  letterSpacing: 1,
  wordSpacing: 2,
);

const kLogoutC = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.w600,
  letterSpacing: 1,
  wordSpacing: 2,
);

// Hasil PM dan Borda
const kHasilPB = TextStyle(
  fontSize: 15,
  color: Colors.white,
  fontWeight: FontWeight.w600,
  letterSpacing: 5,
);
