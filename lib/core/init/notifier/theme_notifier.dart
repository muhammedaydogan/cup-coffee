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

    lightTheme = lightTheme.copyWith(
      textTheme: lightTheme.textTheme.copyWith(
        titleLarge: lightTheme.textTheme.titleLarge?.copyWith(
            color: Colors.black, fontSize: 28, fontWeight: FontWeight.w600),
        titleMedium: lightTheme.textTheme.titleMedium?.copyWith(
            color: Colors.black, fontSize: 24, fontWeight: FontWeight.w600),
        titleSmall: lightTheme.textTheme.titleLarge?.copyWith(
            color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),
      ),
    );
    // TODO: Also, make darktheme for this

    darkTheme = ThemeData.from(
      colorScheme: ThemeData().colorScheme.copyWith(
            primary: const Color(0xffffb067),
            secondary: const Color(0xFF314D45),
            brightness: Brightness.dark,
            error: const Color(0xffff2889),
          ),
    ).copyWith(scaffoldBackgroundColor: Colors.white);

    darkTheme = darkTheme.copyWith(
        textTheme: GoogleFonts.poppinsTextTheme(lightTheme.textTheme));
    // darkTheme = darkTheme.copyWith(
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
