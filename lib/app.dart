import 'package:flutter/material.dart';
import 'package:inno_net_app/core/constants/color_constants.dart';
import 'package:inno_net_app/core/constants/text_style_constants.dart';
import 'package:inno_net_app/presentation/screens/splash_screen/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'InnoNet',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.white,
        fontFamily: TextStyleConstants.fontFamily,
        useMaterial3: true,
        // app text color
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: AppColors.black,
          onPrimary: AppColors.black,
          secondary: AppColors.black,
          onSecondary: AppColors.white,
          error: AppColors.red,
          onError: AppColors.red,
          background: AppColors.black,
          onBackground: AppColors.black,
          surface: AppColors.black,
          onSurface: AppColors.black,
        ),
        // button theme
        buttonTheme: const ButtonThemeData(
            colorScheme: ColorScheme(
                brightness: Brightness.light,
                primary: AppColors.white,
                onPrimary: AppColors.white,
                secondary: AppColors.white,
                onSecondary: AppColors.white,
                error: AppColors.white,
                onError: AppColors.white,
                background: AppColors.white,
                onBackground: AppColors.white,
                surface: AppColors.white,
                onSurface: AppColors.white)),
        // text style
        textTheme: TextTheme(
          displayLarge: TextStyleConstants.displayLargeTextStyle,
          displaySmall: TextStyleConstants.displaySmallTextStyle,
          labelSmall: TextStyleConstants.labelSmallTextStyle,
        ),
      ),
      darkTheme: ThemeData(
        fontFamily: TextStyleConstants.fontFamily,
        brightness: Brightness.dark, // Set the background color to black
        scaffoldBackgroundColor: const Color.fromRGBO(0, 0, 0, 1),
        useMaterial3: true,
        // button theme
        buttonTheme: const ButtonThemeData(
            colorScheme: ColorScheme(
                brightness: Brightness.dark,
                primary: AppColors.white,
                onPrimary: AppColors.white,
                secondary: AppColors.white,
                onSecondary: AppColors.white,
                error: AppColors.white,
                onError: AppColors.white,
                background: AppColors.white,
                onBackground: AppColors.white,
                surface: AppColors.white,
                onSurface: AppColors.white)),
        // app color scheme
        colorScheme: const ColorScheme(
            brightness: Brightness.dark,
            primary: AppColors.black,
            onPrimary: AppColors.black,
            secondary: AppColors.white,
            onSecondary: AppColors.black,
            error: AppColors.red,
            onError: AppColors.red,
            background: AppColors.white,
            onBackground: AppColors.grey,
            surface: AppColors.white,
            onSurface: AppColors.white),

        // text style
        textTheme: TextTheme(
          displayLarge: TextStyleConstants.displayLargeTextStyle,
          displaySmall: TextStyleConstants.displaySmallTextStyle,
          labelSmall: TextStyleConstants.labelSmallTextStyle,
        ),
      ),
      themeMode: MediaQuery.platformBrightnessOf(context) == Brightness.dark
          ? ThemeMode.dark
          : ThemeMode.light,
      home: const SplashScreen(),
    );
  }
}
