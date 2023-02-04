import 'dart:math';

import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  bool get isKeyBoardOpen => MediaQuery.of(this).viewInsets.bottom > 0;
}

extension MediaQueryExtension on BuildContext {
  double get height => mediaQuery.size.height;
  double get width => mediaQuery.size.width;

  double get veryLowValue => height * 0.005;
  double get lowValue => height * 0.01;
  double get normalValue => height * 0.02;
  double get mediumValue => height * 0.04;
  double get highValue => height * 0.08;

  double dynamicHeight(double factor) => height * factor;
  double dynamicWidth(double factor) => width * factor;
}

extension ThemeExtension on BuildContext {
  // ThemeData get theme => Theme.of(this);
  // TextTheme get textTheme => theme.textTheme;
  // ColorScheme get colors => theme.colorScheme;
  ThemeData get appTheme => Theme.of(this);
  TextTheme get textTheme => appTheme.textTheme;
  TextTheme get primaryTextTheme => appTheme.primaryTextTheme;

  ColorScheme get colorScheme => appTheme.colorScheme;
  MaterialColor get randomColor => Colors.primaries[Random().nextInt(17)];
}

extension PaddingExtension on BuildContext {
  EdgeInsets get paddingVeryLow => EdgeInsets.all(veryLowValue);
  EdgeInsets get paddingLow => EdgeInsets.all(lowValue);
  EdgeInsets get paddingNormal => EdgeInsets.all(normalValue);
  EdgeInsets get paddingMedium => EdgeInsets.all(mediumValue);
  EdgeInsets get paddingHigh => EdgeInsets.all(highValue);
}

extension PaddingExtensionSymetric on BuildContext {
  EdgeInsets get horizontalPaddingVeryLow =>
      EdgeInsets.symmetric(horizontal: veryLowValue);
  EdgeInsets get horizontalPaddingLow =>
      EdgeInsets.symmetric(horizontal: lowValue);
  EdgeInsets get horizontalPaddingNormal =>
      EdgeInsets.symmetric(horizontal: normalValue);
  EdgeInsets get horizontalPaddingMedium =>
      EdgeInsets.symmetric(horizontal: mediumValue);
  EdgeInsets get horizontalPaddingHigh =>
      EdgeInsets.symmetric(horizontal: highValue);

  EdgeInsets get verticalPaddingVeryLow =>
      EdgeInsets.symmetric(vertical: veryLowValue);
  EdgeInsets get verticalPaddingLow => EdgeInsets.symmetric(vertical: lowValue);

  EdgeInsets get verticalPaddingNormal =>
      EdgeInsets.symmetric(vertical: normalValue);
  EdgeInsets get verticalPaddingMedium =>
      EdgeInsets.symmetric(vertical: mediumValue);
  EdgeInsets get verticalPaddingHigh =>
      EdgeInsets.symmetric(vertical: highValue);
}

extension RadiusExtension on BuildContext {
  Radius get lowRadius => Radius.circular(width * 0.02);
  Radius get normalRadius => Radius.circular(width * 0.04);
  Radius get veryNormalRadius => Radius.circular(width * 0.06);
  Radius get highRadius => Radius.circular(width * 0.08);
  Radius get veryHighRadius => Radius.circular(width * 0.1);
}

// extension PageExtension on BuildContext {
//   Color get randomColor => Colors.primaries[Random().nextInt(17)];
// }

extension DurationExtension on BuildContext {
  Duration get lowDuration => const Duration(milliseconds: 500);
  Duration get normalDuration => const Duration(seconds: 1);
}
