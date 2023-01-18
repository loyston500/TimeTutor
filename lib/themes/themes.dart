import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class ThemeSet {
  ThemeData light;
  ThemeData dark;

  ThemeSet(this.light, this.dark);
}

class Themes {
  Themes._();

  static ThemeData light = FlexThemeData.light(
    colors: const FlexSchemeColor(
      primary: Color(0xff004881),
      primaryContainer: Color(0xffd0e4ff),
      secondary: Color(0xffac3306),
      secondaryContainer: Color(0xffffdbcf),
      tertiary: Color(0xff006875),
      tertiaryContainer: Color(0xff95f0ff),
      appBarColor: Color(0xffffdbcf),
      error: Color(0xffb00020),
    ),
    usedColors: 1,
    surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
    tabBarStyle: FlexTabBarStyle.forBackground,
    blendLevel: 9,
    subThemesData: const FlexSubThemesData(
      blendOnLevel: 10,
      blendOnColors: false,
      textButtonSchemeColor: SchemeColor.secondary,
      elevatedButtonSchemeColor: SchemeColor.secondary,
      outlinedButtonSchemeColor: SchemeColor.secondary,
      toggleButtonsSchemeColor: SchemeColor.secondary,
      switchSchemeColor: SchemeColor.secondary,
      checkboxSchemeColor: SchemeColor.secondary,
      radioSchemeColor: SchemeColor.secondary,
      //sliderBaseSchemeColor: SchemeColor.secondary,
      inputDecoratorRadius: 40.0,
      //inputDecoratorBorderWidth: 1.0,
      //inputDecoratorFocusedBorderWidth: 1.0,
      bottomNavigationBarSelectedLabelSchemeColor: SchemeColor.secondary,
      bottomNavigationBarSelectedIconSchemeColor: SchemeColor.secondary,
      bottomNavigationBarBackgroundSchemeColor: SchemeColor.surface,
    ),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    useMaterial3: true,
    fontFamily: GoogleFonts.oswald().fontFamily,
  );

  static ThemeData dark = FlexThemeData.dark(
    colors: const FlexSchemeColor(
      primary: Color(0xff9c27b0),
      primaryContainer: Color(0xff7c4dff),
      secondary: Color(0xffff5252),
      secondaryContainer: Color(0xff291749),
      tertiary: Color(0xff7c4dff),
      tertiaryContainer: Color(0xff7c4dff),
      appBarColor: Color(0xff291749),
      error: Color(0xffcf6679),
    ),
    usedColors: 1,
    surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
    tabBarStyle: FlexTabBarStyle.forBackground,
    blendLevel: 15,
    appBarStyle: FlexAppBarStyle.surface,
    darkIsTrueBlack: true,
    subThemesData: const FlexSubThemesData(
      blendOnLevel: 19,
      textButtonSchemeColor: SchemeColor.secondary,
      elevatedButtonSchemeColor: SchemeColor.secondary,
      outlinedButtonSchemeColor: SchemeColor.secondary,
      toggleButtonsSchemeColor: SchemeColor.secondary,
      switchSchemeColor: SchemeColor.secondary,
      checkboxSchemeColor: SchemeColor.secondary,
      radioSchemeColor: SchemeColor.secondary,
      //sliderBaseSchemeColor: SchemeColor.secondary,
      inputDecoratorSchemeColor: SchemeColor.secondary,
      inputDecoratorRadius: 40.0,
      //inputDecoratorBorderWidth: 1.0,
      //inputDecoratorFocusedBorderWidth: 1.0,
      bottomNavigationBarSelectedLabelSchemeColor: SchemeColor.secondary,
      bottomNavigationBarSelectedIconSchemeColor: SchemeColor.secondary,
      bottomNavigationBarBackgroundSchemeColor: SchemeColor.surface,
    ),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    useMaterial3: true,
    fontFamily: GoogleFonts.oswald().fontFamily,
  );

  // This theme was made for FlexColorScheme version 6.1.1. Make sure
// you use same or higher version, but still same major version. If
// you use a lower version, some properties may not be supported. In
// that case you can also remove them after copying the theme to your app.
  static ThemeData cyberpunkLight = FlexThemeData.light(
    colors: const FlexSchemeColor(
      primary: Color(0xfffcee03),
      primaryContainer: Color(0xff000000),
      secondary: Color(0xff03d8f3),
      secondaryContainer: Color(0xff448aff),
      tertiary: Color(0xfffcee03),
      tertiaryContainer: Color(0xff448aff),
      appBarColor: Color(0xff03d8f3),
      error: Color(0xffcf6679),
    ),
    usedColors: 2,
    surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
    blendLevel: 9,
    tabBarStyle: FlexTabBarStyle.forBackground,
    subThemesData: const FlexSubThemesData(
      blendOnLevel: 10,
      blendOnColors: false,
      textButtonSchemeColor: SchemeColor.secondary,
      elevatedButtonSchemeColor: SchemeColor.secondary,
      outlinedButtonSchemeColor: SchemeColor.secondary,
      toggleButtonsSchemeColor: SchemeColor.secondary,
      switchSchemeColor: SchemeColor.secondary,
      checkboxSchemeColor: SchemeColor.secondary,
      radioSchemeColor: SchemeColor.secondary,
      //sliderBaseSchemeColor: SchemeColor.secondary,
      inputDecoratorRadius: 40.0,
      //inputDecoratorBorderWidth: 1.0,
      //inputDecoratorFocusedBorderWidth: 1.0,
      //tooltipSchemeColor: SchemeColor.primary,
      bottomNavigationBarSelectedLabelSchemeColor: SchemeColor.secondary,
      bottomNavigationBarSelectedIconSchemeColor: SchemeColor.secondary,
      bottomNavigationBarBackgroundSchemeColor: SchemeColor.surface,
    ),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    useMaterial3: true,
    fontFamily: "CyberPunk",
  );

  static ThemeData cyberpunkDark = FlexThemeData.dark(
    colors: const FlexSchemeColor(
      primary: Color(0xfffcee03),
      primaryContainer: Color(0xff000000),
      secondary: Color(0xff03d8f3),
      secondaryContainer: Color(0xff448aff),
      tertiary: Color(0xfffcee03),
      tertiaryContainer: Color(0xff448aff),
      appBarColor: Color(0xff03d8f3),
      error: Color(0xffcf6679),
    ),
    usedColors: 2,
    appBarStyle: FlexAppBarStyle.surface,
    tabBarStyle: FlexTabBarStyle.forBackground,
    darkIsTrueBlack: true,
    subThemesData: const FlexSubThemesData(
      blendOnLevel: 19,
      textButtonSchemeColor: SchemeColor.secondary,
      elevatedButtonSchemeColor: SchemeColor.secondary,
      outlinedButtonSchemeColor: SchemeColor.secondary,
      toggleButtonsSchemeColor: SchemeColor.secondary,
      switchSchemeColor: SchemeColor.secondary,
      checkboxSchemeColor: SchemeColor.secondary,
      radioSchemeColor: SchemeColor.secondary,
      //sliderBaseSchemeColor: SchemeColor.secondary,
      inputDecoratorSchemeColor: SchemeColor.secondary,
      inputDecoratorRadius: 40.0,
      //inputDecoratorBorderWidth: 1.0,
      //inputDecoratorFocusedBorderWidth: 1.0,
      //tooltipSchemeColor: SchemeColor.primary,
      bottomNavigationBarSelectedLabelSchemeColor: SchemeColor.secondary,
      bottomNavigationBarSelectedIconSchemeColor: SchemeColor.secondary,
      bottomNavigationBarBackgroundSchemeColor: SchemeColor.surface,
    ),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    useMaterial3: true,
    fontFamily: "CyberPunk",
  );

  static ThemeData themeFromPrimaryColor(Color primaryColor, ThemeMode type) {
    if (type == ThemeMode.dark) {
      return FlexThemeData.dark(
        colors: FlexSchemeColor(
          primary: primaryColor,
          //primaryContainer: Color(0xff7c4dff),
          secondary: primaryColor,
          //secondaryContainer: Color(0xff291749),
          //tertiary: Color(0xff7c4dff),
          //tertiaryContainer: Color(0xff7c4dff),
          //appBarColor: Color(0xff291749),
          //error: Color(0xffcf6679),
        ),
        usedColors: 1,
        surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
        tabBarStyle: FlexTabBarStyle.forBackground,
        blendLevel: 15,
        appBarStyle: FlexAppBarStyle.surface,
        darkIsTrueBlack: true,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 19,
          textButtonSchemeColor: SchemeColor.secondary,
          elevatedButtonSchemeColor: SchemeColor.secondary,
          outlinedButtonSchemeColor: SchemeColor.secondary,
          toggleButtonsSchemeColor: SchemeColor.secondary,
          switchSchemeColor: SchemeColor.secondary,
          checkboxSchemeColor: SchemeColor.secondary,
          radioSchemeColor: SchemeColor.secondary,
          //sliderBaseSchemeColor: SchemeColor.secondary,
          inputDecoratorSchemeColor: SchemeColor.secondary,
          inputDecoratorRadius: 40.0,
          //inputDecoratorBorderWidth: 1.0,
          //inputDecoratorFocusedBorderWidth: 1.0,
          bottomNavigationBarSelectedLabelSchemeColor: SchemeColor.secondary,
          bottomNavigationBarSelectedIconSchemeColor: SchemeColor.secondary,
          bottomNavigationBarBackgroundSchemeColor: SchemeColor.surface,
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
        fontFamily: GoogleFonts.oswald().fontFamily,
      );
    } else {
      return FlexThemeData.light(
        colors: FlexSchemeColor(
          primary: primaryColor,
          //primaryContainer: Color(0xffd0e4ff),
          secondary: primaryColor,
          //secondaryContainer: Color(0xffffdbcf),
          //tertiary: Color(0xff006875),
          //tertiaryContainer: Color(0xff95f0ff),
          //appBarColor: Color(0xffffdbcf),
          //error: Color(0xffb00020),
        ),
        usedColors: 1,
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        tabBarStyle: FlexTabBarStyle.forBackground,
        blendLevel: 9,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 10,
          blendOnColors: false,
          textButtonSchemeColor: SchemeColor.secondary,
          elevatedButtonSchemeColor: SchemeColor.secondary,
          outlinedButtonSchemeColor: SchemeColor.secondary,
          toggleButtonsSchemeColor: SchemeColor.secondary,
          switchSchemeColor: SchemeColor.secondary,
          checkboxSchemeColor: SchemeColor.secondary,
          radioSchemeColor: SchemeColor.secondary,
          //sliderBaseSchemeColor: SchemeColor.secondary,
          inputDecoratorRadius: 40.0,
          //inputDecoratorBorderWidth: 1.0,
          //inputDecoratorFocusedBorderWidth: 1.0,
          bottomNavigationBarSelectedLabelSchemeColor: SchemeColor.secondary,
          bottomNavigationBarSelectedIconSchemeColor: SchemeColor.secondary,
          bottomNavigationBarBackgroundSchemeColor: SchemeColor.surface,
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
        fontFamily: GoogleFonts.oswald().fontFamily,
      );
    }
  }

  static Map<String, ThemeSet> themes = {
    "cyberpunk": ThemeSet(cyberpunkLight, cyberpunkDark),
  };
}
