import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeNotifier extends ChangeNotifier {
  late ThemeData lightTheme;
  late ThemeData darkTheme;
  late ThemeMode themeMode;

  ThemeNotifier() {
    lightTheme = ThemeData.from(
      colorScheme: ThemeData().colorScheme.copyWith(
            primary: const Color(0xffffb067),
            secondary: const Color(0xFF314D45),
            brightness: Brightness.light,
            error: const Color(0xFFFF2842),
          ),
    ).copyWith(scaffoldBackgroundColor: Colors.white);

    lightTheme = lightTheme.copyWith(
      textTheme: GoogleFonts.poppinsTextTheme(lightTheme.textTheme),
    );

    darkTheme = ThemeData.from(
      colorScheme: ThemeData().colorScheme.copyWith(
            primary: const Color(0xffffb067),
            secondary: const Color(0xFF314D45),
            brightness: Brightness.dark,
            error: const Color(0xffff2889),
          ),
    );

    darkTheme = darkTheme.copyWith(
        textTheme: GoogleFonts.poppinsTextTheme(lightTheme.textTheme));
    // darkTheme = lightTheme.copyWith(
    //     textTheme: lightTheme.textTheme.copyWith(
    //         headlineMedium: lightTheme.textTheme.headlineMedium!
    //             .copyWith(color: Colors.lightGreenAccent)));

    themeMode = ThemeMode.system;
  }

  void changeThemeMode(ThemeMode themeMode) {
    this.themeMode = themeMode;
    notifyListeners();
  }
}
