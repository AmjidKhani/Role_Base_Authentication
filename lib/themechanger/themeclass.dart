import 'package:flutter/material.dart';
Color bluishClr=const Color(0xFF4e5ae8);
Color yellowClr=const Color(0xFFFF8746);
Color pinkClr=const Color(0xFFff4667);
Color white=Colors.white;
Color primaryClr=bluishClr;
Color darkGreyClr=const Color(0xFF121212);
Color darkHeaderClr=const Color(0xFF424242);
class Themes {
  static final lightmode =
  ThemeData(
    primarySwatch: Colors.blue,
    brightness: Brightness.light,

  );
  static final darkmode=
  ThemeData(
      primaryColor:darkGreyClr,
      //primaryColor: darkGreyClr,
      brightness: Brightness.dark
  );
}
