import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color primaryColor = const Color(0xFF6067FF);
const Color complementary = const Color(0xFFbb5aee);
const Color complementary2 = const Color(0xFFf44dd3);
const Color complementary3 = const Color(0xFFff4db4);
const Color complementary4 = const Color(0xFFff5f95);
const Color complementary5 = const Color(0xFFfff860);
const Color grey3 = const Color(0xFFBBC1CE);

final ThemeData themeDataDark = ThemeData(
  colorScheme: appColorSchemeDark,
  primaryColor: appColorSchemeDark.primary,
  accentColor: appColorSchemeDark.secondary,
  appBarTheme: AppBarTheme(
    color: Colors.transparent,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.white),
    textTheme: appTextTheme.copyWith(
      headline6: GoogleFonts.montserrat(
          fontSize: 21, fontWeight: FontWeight.w500, letterSpacing: 0.15),
    ),
  ),
);

const appColorSchemeDark = const ColorScheme(
    primary: primaryColor,
    primaryVariant: Color(0xFFbb5aee),
    secondary: Color(0xFFbb5aee),
    secondaryVariant: Color(0xFFbb5aee),
    surface: Color(0xFFbb5aee),
    background: primaryColor,
    error: Color(0xFFbb5aee),
    onPrimary: Color(0xFFbb5aee),
    onSecondary: Color(0xFFbb5aee),
    onSurface: Color(0xFFbb5aee),
    onBackground: Color(0xFFbb5aee),
    onError: Color(0xFFbb5aee),
    brightness: Brightness.dark);

final TextTheme appTextTheme = TextTheme(
  headline1: GoogleFonts.montserrat(
      fontSize: 36,
      fontWeight: FontWeight.bold,
      letterSpacing: 0.25,
      color: primaryColor),
  subtitle1: GoogleFonts.montserrat(
      fontSize: 17,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.15,
      color: primaryColor),
  bodyText1: GoogleFonts.montserrat(
      fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5),
);
